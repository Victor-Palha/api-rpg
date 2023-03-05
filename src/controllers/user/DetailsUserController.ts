import { Request, Response } from "express";
import { DetailsUserService } from "../../services/user/DetailsUserService";

class DetailUserController{
    async handle(req:Request, res:Response){
        const {user_id} = req.body
        const detailUserService = new DetailsUserService()
        const userDetails = await detailUserService.execute(user_id)
        return res.json(userDetails)
    }
}

export {DetailUserController}