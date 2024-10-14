import { PreciosModel } from "../models/precios_bombona.model";

export class Precios {
  static async getAll(_req: any, res: any) {
    const precios = await PreciosModel.getAllPrecios();

    try {
      res.json(precios);
    } catch (error) {
      res.status(404).send(error);
    }
  }
}
