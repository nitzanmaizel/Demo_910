#!/bin/bash
# Ensure backend config directory exists
mkdir -p backend/src/middleware

# Create authenticateJWT.ts file with content
cat <<EOL > backend/src/middleware/authenticateJWT.ts
import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

const JWT_SECRET = process.env.JWT_SECRET as string;

if (!JWT_SECRET) {
  throw new Error("Missing required environment variable");
}

export function authenticateJWT(req: Request, res: Response, next: NextFunction): void {
  const authHeader = req.headers.authorization;

  if (!authHeader) {
    res.status(401).json({ error: "No token provided" });
    return;
  }

  const parts = authHeader.split(" ");

  if (parts.length !== 2) {
    res.status(401).json({ error: "Token error" });
    return;
  }

  const [scheme, token] = parts;

  if (!/^Bearer$/i.test(scheme)) {
    res.status(401).json({ error: "Token malformed" });
    return;
  }

  jwt.verify(token, JWT_SECRET, (err, decoded: any) => {
    if (err) {
      res.status(401).json({ error: "Token invalid" });
      return;
    }

    req.user = {
      idNumber: decoded.idNumber,
      fullName: decoded.fullName,
      firstName: decoded.firstName,
      lastName: decoded.lastName,
      company: decoded.company,
      section: decoded.section,
      email: decoded.email,
      picture: decoded.picture,
      role: decoded.role,
    };

    next();
  });
}

EOL