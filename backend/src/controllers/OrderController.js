const Order = require('../models/Order');
const Food = require('../models/Food');
const mongooese = require('mongoose');

module.exports = {

    //PEGAR TODOS OS PEDIDOS
    async index(req,res){
        const { user_id } = req.query;
        const allOrders = await Order.find({foods: {$elemMatch: {user: mongooese.Types.ObjectId(user_id)}}});
        return res.json(allOrders);
    },
//
    //CRIAR UM NOVO PEDIDO
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
    }

    //ATUALIZAR STATUS PEDIDO
    // async update(req, res){
    //     const { id , status } = req.query;
    //     await Order.findByIdAndUpdate(id, {$set : status })
    // }
}