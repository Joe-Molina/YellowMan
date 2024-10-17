import { prisma } from "../libs/prisma";

interface PreciosTypes {
  kg5: number;
  kg10: number;
  kg18: number;
  kg27: number;
  kg43: number;
}

export class PreciosModel {
  static async getAll() {
    return await prisma.precios_bombonas.findMany();
  }

  static async delete(id: number) {
    return await prisma.precios_bombonas.delete({
      where: { id },
    });
  }

  static async add(precios: PreciosTypes) {
    return await prisma.precios_bombonas.create({
      data: {
        kg5: precios.kg5,
        kg10: precios.kg10,
        kg18: precios.kg18,
        kg27: precios.kg27,
        kg43: precios.kg43,
      }
    });
  }
}
