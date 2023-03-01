//Env
require("dotenv").config()
//Express
import express, {Request, Response, NextFunction} from "express";
import "express-async-errors"
import cors from "cors"
//routes
import { router } from "./routes";
//start express
const App = express()

//global middlewares
App.use(express.json())
App.use(cors())
//Routes
App.use('/api/', router)

//Error
App.use((err:Error, req:Request, res:Response, next:NextFunction)=>{
    if(err instanceof Error){
        return res.status(400).json({
            error: err.message
        })
    }
    //else
    return res.status(500).json({status: "Error", message: "Internal Server Error"})
})

//Listen
    //PORT
    const port = process.env.PORT
App.listen(port, async()=>{
    console.log("Servidor Online e Pronto para Uso!")
})