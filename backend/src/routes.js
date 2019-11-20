const express = require('express');
const multer = require('multer');
const uploadConfig = require('./config/upload')
const OrderController = require('./controllers/OrderController');
const SessionController = require('./controllers/SessionController');
const FoodController = require('./controllers/FoodController');
const ClientController = require('./controllers/ClientConttroller');

const routes = express.Router();
const upload = multer(uploadConfig);

routes.get('/sessions', SessionController.index);
routes.post('/sessions', SessionController.store);


routes.get('/clients', ClientController.index);
routes.post('/clients', ClientController.store);

routes.get('/food', upload.single('thumbnail'), FoodController.index);
routes.post('/food', upload.single('thumbnail'), FoodController.store);
routes.delete('/food', FoodController.delete);

routes.get('/order', OrderController.index);
routes.post('/order', OrderController.store);



module.exports = routes;