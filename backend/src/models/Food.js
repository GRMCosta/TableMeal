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

}, {
    toJSON: {
        virtuals: true,
    }
});

FoodSchema.virtual('thumbnail_url').get(function(){
    return `http://localhost:9999/files/${this.thumbnail}`
})

module.exports = mongooese.model('Food', FoodSchema);