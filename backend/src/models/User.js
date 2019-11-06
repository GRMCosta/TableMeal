const mongooese = require('mongoose');

const UserSchema =  new mongooese.Schema({
    name: String,
    email: String,
    password: String,
    CNPJ: Number,
});

module.exports = mongooese.model('User', UserSchema);