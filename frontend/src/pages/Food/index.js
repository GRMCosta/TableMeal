import React,{ useEffect } from 'react';
import api from '../../services/api';

export default function Food(){
    useEffect(() =>{
        async function loadSpots(){
            const user_id = localStorage.getItem('user');
            const response = await api.get('/food', {
                headers: {user_id}
            });
            console.log(response.data);
        }
        loadSpots();
    },[]);
    return <div></div>
}