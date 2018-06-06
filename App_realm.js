import React, { Component } from 'react';
 
import { StyleSheet, View, Image, Text, Platform } from 'react-native';

var Realm = require('realm');

let realm ;
 
export default class AppRealm extends Component{

  constructor(){

    super();

    realm = new Realm({
      schema: [{name: 'User_Demo', 
      properties: 
      {
       id: {type: 'int',   default: 0},
       first_name: 'string', 
       last_name: 'string' 
      }}]
    });

  }

    render() {

      realm.write(() => {

       var ID = realm.objects('User_Demo').length + 1;

       realm.create('User_Demo', {id: ID, first_name: 'Pooja', last_name: 'Sharma'});
        
      });

      var A = realm.objects('User_Demo');

      var myJSON = JSON.stringify(A);

      realm.close();
      
      return (
    
          <View style={styles.MainContainer}>
          
            <Text style={{fontSize: 15, textAlign: 'center'}}>{myJSON}</Text>
             
          </View>
              
      );
    }
   }
    
   const styles = StyleSheet.create({
   MainContainer :{
   flex:1,
   alignItems: 'center',
   justifyContent: 'center',
   paddingTop: (Platform.OS) === 'ios' ? 20 : 0,
   margin: 10
   }
   });