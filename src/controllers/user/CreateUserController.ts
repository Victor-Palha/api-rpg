import { Request, Response } from "express";
import { CreateUserService } from "../../services/user/CreateUserService";


class CreateUserController{
    async handle(req:Request, res:Response){
        const {name, email, password} = req.body
        //instanciando serviço
        const createUserService = new CreateUserService()
        //Chamando Serviço
        const user = await createUserService.execute({name, email, password})
        //Retornando resposta
        return res.json(user)
    }
}
export {CreateUserController}