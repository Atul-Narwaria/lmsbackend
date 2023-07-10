import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient();

export const createSchool =async (name:string,afflication:string,fkschooltype:string,fkschoolboard:string,fksalesteam:string) => {
    try{
        await prisma.schoolMaster.create({
            data:{
                name:name,
                afflicationCode:afflication,
                fkSchoolType:fkschooltype,
                fkschoolBoard:fkschoolboard,
                fksalesTeamId:fksalesteam,
                status:true
            }
        })
    return {status:"success",message:"School "+name+" ales Person creatted successfully"}
    }catch(prismaError:any){
        return {status:"error",message:prismaError.message}
    }
}