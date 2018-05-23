import React, { Component } from 'react';
import {  AppRegistry, StyleSheet, Text, View, Image } from 'react-native';
// import Camera from 'react-native-camera';
import MapView from './MapView.js';


// From native module
import {  NativeEventEmitter, NativeModules} from 'react-native';
var CalendarManager = NativeModules.CalendarManager;
var CalendarManagerSwift = NativeModules.CalendarManagerSwift;
CalendarManager.addEvent('Birthday Party', '4 Privet Drive, Surrey');
// CalendarManagerSwift.addEvent(
//   'Birthday Party',
//   '4 Privet Drive, Surrey',
//   date.getTime()
// ); //passing date as number of milliseconds since Unix epoch

// CalendarManager.findEvents((error, events) => {
// console.log(CalendarManager.firstDayOfTheWeek);
//   if (error) {
//     console.error(error);
//   } else {
//     // this.setState({events: events});
//   }
// });

async function updateEvents() {
  try {
    var events = await CalendarManager.findEvents();

    // this.setState({events});
  } catch (e) {
    console.error(e);
  }
}

updateEvents();


// Event from native module
const { CalendarManager } = NativeModules;

const calendarManagerEmitter = new NativeEventEmitter(CalendarManager);

const subscription = calendarManagerEmitter.addListener(
  'EventReminder',
  (reminder) => console.log(reminder.name)
);
// Don't forget to unsubscribe, typically in componentWillUnmount
subscription.remove();

type Props = {};
export default class AppExpo extends React.Component<Props> {
	onRegionChange(event) {
	    // Do stuff with event.region.latitude, etc.
	  }
	
	
	  renderImage(imgURI) {
	     return (
	       <Image source={{uri: imgURI}} style={styles.image} />
	     );
	   }
	
  render() {
//     return (
// <View style={styles.container}>
//        <Text style={styles.welcome}>
//          Welcome to React Native!
//        </Text>
//        <Text style={styles.instructions}>
//          To get started, edit index.android.js
//        </Text>
//        <Text style={styles.instructions}>
//          Double tap R on your keyboard to reload,{'\n'}
//          Shake or press menu button for dev menu
//        </Text>
//      </View>
//     );


var region = {
     latitude: 37.48,
     longitude: -122.16,
     latitudeDelta: 0.1,
     longitudeDelta: 0.1,
   };
 
// return <MapView region={region} zoomEnabled={false} onRegionChange={this.onRegionChange} style={{ flex: 1 }} />;

return (
      <View>
        {this.props.images.map(this.renderImage)}
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
   image: {
	   height: 300,
	   width:350,
   }
});
