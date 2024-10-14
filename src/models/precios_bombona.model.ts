import { prisma } from "../libs/prisma";

export class PreciosModel {
  static async getAllPrecios() {
    return await prisma.precios_bombonas.findMany();
  }
}
