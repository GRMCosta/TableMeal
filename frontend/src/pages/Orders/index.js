import React, { useEffect, useState } from 'react';
import api from '../../services/api';
import NavBar from '../Navbar'
import logo from '../../assets/logo.png'
import './styles.css'


export default function Order({ history }) {
    const [orders, setOrders] = useState([]);
    useEffect(() => {
        async function loadOrders() {
            const user_id = sessionStorage.getItem('user');
            const response = await api.get('/order', {
                params: { user_id }
            });
            console.log(response.data);
            setOrders(response.data);
        }
        loadOrders();
    }, []);

     async function statusOrder(id) {
         const newOrders = orders.filter((order) => {
             return order._id !== id;
         });
         setOrders(newOrders);
         const response = await api.put('/order', {
             id,
             status : "Enviado"
        });
         console.log(response);
     }

    function menu() {
        history.push('/');
    }
    function sair() {
        history.push('/login');
    }
    function cardapio() {
        history.push('/food');
    }
    function pedidos() {
        history.push('/orders');
    }

    return (
        <>
            <NavBar menu={() => menu()} sair={() => sair()} cardapio={() => cardapio()} pedidos={() => pedidos()} />
            <div className="content2">
                <table>
                    <tr>
                        <th>Nº Pedido</th>
                        <th>Pedido</th>
                        <th>Mesa</th>
                        <th>Status</th>
                    </tr>
                    {orders.map((order) => (
                        <tr>
                            <td>{order._id}</td>
                            <td>{order.foods.map((food) => (food.name + ","))}</td>
                            <td>{order.table}</td>
                            <td>
                                <select id="status" onChange={() => statusOrder(order._id)}  >
                                    <option value="Aguardando">Aguardando...</option>
                                    <option value="Pedido Enviado!">Enviar Pedido</option>
                                </select>
                            </td>
                        </tr>
                    ))}
                </table>

            </div>
        </>
    )


}