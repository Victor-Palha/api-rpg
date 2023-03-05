import { Posts } from "../../interfaces/Posts";
import prismaClient from "../../prisma";

class CreatePostService{
    async execute({nome, conteudo, sistema, pago, modalidade, horario, dia, cidade, banner, master_id}:Posts){
        if(nome === '' || conteudo === '' || sistema === '' || pago === undefined || null || modalidade === '' || horario === '' || dia === '' || banner === '' || master_id === '' ){
            console.log("teste")
            throw new Error("Preencha todos os campos para cadastrar sua mesa!")
        }

        const newPost = await prismaClient.posts.create({
            data:{
                nome: nome,
                conteudo: conteudo,
                sistema: sistema,
                pago: pago,
                modalidade: modalidade,
                horario: horario,
                dia: dia,
                cidade: cidade,
                banner: banner,
                master_id: master_id
            }
        })
        return newPost
    }
}

export {CreatePostService}