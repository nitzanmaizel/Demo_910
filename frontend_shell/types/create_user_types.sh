#!/bin/bash
mkdir -p frontend/src/types

# Create UserTypes.tsx file with content
cat <<EOL > frontend/src/types/UserTypes.ts
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

export interface RIUsersType {
  users: IUser[];
  limit: number;
  page: number;
  total: number;
}

export type UserContextType = {
  userInfo: IUser | null;
  loading: boolean;
  error: string | null;
  login: () => void;
  logout: () => void;
};
EOL