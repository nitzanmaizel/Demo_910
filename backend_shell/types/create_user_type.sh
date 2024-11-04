#!/bin/bash
# Ensure backend config directory exists
mkdir -p backend/src/types

# Create UserTypes.ts file with content
cat <<EOL > backend/src/types/UserTypes.ts
import { Document } from "mongoose";

export type UserRole = "user" | "admin" | "fullAdmin";

export interface IUser {
  idNumber: string;
  fullName: string;
  firstName: string;
  lastName: string;
  company: string;
  section: string;
  phoneNumber?: string;
  armyRole?: string;
  email?: string;
  role: UserRole;
  picture?: string;
  accessToken?: string;
  refreshToken?: string;
  tokenExpiryDate?: Date;
}

export interface IUserDocument extends IUser, Document {}
EOL