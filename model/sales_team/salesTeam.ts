import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient();

export const CreateSalesTeam =async (name:string,email:string,phone:string,password:string,dob:Date,fkdesgination:string) => {
    try{
        
        await prisma.salesTeam.create({
            data:{
                name:name,
                email:email,
                phone:phone,
                password:password, 
                status:true,
                dob:new Date(dob),
                fkdesignationId:fkdesgination
            }
        })
        return {status:"success",message:"Sales Person crated successfully"}
    }catch(prismaError:any){
        return {status:"error",message:prismaError.message}
    }
}

export const CheckSalesTeamExistance =async (id:string) => {
    try{
        return await prisma.salesTeam.count({
            where:{id:id}
        })
    }catch(e:any){
        return {status:"error",message:e.message}
    }
}



export const getSalesTeam =async (email:string) => {
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
    }catch(prismaError:any){
        return {status:"error",message:prismaError.message}
    }
}
