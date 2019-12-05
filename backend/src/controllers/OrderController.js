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
        await Food.find({_id: {$in: foods}}, function(err, array){
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

<<<<<<< HEAD
    //Atualiza Status do Pedido
     async update(req, res){
         const { id , status } = req.query;
         console.log(req.query);
         await Order.findByIdAndUpdate(id, {$set : status });
=======
    //ATUALIZAR STATUS PEDIDO
     async update(req){
         const { id , status } = req.body;
         await Order.findByIdAndUpdate(id, {status : status });
>>>>>>> 00d9a9c425d0837bb5812339a8d9371659daa19e
     }
}