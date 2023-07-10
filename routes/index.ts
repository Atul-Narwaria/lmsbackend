import { Router } from 'express';
import { AuthRoutes } from './auth.routes';
import { designationRoutes } from './public/designation.routes';
import { salesTeamRoutes } from './sales_team/salesteam.routes';

export const APIRoutes = Router();

APIRoutes.get('/', (req, res) => {
  res.send("Inside API call");
});

APIRoutes.use('/auth',AuthRoutes);
APIRoutes.use('/designation',designationRoutes);
APIRoutes.use('/sales_team',salesTeamRoutes);