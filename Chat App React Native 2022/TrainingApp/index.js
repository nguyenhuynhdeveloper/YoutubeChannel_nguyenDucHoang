/**
yarn add axios
rmdir /s node_modules
 */
import {AppRegistry} from 'react-native'
import React from 'react';
import {name as appName} from './app.json'
/*
import {
    Welcome, 
    Login, 
    Register,
    FoodList,
    ProductGridView,
    Settings,
} from './screens'
import UITab from './navigation/UITab'
*/
import App from './navigation/App'

let fakedProducts = [
    {
        productName: 'iphone 3',
        year: 2013
    },
    {
        productName: 'iphone 5',
        year: 2015
    },
    {
        productName: 'iphone 4',
        year: 2014
    },
    {
        productName: 'iphone 6',
        year: 2016
    },
]
/*
AppRegistry.registerComponent(appName,
    () => () => <Welcome 
                    x={5} y = {10}
                    person={{
                        name: 'Nguyen Duc Hoang',
                        age: 18,
                        email: 'hoangnd@gmail.com'
                    }}
                    products={fakedProducts}
                    />)
*/
AppRegistry.registerComponent(appName,() => () => <App />)
