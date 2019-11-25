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
            <div className="container">
                <div className="content2">
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Username</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td colSpan="2">Larry the Bird</td>
                                <td>@twitter</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </>
    )


}