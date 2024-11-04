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
