import prismaClient from "../../prisma";

class DetailsUserService{
    async execute(id_user:string){
        const userDetails = await prismaClient.users.findFirst({where:{ id_user: id_user}})
        return userDetails
    }
}
export {DetailsUserService}