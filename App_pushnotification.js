import React, { Component, DeviceEventEmitter } from 'react';
import {
 StyleSheet,
 Text,
 View,
 Button,
 Platform
} from 'react-native';

import * as pushNotifications from './services/pushNotifications';

export {
 pushNotifications,
}

import PushNotificationAndroid from 'react-native-push-notification'
// (function() {
// handleNotificationActions();
// })();


export default class AppPush extends Component{
	
	componentDidMount() {
		pushNotifications.configure();
		// handleNotificationActions();
	}
	
   
	
	    render() {
		    const handleOnPress = () => {
		      pushNotifications.localNotification();
			  pushNotifications.scheduledNotifications();
		    };
			
 return (
   <View style={styles.MainContainer}>
     <Text>
       Press the button to see push Notification
     </Text>
     <Button
       title={'Press Me'}
       onPress={handleOnPress}/>
   </View>
 );
}
}


const handleNotificationActions = () => {
	    // Register all the valid actions for notifications here and add the action handler for each action
	    PushNotificationAndroid.registerNotificationActions(['Accept','Reject','Yes','No']);
	    DeviceEventEmitter.addListener('notificationActionReceived', function(action){
	      console.log ('Notification action received: ' + action);
	      const info = JSON.parse(action.dataJSON);
	      if (info.action == 'Accept') {
	        // Do work pertaining to Accept action here
	      } else if (info.action == 'Reject') {
	        // Do work pertaining to Reject action here
	      }
	      // Add all the required actions handlers
	    });
};

const styles = StyleSheet.create({
MainContainer :{
flex:1,
alignItems: 'center',
justifyContent: 'center',
paddingTop: (Platform.OS) === 'ios' ? 20 : 0,
margin: 10
}
});