import React from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom';

import Login from './pages/Login';
import Food from './pages/Food';
import New from './pages/New';

export default function Routes(){
    return(<BrowserRouter>
        <Switch>
            <Route path="/" exact component={Login} />
            <Route path="/food" component={Food} />
            <Route path="/new" component={New} />
        </Switch>
    </BrowserRouter>
    );
}