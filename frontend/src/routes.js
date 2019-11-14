import React from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom';

import NavBar from './pages/Navbar';
import Register from './pages/Register';
import Login from './pages/Login';
import Food from './pages/Food';
import New from './pages/New';

export default function Routes(){
    return(<BrowserRouter>
        <Switch>
            <Route path="/" exact component={Register} />
            <Route path="/navbar" component={NavBar} />
            <Route path="/login" component={Login} />
            <Route path="/food" component={Food} />
            <Route path="/new" component={New} />
        </Switch>
    </BrowserRouter>
    );
}