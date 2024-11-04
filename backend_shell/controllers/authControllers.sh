#!/bin/bash
# Ensure backend config directory exists
mkdir -p backend/src/controllers

# Create index.ts file with content
cat <<EOL > backend/src/controllers/authControllers.ts
import { Request, Response } from "express";
import { google } from "googleapis";
import jwt from "jsonwebtoken";

import { oAuth2Client, SCOPES } from "../config/oauth2Client";
import User from "../models/UserModal";

const jwtSecret = process.env.JWT_SECRET as string;
const frontendUrl = process.env.FRONTEND_URL as string;

export const login = (_req: Request, res: Response) => {
  const authUrl = oAuth2Client.generateAuthUrl({
    access_type: "offline",
    scope: SCOPES,
    prompt: "consent",
  });
  res.redirect(authUrl);
};

export const googleCallback = async (req: Request, res: Response): Promise<void> => {
  const code = req.query.code as string;

  if (!code) {
    res.status(400).send("Authorization code not provided");
    return;
  }

  try {
    const { tokens } = await oAuth2Client.getToken(code);

    oAuth2Client.setCredentials(tokens);

    const oauth2 = google.oauth2({ auth: oAuth2Client, version: "v2" });
    const userInfo = await oauth2.userinfo.get();

    const { email, picture } = userInfo.data;

    const user = await User.findOne({ email });

    if (!user || user.role !== "admin") {
      res.redirect(\`\${frontendUrl}/admin/unauthorized\`);
      return;
    }

    user.accessToken = tokens.access_token!;
    user.refreshToken = tokens.refresh_token || user.refreshToken;
    user.tokenExpiryDate = tokens.expiry_date
      ? new Date(tokens.expiry_date)
      : undefined;

    await user.save();

     const jwtUser = {
      idNumber: user.idNumber,
      fullName: user.fullName,
      firstName: user.firstName,
      lastName: user.lastName,
      company: user.company,
      section: user.section,
      phoneNumber: user.phoneNumber || '',
      armyRole: user.armyRole || '',
      email: user.email || '',
      role: user.role,
      picture: user.picture || picture,
    };

    const jwtToken = jwt.sign(jwtUser, jwtSecret, { expiresIn: "7d" });

    res.redirect(\`\${frontendUrl}?token=\${jwtToken}\`);
  } catch (error) {
    console.error("Error exchanging code for token:", error);
    res.status(500).send("Authentication failed");
  }
};

export const getProfile = async (req: Request ,res: Response): Promise<void> => {
  try {
    const user = req.user;
    if (!user) {
      res.status(401).send("User not authenticated");
      return;
    }
    res.json(user);
  } catch (error) {
    console.error("Error fetching profile or files:", error);
    res.status(500).send("Failed to fetch profile");
  }
};
EOL