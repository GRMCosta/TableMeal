import React, { useState } from 'react';
import api from '../../services/api';
import NavBar from '../Navbar'
import logo from '../../assets/logo.png'

export default function Login({ history }) {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [cnpj, setCnpj] = useState('');


  async function handleSubmit(event) {
    event.preventDefault();

    const response = await api.post('/sessions', {
      name,
      email,
      password,
      cnpj
    });
    const { _id } = response.data;
    localStorage.setItem('user', _id);
    localStorage.setItem('name', name);
    history.push('/food');
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

            <label htmlFor="email">E-MAIL *</label>
            <input type="email" id="email" placeholder="E-mail" value={email} onChange={event => setEmail(event.target.value)} />

            <label htmlFor="password">SENHA *</label>
            <input type="password" id="password" placeholder="Senha" value={password} onChange={event => setPassword(event.target.value)} />

            <label htmlFor="cnpj">CNPJ *</label>
            <input type="cnpj" id="cnpj" placeholder="CNPJ" value={cnpj} onChange={event => setCnpj(event.target.value)} />

            <button className="btn" type="submit">Cadastrar</button>
          </form>
        </div>
      </div>
    </>
  )
}