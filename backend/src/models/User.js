const mongooese = require('mongoose');
//Modelo Dono do Restaurante
const UserSchema =  new mongooese.Schema({
    name: String,
    email: String,
    password: String,
    cnpj: Number,
});

module.exports = mongooese.model('User', UserSchema);