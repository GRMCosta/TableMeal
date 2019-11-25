const Client = require('../models/Client');

module.exports = {

    async index(req,res){
        const { cpf,  password } = req.query;
        const client = await Client.find({ cpf , password });
        return res.json(client);
    },


    async store(req, res){
        const{ name, email, password, cpf} = req.body;

        let client = await Client.findOne({cpf});

        if(!client){
            client = await Client.create({ name, email, password, cpf});
        }
        else{
            return res.status(400).json({ error: 'Usuário já existe!'});
        }

        return res.json(client);
    }
}