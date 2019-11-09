const Client = require('../models/Client');

module.exports = {
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