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
exports.CheckAdminExistance = exports.getAdmin = exports.CreateAdmin = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
const CreateAdmin = (name, email, phone, password) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        yield prisma.admin.create({
            data: {
                name: name,
                email: email,
                phone: phone,
                password: password,
                status: true
            }
        });
        return { status: "success", message: "admin crated successfully" };
    }
    catch (e) {
        return { status: "error", message: e.message };
    }
});
exports.CreateAdmin = CreateAdmin;
const getAdmin = (email) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const get = yield prisma.admin.findFirst({
            select: {
                id: true,
                name: true,
                email: true,
                password: true,
                phone: true
            },
            where: {
                email: email
            }
        });
        if (!get) {
            return { status: "error", message: "no user found" };
        }
        return { status: "success", message: get };
    }
    catch (e) {
        return { status: "error", message: e.message };
    }
});
exports.getAdmin = getAdmin;
const CheckAdminExistance = (id) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        return yield prisma.admin.count({
            where: { id: id }
        });
    }
    catch (e) {
        return { status: "error", message: e.message };
    }
});
exports.CheckAdminExistance = CheckAdminExistance;
