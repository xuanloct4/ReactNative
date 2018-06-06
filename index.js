import { AppRegistry } from 'react-native';
import AppPlatform from './App_platform';
import AppExpo from './App_expo';
import AppRealm from './App_realm';
import AppPush from './App_pushnotification';

// AppRegistry.registerComponent('ReactNative', () => AppPlatform);
// AppRegistry.registerComponent('Expo', () => AppExpo);
// AppRegistry.registerComponent('ReactNative', () => AppExpo);
AppRegistry.registerComponent('ReactNative', () => AppRealm);
// AppRegistry.registerComponent('ReactNative', () => AppPush);
