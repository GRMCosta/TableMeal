import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import { Navbar, Button, Nav, Form, FormControl} from 'react-bootstrap';
    
export default function NavBar(){
    return (
        <>
            <Navbar bg="dark" variant="dark">
                <Navbar.Brand href="#home">TableMeal</Navbar.Brand>
                <Nav className="mr-auto">
                    <Nav.Link href="/login">Home</Nav.Link>
                    <Nav.Link href="/">Features</Nav.Link>
                    <Nav.Link href="#pricing">Pricing</Nav.Link>
                </Nav>
                <Form inline>
                    <FormControl type="text" placeholder="Search" className="mr-sm-2" />
                    <Button variant="outline-info">Search</Button>
                </Form>
            </Navbar>
            <br />
        </>
    )
}
