import React from 'react';
import NavBar from '../Navbar'
import logo from '../../assets/logo.png'
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
                <div className="box">
                    <h1>TabelMeal</h1>
                </div>
            </div>

        </>
    )
}
