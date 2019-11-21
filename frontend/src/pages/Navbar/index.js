import React from 'react'
import './navbar.css'

export default function Navbar(props) {

    const name = sessionStorage.getItem('name')
    function showUser() {
        if (name)
            return (
                <>
                    <span onClick={() =>  {props.cardapio()}}>Cardapio</span>
                    <span onClick={() =>  {props.pedidos()}}>Pedidos</span>
                    <span onClick={() =>  {sessionStorage.clear(); props.sair() }}>Sair</span>
                </>
            )
        else
            return (
                <>
                     <span onClick={() => props.login()}>Login</span>
                     <span onClick={() => props.register()}>Cadastre-se</span>
                </>
            )
    }
    return (
        <>
            <nav>
                <h1 onClick={() =>  {props.menu()}}>TableMeal</h1>
                <div className="container-navbar">
                    {showUser()}
                </div>
            </nav>
        </>
    )
}