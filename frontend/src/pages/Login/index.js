import React, { useState } from 'react';
import api from '../../services/api';
import NavBar from '../Navbar'
import logo from '../../assets/logo.png'


export default function Login({ history }) {
  const [name, setName] = useState('');
  const [password, setPassword] = useState('');
  async function handleSubmit(event) {
    event.preventDefault();

    const response = await api.get(`/sessions/${name}`, {
      params: {
        name: name,
        password: password
      }
    });
    if (!response.data) {
      alert("Login ou Senha incorreto!");
    }
    else {
      const { _id } = response.data;
      sessionStorage.setItem('user', _id);
      sessionStorage.setItem('name', name);
      console.log("Logou!!");
      history.push('/food');
    }
  }
  function menu(){
    history.push('/');
  }
  function register(){
    history.push('/register');
  }
  function login(){
    history.push('/login');
  }


  return (

    <>
      <NavBar menu={() => menu()} register={() => register()} login={() => login()} />
      <div className="container">
        <img src={logo} alt="TableMeal" />

        <div className="content animated fadeInUp ease-out-circ d2 a-1 f2 fw3">
          <form onSubmit={handleSubmit}>
            <label htmlFor="name">NOME *</label>
            <input type="name" id="name" placeholder="Nome" value={name} onChange={event => setName(event.target.value)} />

            <label htmlFor="password">SENHA *</label>
            <input type="password" id="password" placeholder="Senha" value={password} onChange={event => setPassword(event.target.value)} />

            <button className="btn hvr-glow" type="submit">Login</button>
          </form>
        </div>
      </div>
    </>
  )
}