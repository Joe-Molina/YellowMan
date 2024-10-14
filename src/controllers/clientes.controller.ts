import { ClientsModel } from "../models/clientes.model.";

export class Clients {
  static async getAll(_req: any, res: any) {
    const clientes = ClientsModel.getAllClients;
    return clientes != null && clientes.length > 0
      ? res.json(clientes)
      : res.sendStatus(404);
  }

  static async getOne(req: any, res: any) {
    const client = await ClientsModel.getClient(parseInt(req.params.id));

    return client != null ? res.json(client) : res.sendStatus(404);
  }

  static async add(req: any, res: any) {
    const newClient = await ClientsModel.addClient(req.body);

    return newClient != null ? res.json(newClient) : res.sendStatus(404);
  }

  static async delete(req: any, res: any) {
    const oldClient = await ClientsModel.deleteClient(parseInt(req.params.id));

    return oldClient != null ? res.json(oldClient) : res.sendStatus(404);
  }
}
