/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
PanResponder,
  StyleSheet,
  Text,
  View
} from 'react-native';

import { Screen } from '@shoutem/ui';
import Camera from 'react-native-camera';
import { Surface } from "gl-react-native";
import Saturate from './Saturate';
import { scaleLinear } from 'd3-scale';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});


type Props = {};
export default class AppPlatform extends Component<Props> {

	state = {
	        width: null,
	        height: null,
	        path: "https://i.imgur.com/uTP9Xfr.jpg",
	        contrast: 1,
	        brightness: 1,
	        saturation: 1
	    }

       onLayout = (event) => {
           const { width, height } = event.nativeEvent.layout;

           this.setState({
               width,
               height
           });
       }
	   
	   refreshPic = () => {
	          // pic taking
 this.camera
           .capture({
               target: Camera.constants.CaptureTarget.temp,
               jpegQuality: 70
           })
           .then(data => this.setState({
               path: data.path
           }))
           .catch(err => console.error(err));
	      }

	      start() {
	          this.timer = setInterval(() => this.refreshPic(),
	                                   5);
	      }
		
		
dragScaleX = scaleLinear()
    dragScaleY= scaleLinear()
		
		  componentWillMount() {
		          this._panResponder = PanResponder.create({
		              onMoveShouldSetResponderCapture: () => true,
		              onMoveShouldSetPanResponderCapture: () => true,

		              onPanResponderGrant: (e, {x0, y0}) => {
		                  // start gesture
	const { width, height, brightness, contrast, saturation } = this.state;
this.dragScaleX
                    .domain([-x0, width-x0])
                    .range([-1, 1]);

                this.dragScaleY
                    .domain([-y0, height-y0])
                    .range([1, -1]);
		              },

		              onPanResponderMove: (e, {dx, dy}) => {
		                  // gesture progress
	this.setState({
	                    saturation: 1 + this.dragScaleX(dx),
	                    brightness: 1 + this.dragScaleY(dy)
	                });
		              },

		              onPanResponderRelease: (ev, {vx, vy}) => {
		                  // gesture complete
		              }
		          });

		      }
	
	      onComponentWillUnmount() {
	          clearInterval(this.timer);
	      }
    
       render() {
		   
		   const { width, height, brightness, contrast, saturation } = this.state;

		           const filter = {
		               brightness,
		               contrast,
		               saturation
		           }
		   if (width && height) {
		   return (
		              <Screen>
		                  <Camera style={{flex: 1}}
		                          ref={cam => this.camera=cam}
		                          aspect={Camera.constants.Aspect.fill}
								  
								 captureQuality={Camera.constants.CaptureQuality["720p"]}>
								  
				  <Surface style={{ width, height }}>
				              <Saturate {...filter}>
				                  {{ uri: "https://i.imgur.com/uTP9Xfr.jpg" }}
				              </Saturate>
				          </Surface>
                    
		                  </Camera>
								   <Text style={styles.capture} onPress={this.takePicture.bind(this)}>[CAPTURE]</Text>
		              </Screen>
		          );
			  } else {
				  return (
				                  <Screen onLayout={this.onLayout} />
				              );
			  }
       }
	   
	   takePicture() {
	     this.camera.capture()
	       .then((data) => console.log(data))
	       .catch(err => console.error(err));
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
  capture: {
     flex: 0,
     backgroundColor: '#fff',
     borderRadius: 5,
     color: '#000',
     padding: 10,
     margin: 40
   }
});


