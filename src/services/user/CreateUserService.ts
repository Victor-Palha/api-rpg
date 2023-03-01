import prismaClient from "../../prisma"

interface UserRequest{
    name: string,
    email: string,
    password: string
}
class CreateUserService{
    async execute({name, email, password}:UserRequest){
        //Verificar se existe email
        if(!email){
            throw new Error("Email incorrect")
        }
        //Verificar se email ou nome já existem
        const verifyUser = await prismaClient.users.findFirst({
            where:{
                OR:[
                    {email: email},
                    {nome: name}
                ]
            }
        
        })
        if(verifyUser){
            throw new Error("Name or Email already exists!")
        }
        // Criar novo usuário
        const user = await prismaClient.users.create({
            data:{
                nome:name,
                email:email,
                password:password
            }, select:{
                nome:true,
                email: true
            }
        })
        //retornando para o controller
        return user
    }
}
export {CreateUserService}