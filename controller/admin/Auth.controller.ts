import bcrypt from "bcrypt";
import jwt from 'jsonwebtoken';
import { CreateAdmin, getAdmin } from "../../model/admin/admin";

export const RegisterAdmin =async (name:string,email:string,phone:string,password:string) => {
    try{
            let hashpassword = bcrypt.hashSync(password,10);
                return await CreateAdmin(name,email,phone,hashpassword)
    }catch(e:any){
        return {status:"error",message:e.message}
    }
}
export const loginAdmin  =async (email:string,password:string) => {
    try{
        let checkUser= await getAdmin(email);
        if(checkUser.status == "error"){
            return {status:checkUser.status, message:checkUser.message}
        }
        let checkPassword =  bcrypt.compareSync(password,checkUser.message?.password);
        if(!checkPassword){
            return {status:"error",message:"incorrect password"}
        }
        let  key:string = process.env.APP_KEY!
        let createtoken = jwt.sign({userid:checkUser.message.id},key,{expiresIn:"7d"})
        return {status:"success",message:"user logged in", token:createtoken}

    }catch(e:any){
        return {status:"error",message:e.message}
    }
}