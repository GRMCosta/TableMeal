import React, { useEffect, useState } from 'react';
import api from '../../services/api';
import NavBar from '../Navbar'
import logo from '../../assets/logo.png'
import logodelete from '../../assets/delete.svg';
import './styles.css';

export default function Food({ history }) {
    const [foods, setFoods] = useState([]);
    useEffect(() => {
        async function loadFoods() {
            const user_id = sessionStorage.getItem('user');
            const response = await api.get('/food', {
                headers: { user_id }
            });
            setFoods(response.data);

        }
        loadFoods();

    }, []);

    function sair() {
        history.push('/');
    }
    function newFood() {
        history.push('/new');
    }

    async function removeFood(name) {
        const newFoods = foods.filter((food) => {
            return food.name !== name;
        });
        setFoods(newFoods);
        const response = await api.delete('/food', {
            params: {
                name: name
            }
          });
        console.log(response);
    }


    return (
        <>

            <NavBar sair={() => sair()} />
            <div className="container">
                <img className="addFoddImage" src={logo} alt="TableMeal" onClick={newFood} />

                <div className="content">


                    <ul className="food-list">
                        {foods.map((food) => (
                            <li key={food._id}>
                                <div class="show-image">
                                    <header style={{ backgroundImage: `url(${food.thumbnail_url})` }} />
                                    <img className="delete" type="button" src={logodelete} onClick={() => removeFood(food.name)} alt="delete" />
                                </div>
                                <strong>{food.name}</strong>
                                <span>{food.price ? `R$ ${food.price}` : `GRATUITO`}</span>
                            </li>
                        ))}
                    </ul>
                </div>
            </div>
        </>
    )
}