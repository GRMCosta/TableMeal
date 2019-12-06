const Order = require('../models/Order');
const Food = require('../models/Food');
const mongooese = require('mongoose');

module.exports = {

    //Pega todos os pedidos pelo ID
    async index(req,res){
        const { user_id } = req.query;
        const allOrders = await Order.find({foods: {$elemMatch: {user: mongooese.Types.ObjectId(user_id)}}});
        return res.json(allOrders);
    },
//
    //Cria um novo Pedido
    async store(req, res){
        var allFoods;
        var objects = {};
        var order;
        const { table, foods } = req.body;
        var food1 = foods.filter(food => food.id)
        console.log(food1);
        Food.find({_id: {$in: food1}}, function(err, array){
            array.forEach(o => objects[o._id] = o);
            allFoods = foods.map(id => objects[id]);
            order = Order.create({
                table,
                foods: allFoods,
                status: "Aguardando"
            })
            console.log(order)
            
        });
        return res.json(order);
    },
    //Atualiza Status do Pedido
     async update(req, res){
         const { id , status } = req.body;
         await Order.findByIdAndUpdate(id, {status : status });

     }
}