import React from 'react'
import './navbar.css'

import logo from '../../assets/car_icon.png'
import find from '../../assets/find_icon.png'
import user from '../../assets/user_icon.png'

export default function Navbar(){
    const name = localStorage.getItem('name')
    
    function showUser(){
        if(name)
            return (
               <>
                    <img src={user} id="user"/>
                    <span>{name}</span>
               </>
            )
        else
            return (
                <>
                    <span><a href="/login">login</a></span>
                    <span><a href="/registro">cadastre-se</a></span>
                </>
            )
    }

    return(
        <>
        <nav>
            <img id="logo" src={logo}/>
            <h1>Riide</h1>
            <div className="container-navbar">
              <input placeholder={`para onde deseja ir?`} /><a href="/"><img id="find" src={find}/></a>
                {showUser()}
            </div>
        </nav>
        </>
    )
}