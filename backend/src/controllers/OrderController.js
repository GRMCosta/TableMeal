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
        const { table, foods } = req.body;
        const allFoods = await Food.find({_id: {$in: foods}});


        const order = await Order.create({
            table,
            foods: allFoods
        })
        console.log(order)
        return res.json(order);
    }
}