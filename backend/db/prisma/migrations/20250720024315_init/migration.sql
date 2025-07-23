-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "password" VARCHAR(128) NOT NULL,
    "balance" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transaction" (
    "id" SERIAL NOT NULL,
    "type" CHAR(1) NOT NULL,
    "value" BIGINT NOT NULL DEFAULT 0,
    "description" VARCHAR(100),
    "fk_user" INTEGER NOT NULL,

    CONSTRAINT "Transaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Installiments_informations" (
    "id" SERIAL NOT NULL,
    "quantity" INTEGER NOT NULL DEFAULT 1,
    "type_operation" CHAR(1) NOT NULL,
    "total_value" BIGINT NOT NULL DEFAULT 0,
    "description" VARCHAR(100) NOT NULL,
    "fk_user" INTEGER NOT NULL,

    CONSTRAINT "Installiments_informations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Installiments" (
    "id" SERIAL NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 1,
    "date" DATE NOT NULL,
    "fk_infos" INTEGER NOT NULL,

    CONSTRAINT "Installiments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "query_optimization" (
    "id" SERIAL NOT NULL,
    "balance" INTEGER NOT NULL,
    "date" DATE NOT NULL,
    "fk_user" INTEGER NOT NULL,

    CONSTRAINT "query_optimization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EUA_money_exchange" (
    "id" SERIAL NOT NULL,
    "type_operation" CHAR(1) NOT NULL,
    "date" DATE NOT NULL,
    "base_quantity" DECIMAL(9,8) NOT NULL,
    "fk_user" INTEGER NOT NULL,

    CONSTRAINT "EUA_money_exchange_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EUA_Wallet" (
    "id" SERIAL NOT NULL,
    "type_operation" CHAR(1) NOT NULL,
    "token" VARCHAR(9) NOT NULL,
    "quantity" DECIMAL(9,8) NOT NULL DEFAULT 0.0,
    "date" DATE NOT NULL,
    "fk_user" INTEGER NOT NULL,

    CONSTRAINT "EUA_Wallet_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_fk_user_fkey" FOREIGN KEY ("fk_user") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Installiments_informations" ADD CONSTRAINT "Installiments_informations_fk_user_fkey" FOREIGN KEY ("fk_user") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Installiments" ADD CONSTRAINT "Installiments_fk_infos_fkey" FOREIGN KEY ("fk_infos") REFERENCES "Installiments_informations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "query_optimization" ADD CONSTRAINT "query_optimization_fk_user_fkey" FOREIGN KEY ("fk_user") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EUA_money_exchange" ADD CONSTRAINT "EUA_money_exchange_fk_user_fkey" FOREIGN KEY ("fk_user") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EUA_Wallet" ADD CONSTRAINT "EUA_Wallet_fk_user_fkey" FOREIGN KEY ("fk_user") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
