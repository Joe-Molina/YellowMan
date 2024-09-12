"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const clientes_controller_1 = require("../controllers/clientes.controller");
const router = express_1.default.Router();
router.get("/", clientes_controller_1.getAllClients);
router.get("/:id", clientes_controller_1.getClient);
router.put("/", clientes_controller_1.addClient);
router.delete("/", clientes_controller_1.deleteClient);
exports.default = router;
