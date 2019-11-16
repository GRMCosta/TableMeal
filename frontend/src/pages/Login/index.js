import React, { useState } from 'react';
import api from '../../services/api';
import NavBar from '../Navbar'
import logo from '../../assets/logo.png'


export default function Login({ history }) {
  const [name, setName] = useState('');
  const [password, setPassword] = useState('');
  async function handleSubmit(event) {
    event.preventDefault();

    const response = await api.get('/sessions', {
      params: {
        name: name,
        password: password
      }
    });
    if (!response.data) {
      console.log("Login ou Senha incorreto!");
    }
    else {
      const { _id } = response.data;
      sessionStorage.setItem('user', _id);
      sessionStorage.setItem('name', name);
      console.log("Logou!!");
      history.push('/food');
    }
  }
  function register(){
    history.push('/');
  }
  function login(){
    history.push('/login');
  }


  return (

    <>
      <NavBar register={() => register()} login={() => login()} />
      <div className="container">
        <img src={logo} alt="TableMeal" />

        <div className="content">
          <form onSubmit={handleSubmit}>
            <label htmlFor="name">NOME *</label>
            <input type="name" id="name" placeholder="Nome" value={name} onChange={event => setName(event.target.value)} />

            <label htmlFor="password">SENHA *</label>
            <input type="password" id="password" placeholder="Senha" value={password} onChange={event => setPassword(event.target.value)} />

            <button className="btn" type="submit">Login</button>
          </form>
        </div>
      </div>
    </>
  )
}