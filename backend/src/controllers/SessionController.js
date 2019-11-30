//index, show, store, update, destroy
const User = require('../models/User');

module.exports = {


    //PEGA TODOS OS RESTAURANTES
    async index(req,res){
        allRestaurents = await User.find();
        return res.json(allRestaurents);
    },
    //PEGA UM RESTAURANTE
    async show(req,res){
        const { name, password } = req.query;
        const restaurant = await User.findOne({name, password
        });
        return res.json(restaurant);
    },

    //CRIA UM NOVO RESTAURANTE
    async store(req, res){
        const { name, email, password, cnpj } = req.body;
        // email = req.body.email ou o de cima

        let user = await User.findOne({ cnpj });

        if (!user){
            user = await User.create({name, email, password, cnpj });
        }
        else{
            return res.status(400).json({ error: 'Usuário já existe!'});
        }

        return res.json(user);
    }

    
};