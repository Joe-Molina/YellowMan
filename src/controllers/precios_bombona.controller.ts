import { PreciosModel } from "../models/precios_bombona.model";

export class Precios {
  static async getAll(_req: any, res: any) {
    const precios = await PreciosModel.getAll();

    try {
      res.json(precios);
    } catch (error) {
      res.status(404).send(error);
    }
  }

  static async add(req: any, res: any) {
    const newPrecio = await PreciosModel.add(req.body);

    try {
      res.json(newPrecio);
    } catch (error) {
      res.status(404).send(error);
    }
  }

  static async borrar(req: any, res: any) {
    const precioDelete = await PreciosModel.delete(req.body.id);

    try {
      res.json(precioDelete);
    } catch (error) {
      res.status(404).send(error);
    }
  }

}
