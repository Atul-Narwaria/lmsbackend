import Joi from "joi";

export const AdminRegistration = Joi.object({
    name:Joi.string().required().min(3),
    email:Joi.string().email().required(),
    phone:Joi.string().required().length(10),
    password:Joi.string().alphanum().required().min(8),
    confirmPassword:Joi.string().valid(Joi.ref('password')).alphanum().required()
})

export const AdminLogin = Joi.object({
    email:Joi.string().email().required(),
    password:Joi.string().alphanum().required()
})

export const DesignationCreateSchema = Joi.object({
    name:Joi.string().min(3).required(),
})

export const SalesTeamRegistrationSchema = Joi.object({
    name:Joi.string().required().min(3),
    email:Joi.string().email().required(),
    phone:Joi.string().required().length(10),
    password:Joi.string().alphanum().required().min(8),
    confirmPassword:Joi.string().valid(Joi.ref('password')).alphanum().required(),
    dob:Joi.date().iso().required(),
    fkdesgination:Joi.string().uuid().required()
})
export const SalesTeamLoginSchema = Joi.object({
    email:Joi.string().email().required(),
    password:Joi.string().alphanum().required()
})