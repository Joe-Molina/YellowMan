-- CreateTable
CREATE TABLE "Clientes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "punto" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Precios_bombonas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "kg" INTEGER NOT NULL,
    "precio" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Bombonas_asignadas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fk_cliente" INTEGER NOT NULL,
    "fk_bombona" INTEGER NOT NULL,
    CONSTRAINT "Bombonas_asignadas_fk_cliente_fkey" FOREIGN KEY ("fk_cliente") REFERENCES "Clientes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Bombonas_asignadas_fk_bombona_fkey" FOREIGN KEY ("fk_bombona") REFERENCES "Precios_bombonas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Censo_clientes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fecha" DATETIME NOT NULL,
    "fk_cliente" INTEGER NOT NULL,
    CONSTRAINT "Censo_clientes_fk_cliente_fkey" FOREIGN KEY ("fk_cliente") REFERENCES "Clientes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Devoluciones" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fecha" DATETIME NOT NULL,
    "fk_censo" INTEGER NOT NULL,
    CONSTRAINT "Devoluciones_fk_censo_fkey" FOREIGN KEY ("fk_censo") REFERENCES "Censo_clientes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Facturas_censo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fecha" DATETIME NOT NULL,
    "monto_en_divisas" INTEGER NOT NULL,
    "fk_censo" INTEGER NOT NULL,
    "cant_5kg" INTEGER NOT NULL,
    "cant_10kg" INTEGER NOT NULL,
    "cant_18kg" INTEGER NOT NULL,
    "cant_21kg" INTEGER NOT NULL,
    "cant_27kg" INTEGER NOT NULL,
    "cant_43kg" INTEGER NOT NULL,
    CONSTRAINT "Facturas_censo_fk_censo_fkey" FOREIGN KEY ("fk_censo") REFERENCES "Censo_clientes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Facturas_corigas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fecha" DATETIME NOT NULL,
    "monto_en_divisas" INTEGER NOT NULL,
    "cant_5kg" INTEGER NOT NULL,
    "cant_10kg" INTEGER NOT NULL,
    "cant_18kg" INTEGER NOT NULL,
    "cant_21kg" INTEGER NOT NULL,
    "cant_27kg" INTEGER NOT NULL,
    "cant_43kg" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Pagos_corigas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fk_factura_corigas" INTEGER NOT NULL,
    CONSTRAINT "Pagos_corigas_fk_factura_corigas_fkey" FOREIGN KEY ("fk_factura_corigas") REFERENCES "Facturas_corigas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Pagos_clientes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fk_factura_censo" INTEGER NOT NULL,
    "facturas_censoId" INTEGER,
    CONSTRAINT "Pagos_clientes_fk_factura_censo_fkey" FOREIGN KEY ("fk_factura_censo") REFERENCES "Facturas_corigas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Pagos_clientes_facturas_censoId_fkey" FOREIGN KEY ("facturas_censoId") REFERENCES "Facturas_censo" ("id") ON DELETE SET NULL ON UPDATE CASCADE
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
