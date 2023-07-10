"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.APIRoutes = void 0;
const express_1 = require("express");
const auth_routes_1 = require("./auth.routes");
const designation_routes_1 = require("./public/designation.routes");
const salesteam_routes_1 = require("./sales_team/salesteam.routes");
exports.APIRoutes = (0, express_1.Router)();
exports.APIRoutes.get('/', (req, res) => {
    res.send("Inside API call");
});
exports.APIRoutes.use('/auth', auth_routes_1.AuthRoutes);
exports.APIRoutes.use('/designation', designation_routes_1.designationRoutes);
exports.APIRoutes.use('/sales_team', salesteam_routes_1.salesTeamRoutes);
