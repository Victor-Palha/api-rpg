import { Router, Request, Response } from "express";

//Start Router
const router = Router()

//Routes
    //Health
    router.get('/health', (req:Request, res:Response)=>{
        return res.sendStatus(200)
    })
    //Users
    

    //Posts


    //Post Messages


    //Games


    

//Exports all routes
export {router}