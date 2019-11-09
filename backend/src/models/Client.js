const mongoose = require('mongoose');

const ClientSchema = new mongoose.Schema({
    name: String,
    email: String,
    password: String,
    cpf: Number
});

module.exports = mongoose.model('Client', ClientSchema);