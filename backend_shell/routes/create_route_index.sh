#!/bin/bash
# Ensure backend config directory exists
mkdir -p backend/src/routes

# Create index.ts file with content
cat <<EOL > backend/src/routes/index.ts
import { Router } from 'express';
import authRoute from './auth';

const router = Router();

router.use('/auth', authRoute);

export default router;
EOL