import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient();

export const CreateAdmin =async (name:string,email:string,phone:string,password:string) => {
    try{
        await prisma.admin.create({
            data:{
                name:name,
                email:email,
                phone:phone,
                password:password, 
                status:true
            }
        })
        return {status:"success",message:"admin crated successfully"}
    }catch(e:any){
        return {status:"error",message:e.message}
    }
}



export const getAdmin =async (email:string) => {
    try{
        const get:any = await prisma.admin.findFirst({
            select:{
                id:true,
                name:true,
                email:true,
                password:true,
                phone:true
            },
            where:{
                email:email
            }
        })
        if(!get){
            return {status:"error",message:"no user found"}
        }
        return {status:"success",message:get}
    }catch(e:any){
        return {status:"error",message:e.message}
    }
}

export const CheckAdminExistance =async (id:string) => {
    try{
        return await prisma.admin.count({
            where:{id:id}
        })
    }catch(e:any){
        return {status:"error",message:e.message}
    }
}