import { Request, Response } from "express-serve-static-core"
import { CreatePostService } from "../../services/posts/CreatePostService"

class CreatePostController{
    async handle(req:Request, res:Response){
        const {nome, conteudo, sistema, pago, modalidade, horario, dia, cidade, banner} = req.body
        //id do criador do post
        const master_id = req.user_id
        //inicialize service
        const createPostService = new CreatePostService()

        const postData = await createPostService.execute({nome, conteudo, sistema, pago, modalidade, horario, dia, cidade, banner, master_id})

        return res.json(postData)
    }
}

export {CreatePostController}