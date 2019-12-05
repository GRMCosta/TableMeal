const Client = require('../models/Client');

module.exports = {
//Funçoes do Cliente chamadas pelas APIs

//Busca um Cliente pelo CPF e Senha
    async index(req,res){
        const { cpf,  password } = req.query;
        const client = await Client.findOne({ cpf , password });

        if(!client){
            return res.status(400).json({ error: 'CPF OU SENHA INVÁLIDO'});
        }
        else {
            return res.json(client);
        }
    },

//Cria um Cliente novo
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