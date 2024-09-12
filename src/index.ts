import express from "express";
import cors from "cors";
import clientes from "./routes/clientes.routes"
import precios_bombona from "./routes/precios_bombona.routes"

const app = express();

app.use(cors());
app.use(express.json());

const PORT = 3000;

app.use('/clients', clientes);
app.use('/precios', precios_bombona);



app.listen(PORT, () => {
  console.log("server running on port " + PORT);
});