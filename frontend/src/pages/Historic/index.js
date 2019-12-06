import React, { useEffect, useState } from 'react';
import api from '../../services/api';
import NavBar from '../Navbar'
import logo from '../../assets/logo.png'
import './styles.css'


export default function Historic({ history }) {
    console.log("ola")
    const [orders, setOrders] = useState([]);
    useEffect(() => {
        async function loadOrders() {
            const user_id = sessionStorage.getItem('user');
            const response = await api.get('/order', {
                params: { user_id }
            });
            setOrders(response.data);
            console.log(response.data);
        }
        loadOrders();
        
    }, []);


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
            <div className="imageDiv">
                <img id="orderImage" src={logo} alt="TableMeal" onClick={pedidos} />
            </div>
            <div className="content2">
                <table>
                    <tbody>
                        <tr>
                            <th>Nº Pedido</th>
                            <th>Pedido</th>
                            <th>Mesa</th>
                            <th>Status</th>
                        </tr>
                        {orders.map((order) => (
                            <tr key={order._id}>
                                <td>{order._id}</td>
                                <td>{order.foods.map((food) => (food.name + ","))}</td>
                                <td>{order.table}</td>
                                <td>{order.status}</td>
                            </tr>
                        ))}
                    </tbody>

                </table>

            </div>
        </>
    )


}