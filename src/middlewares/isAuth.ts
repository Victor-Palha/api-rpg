import { NextFunction, Request, Response } from "express";
import { verify } from "jsonwebtoken";

//id do user
interface Payload{
    sub:string
}

export function isAuth(req:Request, res:Response, next:NextFunction){
    //Pega o Token da requisição http
    const authToken = req.headers.authorization
    //Verifica se o token existe
    if(!authToken){
        return res.status(401).end()
    }
    //Tira a convenção e pega somente o Token
    const [, token] = authToken.split(" ")
    // Faz a validação do token com o segredo JWT
    try {
        const {sub} = verify(token, process.env.JWT) as Payload
        req.user_id = sub
        return next()
    } catch (error) {
        return res.status(401).end()
    }
}