import { Router } from "express";
import * as preciosBombonasServices from "../services/precios_bombonaServices";

const router = Router();

// router.get('/', (_req, res) => {
//     res.send('Hello from the API');
// });

router.get('/', async (_req, res) => {

    const precios = await preciosBombonasServices.getAllPrecios()

    return (precios.length > 0)
        ? res.json(precios)
        : res.status(404).json({ message: 'No se encontraron precios' });

});

export default router;