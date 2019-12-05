//index, show, store, update, destroy
const User = require('../models/User');

module.exports = {


    //Pega todos os restaurantes
    async index(req,res){
        allRestaurents = await User.find();
        return res.json(allRestaurents);
    },
    //Pega um Restaurante pelo nome e senha
    async show(req,res){
        const { name, password } = req.query;
        const restaurant = await User.findOne({name, password
        });
        return res.json(restaurant);
    },

    //Cria um novo Restaurante
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