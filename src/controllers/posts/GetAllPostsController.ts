import { Request, Response } from "express";
import { GetAllPostsService } from "../../services/posts/GetAllPostsService";

class GetAllPostsController{
    async handle(req:Request, res:Response){
        const getAllPostsService = new GetAllPostsService()
        const allPosts = await getAllPostsService.execute()
        return res.json(allPosts)
    }
}
export {GetAllPostsController}