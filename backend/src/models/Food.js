const mongooese = require('mongoose');
//Modelo Prato que será salvo no banco
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
//Disponibiliza com o servidor as imagens de cada comida
FoodSchema.virtual('thumbnail_url').get(function(){
    return `http://localhost:9999/files/${this.thumbnail}`
})

module.exports = mongooese.model('Food', FoodSchema);