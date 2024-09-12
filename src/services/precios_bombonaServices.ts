import { prisma } from "../libs/prisma";

export const getAllPrecios = () => prisma.precios_bombonas.findMany();

