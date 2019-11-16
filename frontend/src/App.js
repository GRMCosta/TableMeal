import React from 'react';
import './App.css';


import Routes from './routes';

function App() {
  window.onbeforeunload = function(e) {
    localStorage.clear();
    // return nothing for no «quit confirmation»
  };
  return (
    <>
        <Routes />
    </>
  );
}

export default App;