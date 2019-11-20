import React from 'react';
import NavBar from '../Navbar'
import logo from '../../assets/logo.png'

export default function Home({history}) {
    function register() {
        history.push('/register');
    }
    function login() {
        history.push('/login');
    }

    return (
        <>
        <NavBar register={() => register()} login={() => login()} />
        <img src={logo} alt="TableMeal" />
        </>
    )
}
