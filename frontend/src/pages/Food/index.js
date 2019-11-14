import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import api from '../../services/api';
import NavBar from '../Navbar'
import logo from '../../assets/logo.png'
import './styles.css';

export default function Food({history}) {
    const [foods, setFoods] = useState([]);
    useEffect(() => {
        async function loadFoods() {
            const user_id = localStorage.getItem('user');
            const response = await api.get('/food', {
                headers: { user_id }
            });
            setFoods(response.data);
        }
        loadFoods();
    }, []);

    function sair(){
        history.push('/');
      }

    return (
        <>

            <NavBar sair={() => sair()}/>
            <div className="container">
                <img src={logo} alt="TableMeal" />

                <div className="content">


                    <ul className="food-list">
                        {foods.map(food => (
                            <li key={food._id}>
                                <header style={{ backgroundImage: `url(${food.thumbnail_url})` }} />
                                <strong>{food.name}</strong>
                                <span>{food.price ? `R$ ${food.price}` : `GRATUITO`}</span>
                            </li>
                        ))}
                    </ul>


                    <Link to="/new">
                        <button className="btn">Adicionar um novo Prato</button>
                    </Link>
                </div>
            </div>
        </>
    )
}