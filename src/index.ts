import express from "express";
import cors from "cors";
import clientes from "./routes/clientes.routes"
import censoCorigas from "./routes/censo_corigas.routes"
import precios_bombona from "./routes/precios_bombona.routes"
import censo_clientes from "./routes/censo_clientes.routes"
import devoluciones_bombonas from "./routes/devoluciones_bombonas.routes"
import pagos_clientes from "./routes/pagos_clientes.routes"
import pagos_corigas from "./routes/pagos_corigas.routes"
import gastos from "./routes/gastos.routes"

const app = express();

app.use(cors());
app.use(express.json());

const PORT = 3000;

app.use("/clients", clientes);
app.use("/precios", precios_bombona);
app.use("/censo_corigas", censoCorigas);
app.use("/censo_clientes", censo_clientes)
app.use("/devoluciones_bombonas", devoluciones_bombonas)
app.use("/pagos_clientes", pagos_clientes)
app.use("/pagos_corigas", pagos_corigas)
app.use("/gastos", gastos)



app.listen(PORT, () => {
  console.log("server running on port " + PORT);
});