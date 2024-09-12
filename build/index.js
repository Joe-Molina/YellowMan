"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const clientes_routes_1 = __importDefault(require("./routes/clientes.routes"));
const app = (0, express_1.default)();
app.use((0, cors_1.default)());
app.use(express_1.default.json());
const PORT = 3000;
app.use((err, _req, res, _next) => {
    console.error(err.stack);
    res.status(500).json({ error: err.message });
});
app.use('/clientes', clientes_routes_1.default);
app.listen(PORT, () => {
    console.log("server running on port " + PORT);
});
