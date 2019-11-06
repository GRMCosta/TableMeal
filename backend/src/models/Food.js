const mongooese = require('mongoose');

const FoodSchema = new mongooese.Schema({
    thumbnail: String,
    name: String,
    price: Number,
    description: String,
    type: String,
    user: {
        type: mongooese.Schema.Types.ObjectId,
        ref: 'User'
    }

})

module.exports = mongooese.model('Food', FoodSchema);