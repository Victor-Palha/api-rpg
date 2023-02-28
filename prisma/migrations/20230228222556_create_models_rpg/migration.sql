-- CreateTable
CREATE TABLE `users` (
    `id_user` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `admin` BOOLEAN NOT NULL,

    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`id_user`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `messages` (
    `id_msg` VARCHAR(191) NOT NULL,
    `conteudo` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `post_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_msg`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `posts` (
    `id_post` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `conteudo` VARCHAR(191) NOT NULL,
    `sistema` VARCHAR(191) NOT NULL,
    `modalidade` VARCHAR(191) NOT NULL,
    `horario` VARCHAR(191) NOT NULL,
    `dia` VARCHAR(191) NOT NULL,
    `cidade` VARCHAR(191) NULL,
    `banner` VARCHAR(191) NOT NULL,
    `master_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_post`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `players` (
    `id_player` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `post_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_player`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mundiinfo` (
    `id_mundi` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `post_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_mundi`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `submundis` (
    `id_submundi` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `conteudo` VARCHAR(191) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,
    `mundi_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_submundi`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `continentinfo` (
    `id_continent` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `mundi_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_continent`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subcontinents` (
    `id_subcontinent` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `conteudo` VARCHAR(191) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,
    `continent_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_subcontinent`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `realmsinfo` (
    `id_realms` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `continent_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_realms`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subrealms` (
    `id_subrealms` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `conteudo` VARCHAR(191) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,
    `realms_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_subrealms`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `citysinfo` (
    `id_citys` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `realms_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_citys`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subcitys` (
    `id_subcitys` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `conteudo` VARCHAR(191) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,
    `city_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_subcitys`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `placesinfo` (
    `id_places` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `citys_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_places`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subplaces` (
    `id_subplaces` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `conteudo` VARCHAR(191) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,
    `place_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_subplaces`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `npcsinfo` (
    `id_npcs` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `place_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_npcs`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `subnpcs` (
    `id_subnpcs` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `conteudo` VARCHAR(191) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,
    `npcs_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id_subnpcs`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `messages` ADD CONSTRAINT `messages_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `messages` ADD CONSTRAINT `messages_post_id_fkey` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id_post`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `posts` ADD CONSTRAINT `posts_master_id_fkey` FOREIGN KEY (`master_id`) REFERENCES `users`(`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `players` ADD CONSTRAINT `players_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `players` ADD CONSTRAINT `players_post_id_fkey` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id_post`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `mundiinfo` ADD CONSTRAINT `mundiinfo_post_id_fkey` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id_post`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `submundis` ADD CONSTRAINT `submundis_mundi_id_fkey` FOREIGN KEY (`mundi_id`) REFERENCES `mundiinfo`(`id_mundi`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `continentinfo` ADD CONSTRAINT `continentinfo_mundi_id_fkey` FOREIGN KEY (`mundi_id`) REFERENCES `mundiinfo`(`id_mundi`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subcontinents` ADD CONSTRAINT `subcontinents_continent_id_fkey` FOREIGN KEY (`continent_id`) REFERENCES `continentinfo`(`id_continent`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `realmsinfo` ADD CONSTRAINT `realmsinfo_continent_id_fkey` FOREIGN KEY (`continent_id`) REFERENCES `continentinfo`(`id_continent`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subrealms` ADD CONSTRAINT `subrealms_realms_id_fkey` FOREIGN KEY (`realms_id`) REFERENCES `realmsinfo`(`id_realms`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `citysinfo` ADD CONSTRAINT `citysinfo_realms_id_fkey` FOREIGN KEY (`realms_id`) REFERENCES `realmsinfo`(`id_realms`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subcitys` ADD CONSTRAINT `subcitys_city_id_fkey` FOREIGN KEY (`city_id`) REFERENCES `citysinfo`(`id_citys`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `placesinfo` ADD CONSTRAINT `placesinfo_citys_id_fkey` FOREIGN KEY (`citys_id`) REFERENCES `citysinfo`(`id_citys`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subplaces` ADD CONSTRAINT `subplaces_place_id_fkey` FOREIGN KEY (`place_id`) REFERENCES `placesinfo`(`id_places`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `npcsinfo` ADD CONSTRAINT `npcsinfo_place_id_fkey` FOREIGN KEY (`place_id`) REFERENCES `placesinfo`(`id_places`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `subnpcs` ADD CONSTRAINT `subnpcs_npcs_id_fkey` FOREIGN KEY (`npcs_id`) REFERENCES `npcsinfo`(`id_npcs`) ON DELETE RESTRICT ON UPDATE CASCADE;
