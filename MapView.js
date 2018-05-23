import PropTypes from 'prop-types';
import React from 'react';
import {requireNativeComponent} from 'react-native';
import {  NativeEventEmitter, NativeModules} from 'react-native';
var RNTMap = NativeModules.RNTMapManager;

class MapView extends React.Component {
  _onRegionChange = (event) => {
    if (!this.props.onRegionChange) {
      return;
    }

    // process raw event...
    this.props.onRegionChange(event.nativeEvent);
  }
  render() {
    return (
      <RNTMap
		region={this.props.region} 
		zoomEnabled={this.props.zoomEnabled}
        onRegionChange={this._onRegionChange}
      />
    );
  }
}

MapView.propTypes = {
  /**
   * A Boolean value that determines whether the user may use pinch
   * gestures to zoom in and out of the map.
   */
  zoomEnabled: PropTypes.bool,

  /**
   * The region to be displayed by the map.
   *
   * The region is defined by the center coordinates and the span of
   * coordinates to display.
   */
  region: PropTypes.shape({
    /**
     * Coordinates for the center of the map.
     */
    latitude: PropTypes.number.isRequired,
    longitude: PropTypes.number.isRequired,

    /**
     * Distance between the minimum and the maximum latitude/longitude
     * to be displayed.
     */
    latitudeDelta: PropTypes.number.isRequired,
    longitudeDelta: PropTypes.number.isRequired,
  }),
};

// var RNTMap = requireNativeComponent('RNTMap', MapView);

module.exports = MapView;