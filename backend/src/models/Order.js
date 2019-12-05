const mongooese = require('mongoose');
//Modelo Pedido que será salvo no banco
const OrderSchema = new mongooese.Schema({
    table: Number,
    foods: [Object],
    status: String
})

module.exports = mongooese.model('Order', OrderSchema);