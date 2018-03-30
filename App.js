/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {};
export default class App extends Component<Props> {
  render() {
    var test = require('NativeModules').Auth0Provider

    console.log('WORKING')

    const AUTH0_CLIENT_ID = 'WBFKHsLTCkz4E6LakGbLQUAEP48maZys'
    const AUTH0_DOMAIN = 'lotspot.auth0.com'

    // test.configure()
    test.configureWithClientId(AUTH0_CLIENT_ID, AUTH0_DOMAIN)

    test.customizeWithResources({
      Auth0ThemeTitleText: 'LotSpot',
      Auth0ThemeLogoImageName: 'login-icon',
      Auth0ThemeTitleColor: '#121210',
      Auth0ThemeSeperatorTextColor: '#121210',
      Auth0ThemeBackgroundColor: '#ffffff',
      Auth0ThemePrimaryButtonColor: '#f25444',
      Auth0ThemePrimaryTintButtonColor: '#121210',
      Auth0ThemeSecondaryButtonColor: '#121210',
      Auth0ThemeInputTextColor: '#121210',
      Auth0ThemeInputPlaceholderTextColor: '#121210',
      Auth0ThemeInputIconColor: '#121210',
      Auth0ThemeHeaderColor: '#ffffff',
      Auth0ThemeInputBorderColor: '' // transparent
    })
    test.showAndFetchProfileWithCallback ( (accessTokenOrMsg,userProfile) => { 
      console.log(userProfile)
    })

   
    
      return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit App.js
        </Text>
        <Text style={styles.instructions}>
          {instructions}
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
