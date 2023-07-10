import { Request, Response, Router } from 'express';
import { AdminLogin, AdminRegistration } from '../middleware/requestValidation';
import { RegisterAdmin, loginAdmin } from '../controller/admin/Auth.controller';

export const AuthRoutes = Router();

AuthRoutes.post('/admin/registration', async(req:Request,res:Response) => {
  try{
        const {name,email,phone,password} = req.body
        const reqError = AdminRegistration.validate(req.body);
        if(reqError?.error){
          return res.status(200).json({status:"error", message:reqError.error?.message});
        }
        return res.status(200).json(await RegisterAdmin(name,email,phone,password))
  }catch(e:any){
    return res.status(500).json({"status":"error",message:e.message});
  }
});
AuthRoutes.post('/admin/login',async (req:Request,res:Response) => {
  try{
    const {email,password} = req.body;
    const {error,value}  = AdminLogin.validate(req.body);
    if(error){
      return res.status(200).json({status:"error", message:error?.message});
    }
    let login = await loginAdmin(email,password)
    return res.status(200).json(login)
  }catch(e:any){
    return res.status(500).json({"status":"error",message:e.message});
  }
})