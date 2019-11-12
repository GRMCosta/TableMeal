import React,{ useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import api from '../../services/api';
import './styles.css';

export default function Food(){
    const [foods, setFoods] = useState([]);
    useEffect(() =>{
        async function loadSpots(){
            const user_id = localStorage.getItem('user');
            const response = await api.get('/food', {
                headers: {user_id}
            });
            setFoods(response.data);
        }
        loadSpots();
    },[]);
    return (
        <>
            <ul className="food-list">
                {foods.map(food => (
                  <li key={food._id}>
                      <header style={{ backgroundImage: `url(${food.thumbnail_url})`}}/>
                      <strong>{food.name}</strong>
                      <span>{food.price ? `R$ ${food.price}` : `GRATUITO`}</span>
                  </li>  
                ))}
            </ul>
            

            <Link to="/new">
                <button className="btn">Adicionar um novo Prato</button> 
            </Link>
        </>
    )
}