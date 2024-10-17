-- CreateTable
CREATE TABLE "Clientes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "punto" TEXT NOT NULL,
    "fk_precios_venta" INTEGER NOT NULL,
    CONSTRAINT "Clientes_fk_precios_venta_fkey" FOREIGN KEY ("fk_precios_venta") REFERENCES "Precios_bombonas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Precios_bombonas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "kg5" REAL NOT NULL,
    "kg10" REAL NOT NULL,
    "kg18" REAL NOT NULL,
    "kg27" REAL NOT NULL,
    "kg43" REAL NOT NULL
);

-- CreateTable
CREATE TABLE "Censo_clientes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fecha" DATETIME NOT NULL,
    "cant_5kg" INTEGER NOT NULL,
    "cant_10kg" INTEGER NOT NULL,
    "cant_18kg" INTEGER NOT NULL,
    "cant_27kg" INTEGER NOT NULL,
    "cant_43kg" INTEGER NOT NULL,
    "fk_cliente" INTEGER NOT NULL,
    CONSTRAINT "Censo_clientes_fk_cliente_fkey" FOREIGN KEY ("fk_cliente") REFERENCES "Clientes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Devoluciones_bombonas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fecha" DATETIME NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "Kg" INTEGER NOT NULL,
    "fk_censo" INTEGER NOT NULL,
    CONSTRAINT "Devoluciones_bombonas_fk_censo_fkey" FOREIGN KEY ("fk_censo") REFERENCES "Censo_clientes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Devoluciones_dinero" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fecha" DATETIME NOT NULL,
    "cant_devuelta_Bs" REAL NOT NULL,
    "Kg" INTEGER NOT NULL,
    "fk_censo" INTEGER NOT NULL,
    CONSTRAINT "Devoluciones_dinero_fk_censo_fkey" FOREIGN KEY ("fk_censo") REFERENCES "Censo_clientes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Pagos_clientes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fk_censo_clientes" INTEGER NOT NULL,
    "tasa_bcv" REAL NOT NULL,
    "pago_divisa" REAL NOT NULL,
    "pago_efectivo" REAL NOT NULL,
    "pago_pm" REAL NOT NULL,
    "total_pagado" REAL NOT NULL,
    "fecha_pago" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Censo_corigas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fecha" DATETIME NOT NULL,
    "total_en_divisas" REAL NOT NULL,
    "cant_5kg" INTEGER NOT NULL,
    "cant_10kg" INTEGER NOT NULL,
    "cant_18kg" INTEGER NOT NULL,
    "cant_27kg" INTEGER NOT NULL,
    "cant_43kg" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Pagos_censo_corigas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fk_censo_corigas" INTEGER NOT NULL,
    "pagado_en_pm" REAL NOT NULL,
    "equivalente_en_divisa" REAL NOT NULL,
    "tasa_bcv" REAL NOT NULL,
    CONSTRAINT "Pagos_censo_corigas_fk_censo_corigas_fkey" FOREIGN KEY ("fk_censo_corigas") REFERENCES "Censo_corigas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Gastos_empresa" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "descripcion" TEXT NOT NULL,
    "fecha" DATETIME NOT NULL,
    "monto" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Gastos_fijos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "descripcion" TEXT NOT NULL,
    "monto" INTEGER NOT NULL
);
