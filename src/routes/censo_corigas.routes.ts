import { Router } from "express";
import { CensoCorigas } from "../controllers/censo_corigas.controller";

const router = Router();

router.get("/", CensoCorigas.getAll)

export default router;