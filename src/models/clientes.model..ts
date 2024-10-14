import { prisma } from "../libs/prisma";
import { Client } from "../types";

// comprobar si el async y el await son necesarios en esta funcion puesto q los llamare en otra donde tambien tengo que usar async y await

export class ClientsModel {
  static getAllClients = async () => prisma.clientes.findMany();

  static getClient = async (id: number) => {
    const client = prisma.clientes.findFirst({
      where: {
        id,
      },
    });
    return client;
  };

  static addClient = async (newClient: Client) => {
    const createClient = prisma.clientes.create({
      data: {
        nombre: newClient.nombre,
        punto: newClient.punto,
      },
    });

    return createClient;
  };

  static deleteClient = async (id: number) => {
    const deleteClient = await prisma.clientes.delete({
      where: {
        id,
      },
    });

    return deleteClient;
  };
}
