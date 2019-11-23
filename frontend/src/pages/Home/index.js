import React from 'react';
import NavBar from '../Navbar'
import logo from '../../assets/logo.png'
import alfa from '../../assets/alfa.png'
import './styles.css'

export default function Home({ history }) {
    function menu() {
        history.push('/');
    }
    function register() {
        history.push('/register');
    }
    function login() {
        history.push('/login');
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
            <NavBar sair={() => sair()} cardapio={() => cardapio()} pedidos={() => pedidos()} menu={() => menu()} register={() => register()} login={() => login()} />
            <div className="cont">
                <img className="image-container" src={logo} alt="TableMeal" />
                    <h1 className="animated fadeInUp ease-out-circ d2 a-1 f2 fw3">
                        Bem-vindo ao TableMeal !
                    </h1>
                    <h2 class="animated fadeInUp ease-out-circ d-1 a-2">
                        Crie seu cardápio e  se conecte com seus clientes !
                    </h2>
                <dv className="box animated fadeInUp ease-out-circ d-1 a-2">
                <h2>
                        Está em um estabelecimento que possui TableMeal?
                    </h2>
                    <h2>
                    Baixe o aplicativo agora mesmo e faça o seu pedido!
                    </h2>
                    <img src={alfa} alt="TableMeal" />
                </dv>
            </div>

        </>
    )
}
