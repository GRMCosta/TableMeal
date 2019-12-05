const express = require('express'); // biblioteca express para criar servidor
const mongoose = require('mongoose'); // biblioteca mongo para conectar no banco de dados
const cors = require('cors');
const path = require('path');
const routes = require('./routes');
const app = express();



mongoose.connect('mongodb+srv://tableMeal:tableMeal@tablemeal-n6whx.mongodb.net/tableMeal?retryWrites=true&w=majority', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
<<<<<<< HEAD
}); // url do banco mongoatlas
=======
    useFindAndModify: false
});
>>>>>>> 00d9a9c425d0837bb5812339a8d9371659daa19e

// req.query = acessar query params (para filtros)
// req.params = acessar route params ( para edição e delete)
// req.body = acessar corpo de requisição (para criação, edição)

app.use(cors())
app.use(express.json());
app.use('/files', express.static(path.resolve(__dirname, '..', 'others')));
app.use(routes);
app.listen(9999); // Porta do servidor

