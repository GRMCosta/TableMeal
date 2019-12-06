import React from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom';

import NavBar from './pages/Navbar';
import Home from './pages/Home';
import Register from './pages/Register';
import Login from './pages/Login';
import Food from './pages/Food';
import New from './pages/New';
import Orders from './pages/Orders';
import Historic from './pages/Historic';

export default function Routes(){
    return(<BrowserRouter>
        <Switch>
            <Route path="/" exact component={Home} />
            <Route path="/register" component={Register}/>
            <Route path="/navbar" component={NavBar} />
            <Route path="/login" component={Login} />
            <Route path="/food" component={Food} />
            <Route path="/new" component={New} />
            <Route path="/orders" component={Orders} />
            <Route path="/historic" component={Historic} />
        </Switch>
    </BrowserRouter>
    );
}