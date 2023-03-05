import prismaClient from "../../prisma";
import { compare } from "bcryptjs";
import {sign} from "jsonwebtoken"

interface AuthRequest{
    email: string
    password: string
}
class AuthUserService{

    async execute({email, password}:AuthRequest){
        const user = await prismaClient.users.findFirst({
            where:{
                email:email,
            }
        })
        //Verifica se existe um usuário com esse email
        if(!user){
            throw new Error("E-mail incorreto!")
        }
        
        //Compara a senha
        const passwordMatch = await compare(password, user.password)
        if(!passwordMatch){
            throw new Error("Email ou senha incorretos!")
        }
        
        //JWT -=-=-=- TOKEN
        const token = sign({name: user.nome, email: user.email}, process.env.JWT, {subject: user.id_user, expiresIn: '30d'})
        
        return {id:user.id_user, name: user.nome, email: user.email, token: token}
    }
}

export {AuthUserService}