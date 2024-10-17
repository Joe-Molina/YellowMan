import { Router } from "express";
import { Clients } from "../controllers/clientes.controller";

const router = Router();

router.get("/", Clients.getAll);

router.get("/:id", Clients.getOne);

router.post("/", Clients.add);

router.delete("/:id", Clients.delete);

export default router;
