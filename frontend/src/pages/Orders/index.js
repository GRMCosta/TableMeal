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
                headers: { user_id }
            });
            console.log(response.data);
            setOrders(response.data);
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
                <div className="content2">
                    <table>
                        <tr>
                            <th>Prato</th>
                            <th>Mesa</th>
                            <th>Status</th>
                        </tr>
                        {orders.map((order) => (
                            <tr>
                                <td>{order.foods.map((food) =>(food.name + ","))}</td>
                                <td>{order.table}</td>
                                <td>Aguardando...</td>
                            </tr>
                        ))}
                    </table>

                </div>
        </>
    )


}