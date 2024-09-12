"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteClient = exports.addClient = exports.getClient = exports.getAllClients = void 0;
const prisma_1 = require("../libs/prisma");
const getAllClients = () => (_req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const clientes = yield prisma_1.prisma.clientes.findMany();
        res.json(clientes);
    }
    catch (error) {
        next(error);
    }
});
exports.getAllClients = getAllClients;
const getClient = () => (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const cliente = yield prisma_1.prisma.clientes.findFirst({
            where: {
                id: parseInt(req.params.id),
            },
        });
        res.json(cliente);
    }
    catch (error) {
        next(error);
    }
});
exports.getClient = getClient;
const addClient = () => (_req, _res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
    }
    catch (error) {
        next(error);
    }
});
exports.addClient = addClient;
const deleteClient = () => (_req, _res, next) => __awaiter(void 0, void 0, void 0, function* () {
    try {
    }
    catch (error) {
        next(error);
    }
});
exports.deleteClient = deleteClient;
