const User = require('../models/User')
const Food = require('../models/Food');

module.exports = {
    
    //CHAMA TODOS OS PRATOS DE DETERMINADO RESTAURANTE
    async index(req,res){
        const { user_id } = req.headers;
        const allFoods = await Food.find({user : user_id});
        return res.json(allFoods);
    },

    //CRIA UM NOVO PRATO
    async store(req, res){
        
        const { filename } = req.file;
        const { name, price, description, type } = req.body;
        const { user_id} = req.headers;
        console.log(req.body)

        const user = await User.findById(user_id);
        const sameName = await Food.findOne({name : name});

        if(!user) {
            return res.status(400).json({ error: 'Esse usuario nao existe!'});
        }
        if(sameName) {
            return res.status(400).json({ error: 'Esse nome de alimento já existe!'});
        }

        const food = await Food.create({
            user : user_id,
            thumbnail: filename,
            name,
            price,
            description,
            type
        })
        return res.json(food)
    },

    //DELETA FOOD
    async delete(req,res){
        const { name } = req.query;
        await Food.deleteMany({name : name});
        return res.json({Mensagem: 'Deletou a comida!'});
    },
};