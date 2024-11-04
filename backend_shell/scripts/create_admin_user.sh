#!/bin/bash
# Ensure backend config directory exists
mkdir -p backend/src/scripts

cat <<EOL > backend/src/scripts/createAdminUser.ts
import User from '../models/UserModal';

export async function ensureAdminUser() {
  const adminEmail = process.env.ADMIN_EMAIL || 'nitzanmaizel@gmail.com';
  const adminRole = 'admin';

  try {
    const user = await User.findOne({ email: adminEmail });

    if (user) {
      console.log('❌ Admin user already exists.');
      return;
    }

    const adminUser = new User({
      fullName: 'Nitzan Maizel',
      firstName: 'Nitzan',
      lastName: 'Maizel',
      idNumber: '7592921',
      company: 'פלס"ם',
      section: 'אג"ם',
      email: adminEmail,
      role: adminRole,
    });

    await adminUser.save();
    console.log('✅ Default admin user created.');
  } catch (error) {
    console.error('❌ Error checking or creating admin user:', error);
  }
}
EOL