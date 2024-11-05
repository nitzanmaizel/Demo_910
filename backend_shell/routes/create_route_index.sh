#!/bin/bash
# Ensure backend config directory exists
mkdir -p backend/src/routes

# Create index.ts file with content
cat <<EOL > backend/src/routes/index.ts
import { Router } from 'express';
import authRoute from './auth';
import userRoute from './user';
import { authenticateJWT, refreshTokenMiddleware } from '../middleware';

const router = Router();

router.use('/auth', authRoute);

router.use(authenticateJWT, refreshTokenMiddleware);
router.use('/user', userRoute);

export default router;
EOL