import { Schema, model } from 'mongoose';
import encrypt from 'mongoose-encryption';
import { IUserDocument } from '../types/UserTypes';

const userSchema = new Schema<IUserDocument>(
  {
    fullName: { type: String, required: true, trim: true },
    firstName: { type: String, required: true, trim: true },
    lastName: { type: String, required: true, trim: true },
    idNumber: { type: String, required: true, trim: true },
    company: { type: String, required: true },
    section: { type: String, required: true },
    phoneNumber: { type: String, required: false },
    armyRole: { type: String, required: false },
    picture: { type: String, required: false },
    email: { type: String, required: false, unique: true, lowercase: true, trim: true },
    role: { type: String, default: 'user' },
    accessToken: { type: String },
    refreshToken: { type: String },
    tokenExpiryDate: { type: Date },
  },
  { timestamps: true }
);

const encKey = process.env.ENC_KEY;
const sigKey = process.env.SIG_KEY;

if (!encKey || !sigKey) {
  throw new Error('Encryption keys (ENC_KEY and SIG_KEY) must be set in environment variables.');
}

const encKeyBuffer = Buffer.from(encKey, 'base64');
const sigKeyBuffer = Buffer.from(sigKey, 'base64');

if (encKeyBuffer.length !== 32) {
  throw new Error('ENC_KEY must be 32 bytes after base64 decoding.');
}
if (sigKeyBuffer.length !== 64) {
  throw new Error('SIG_KEY must be 64 bytes after base64 decoding.');
}

userSchema.plugin(encrypt, {
  encryptionKey: encKey,
  signingKey: sigKey,
  encryptedFields: ['accessToken', 'refreshToken'],
  requireAuthenticationCode: false,
});

const User = model<IUserDocument>('users', userSchema);
export default User;
