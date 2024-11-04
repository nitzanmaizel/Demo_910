#!/bin/bash
# Ensure backend config directory exists
mkdir -p backend/src/services

# Create authServices.ts file with content
cat <<EOL > backend/src/services/authServices.ts
import { oAuth2Client } from '../config/oauth2Client';
import User from '../models/UserModal';

export const refreshAccessToken = async (email: string): Promise<void> => {
  const user = await User.findOne({ email });

  if (!user || !user.refreshToken) {
    throw new Error('User not found or refresh token missing');
  }

  oAuth2Client.setCredentials({ refresh_token: user.refreshToken });

  try {
    const { credentials } = await oAuth2Client.refreshAccessToken();

    user.accessToken = credentials.access_token!;
    user.tokenExpiryDate = credentials.expiry_date ? new Date(credentials.expiry_date) : undefined;

    await user.save();
  } catch (error) {
    console.error('Error refreshing access token:', error);
    throw new Error('Could not refresh access token');
  }
};
EOL