"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SalesTeamLoginSchema = exports.SalesTeamRegistrationSchema = exports.DesignationCreateSchema = exports.AdminLogin = exports.AdminRegistration = void 0;
const joi_1 = __importDefault(require("joi"));
exports.AdminRegistration = joi_1.default.object({
    name: joi_1.default.string().required().min(3),
    email: joi_1.default.string().email().required(),
    phone: joi_1.default.string().required().length(10),
    password: joi_1.default.string().alphanum().required().min(8),
    confirmPassword: joi_1.default.string().valid(joi_1.default.ref('password')).alphanum().required()
});
exports.AdminLogin = joi_1.default.object({
    email: joi_1.default.string().email().required(),
    password: joi_1.default.string().alphanum().required()
});
exports.DesignationCreateSchema = joi_1.default.object({
    name: joi_1.default.string().min(3).required(),
});
exports.SalesTeamRegistrationSchema = joi_1.default.object({
    name: joi_1.default.string().required().min(3),
    email: joi_1.default.string().email().required(),
    phone: joi_1.default.string().required().length(10),
    password: joi_1.default.string().alphanum().required().min(8),
    confirmPassword: joi_1.default.string().valid(joi_1.default.ref('password')).alphanum().required(),
    dob: joi_1.default.date().iso().required(),
    fkdesgination: joi_1.default.string().uuid().required()
});
exports.SalesTeamLoginSchema = joi_1.default.object({
    email: joi_1.default.string().email().required(),
    password: joi_1.default.string().alphanum().required()
});
