/*
  Warnings:

  - Added the required column `Kg` to the `Devoluciones` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cantidad` to the `Devoluciones` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Devoluciones" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fecha" DATETIME NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "Kg" INTEGER NOT NULL,
    "fk_censo" INTEGER NOT NULL,
    CONSTRAINT "Devoluciones_fk_censo_fkey" FOREIGN KEY ("fk_censo") REFERENCES "Censo_clientes" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Devoluciones" ("fecha", "fk_censo", "id") SELECT "fecha", "fk_censo", "id" FROM "Devoluciones";
DROP TABLE "Devoluciones";
ALTER TABLE "new_Devoluciones" RENAME TO "Devoluciones";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
