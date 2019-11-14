import React from 'react'
import './navbar.css'

export default function Navbar(props) {

    const name = localStorage.getItem('name')
    function showUser() {
        if (name)
            return (
                <>
                    <span>{name}</span>
                    <span onClick={() =>  {localStorage.clear(); props.sair() }}>Sair</span>
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
                <h1>TableMeal</h1>
                <div className="container-navbar">
                    {showUser()}
                </div>
            </nav>
        </>
    )
}