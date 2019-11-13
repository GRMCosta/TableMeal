import React from 'react';

import './App.css';
import NavBar from './pages/Navbar'
import logo from './assets/logo.png'

import Routes from './routes';

function App() {
  return (
    <>
    <NavBar />
    <div className="container">
      <img className="Mylogo" src={logo} alt="TableMeal"/>
      
      <div className="content">
        <Routes />
      </div>
    </div>
    </>
  );
}

export default App;