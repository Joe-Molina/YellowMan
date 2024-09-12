import { Router } from "express";
import * as clientServices from "../services/clientesServices"

const router = Router();

router.get("/", async (_req, res) => {

    const clientes = await clientServices.getAllClients()
    return (clientes != null && clientes.length > 0)
        ? res.json(clientes)
        : res.sendStatus(404)
});

router.get("/:id", async (req, res) => {
    const client = await clientServices.getClient(parseInt(req.params.id))

    return (client != null)
        ? res.json(client)
        : res.sendStatus(404)
});


router.post("/", async (req, res) => {
    const newClient = await clientServices.addClient(req.body)

    return (newClient != null)
        ? res.json(newClient)
        : res.sendStatus(404)
});


router.delete("/:id", async (req, res) => {
    const oldClient = await clientServices.deleteClient(parseInt(req.params.id))

    return (oldClient != null)
        ? res.json(oldClient)
        : res.sendStatus(404)
});

export default router;