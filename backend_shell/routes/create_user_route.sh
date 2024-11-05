#!/bin/bash
# Ensure backend config directory exists
mkdir -p backend/src/routes

# Create index.ts file with content
cat <<EOL > backend/src/routes/user.ts
import { Router } from 'express';
import {
  createUser,
  getAllUsers,
  getUserById,
  updateUser,
  deleteUser,
  getUserByEmail,
} from '../controllers/userControllers';

const router: Router = Router();

router.post('/', createUser);
router.get('/', getAllUsers);
router.get('/:id', getUserById);
router.get('/:email', getUserByEmail);
router.put('/:id', updateUser);
router.delete('/:id', deleteUser);

export default router;
EOL