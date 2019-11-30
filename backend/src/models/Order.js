const mongooese = require('mongoose');

const OrderSchema = new mongooese.Schema({
    table: Number,
    foods: [Object],
    status: String
})

module.exports = mongooese.model('Order', OrderSchema);