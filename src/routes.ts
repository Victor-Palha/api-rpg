import { Router, Request, Response } from "express";
import { AuthUserController } from "./controllers/user/AuthUserController";
import { CreateUserController } from "./controllers/user/CreateUserController";
import { DetailUserController } from "./controllers/user/DetailsUserController";
import { isAuth } from "./middlewares/isAuth";

//Start Router
const router = Router()

//Routes
    //Health Check
    router.get('/health', (req:Request, res:Response)=>{
        return res.sendStatus(200)
    })
    //Users
    .post('/user/signup', new CreateUserController().handle)
    .post('/user/signin', new AuthUserController().handle)
    .get('/user/me', isAuth, new DetailUserController().handle)
    //Posts


    //Post Messages


    //Games


    

//Exports all routes
export {router}