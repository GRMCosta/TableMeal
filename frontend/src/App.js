import React from 'react';
import './App.css';

//import logo from './assets/'

function App() {
  return (
    <div className="container">
      {//<img src={logo} alt="TableMeal"/>
      }
      <div className="content">
      <form >
        <label htmlFor="nome">NOME *</label>
        <input type="nome" id="nome" placeholder="Nome"/>

        <label htmlFor="email">E-MAIL *</label>
        <input type="email" id="email" placeholder="E-mail"/>

        <label htmlFor="senha">SENHA *</label>
        <input type="senha" id="senha" placeholder="Senha"/>

        <label htmlFor="cnpj">CNPJ *</label>
        <input type="cnpj" id="cnpj" placeholder="CNPJ"/>
        <button className="btn" type="submit">Entrar</button>
      </form>
      </div>
    </div>
  );
}

export default App;