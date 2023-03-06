import prismaClient from "../../prisma";

class GetAllPostsService{
    async execute(){
        const allPosts = await prismaClient.posts.findMany({})
        return allPosts
    }
}

export {GetAllPostsService}