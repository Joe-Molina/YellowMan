import { Router } from "express";
import { Precios } from "../controllers/precios_bombona.controller";

const router = Router();

router.get("/", Precios.getAll);
router.post("/", Precios.add);
router.delete("/", Precios.borrar);

export default router;
