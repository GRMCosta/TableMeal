import React, {useState, useMemo} from 'react';
import api from '../../services/api';


import camera from '../../assets/photo-camera.svg';

import './styles.css'

export default function New({history}){
    const [name, setName] = useState('');
    const [price, setPrice] = useState('');
    const [description, setDescription] = useState('');
    const [type, setType] = useState('');
    const [thumbnail , setThumbnail] = useState('');

    const preview = useMemo(() => {
        return thumbnail ? URL.createObjectURL(thumbnail) : null;
    },[thumbnail]
    )

    async function handleSubmit(event){
        event.preventDefault();

        const data = new FormData();
        const user_id = localStorage.getItem('user');

        data.append('thumbnail', thumbnail);
        data.append('name', name);
        data.append('price', price);
        data.append('description', description);
        data.append('type', type);

        await api.post('/food', data, {
            headers: {user_id}
        })

        history.push('/Food');
    }
    return (
        <form onSubmit={handleSubmit}>
            <label id="thumbnail" style={{ backgroundImage: `url(${preview})`}}
            className={thumbnail ? 'has-thumbnail' : ''}
            >
                <input type="file" 
                onChange={event => setThumbnail(event.target.files[0])}
                />
                <img src={camera} alt="Select img"/>
            </label>

            <label htmlFor="name">NOME DO PRATO *</label>
            <input 
            id="name"
            placeholder="Prato"
            value={name}
            onChange={event => setName(event.target.value)}
            />

            <label htmlFor="price">PREÇO *</label>
            <input 
                id="price"
                 placeholder="Preço"
                value={price}
                onChange={event => setPrice(event.target.value)}
            />

            <label htmlFor="price">DESCRIÇÃO *</label>
            <input 
                id="description"
                 placeholder="Descrição"
                value={description}
                onChange={event => setDescription(event.target.value)}
            />

            <label htmlFor="type">TIPO *</label>
            <input 
                id="type"
                 placeholder="Tipo"
                value={type}
                onChange={event => setType(event.target.value)}
            />
            <button type="submit" className="btn">Cadastrar Prato</button>
        </form>
    )
}