const mongoose = require('mongoose');
//Modelo Cliente que será salvo no banco
const ClientSchema = new mongoose.Schema({
    name: String,
    email: String,
    password: String,
    cpf: Number
});

module.exports = mongoose.model('Client', ClientSchema);