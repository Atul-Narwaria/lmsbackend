import { Request, Response, Router } from 'express';
import { isAdmin, validateToken } from '../../middleware/authMiddleware';
import { DesignationCreateSchema } from '../../middleware/requestValidation';
import { createDesignation } from '../../model/public/designation';

export const designationRoutes = Router();

designationRoutes.post('/create',validateToken,isAdmin,async (req:Request,res:Response) => {
    try{
        const {error,value} = DesignationCreateSchema.validate(req.body,{
            abortEarly:false
        })
        if(error){
            return res.status(200).json({status:"error",message:error.message});
        }
        const {name} = req.body;
        let create = await createDesignation(name);
        return res.status(200).json(create);
    }catch(e:any){
        return res.status(200).json({status:"error",message:e.message});
    }
})