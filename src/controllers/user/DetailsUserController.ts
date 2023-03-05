import { Request, Response } from "express";
import { DetailsUserService } from "../../services/user/DetailsUserService";

class DetailUserController{
    async handle(req:Request, res:Response){
        const {id_user} = req.body
        const detailUserService = new DetailsUserService()
        const userDetails = await detailUserService.execute(id_user)
        return res.json(userDetails)
    }
}

export {DetailUserController}