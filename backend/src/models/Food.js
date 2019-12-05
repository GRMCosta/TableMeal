const mongooese = require('mongoose');
<<<<<<< HEAD
//Modelo Prato que será salvo no banco
=======
var ip = require( 'ip' );

>>>>>>> 00d9a9c425d0837bb5812339a8d9371659daa19e
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
    return `http://${ip.address()}:9999/files/${this.thumbnail}`
})

module.exports = mongooese.model('Food', FoodSchema);