import React,{ useState } from 'react';

import api from '../../services/api';


export default function Login({ history }) {
    const [name, setName] = useState('');
  const [password, setPassword] = useState('');
  async function handleSubmit(event){
    event.preventDefault();
    
    const response = await api.get('/sessions', { params: {
      name : name,
      password: password
    }
    });
    if(!response.data){
      console.log("Login ou Senha incorreto!");
    }
    else{
      const {_id} = response.data;
      localStorage.setItem('user', _id);
      console.log("Logou!!");
      history.push('/food');
    }
    
  }


    return (
        <>
            <form onSubmit={handleSubmit}>
                <label htmlFor="name">NOME *</label>
                <input type="name" id="name" placeholder="Nome" value={name} onChange={event => setName(event.target.value)} />

                <label htmlFor="password">SENHA *</label>
                <input type="password" id="password" placeholder="Senha" value={password} onChange={event => setPassword(event.target.value)} />

                <button className="btn" type="submit">Login</button>
            </form>
        </>
    )
}