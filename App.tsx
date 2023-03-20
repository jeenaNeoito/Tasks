/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React, {useEffect, useRef} from 'react';
import {
  NativeModules,
  Platform,
  StyleSheet,
  TouchableOpacity,
  View,
} from 'react-native';
import VideoPlayer from 'react-native-video-player';
import PipHandler from './src/PipHandler';
import {Pip} from './src/assets';

function App(): JSX.Element {
  const ref = useRef();

  const {PIPIosCustomModule} = NativeModules;

  const handleToggleMode = () => {
    if (Platform.OS === 'ios') {
      PIPIosCustomModule.enablePictureInPictureMode();
      // handleIosPipMode();
      // PipIosModule.startPIPMode('./src/assets/video/mikki.mp4');
    } else {
      PipHandler.enterPipMode(900, 500);
    }
  };

  return (
    <View style={styles.container}>
      <VideoPlayer
        ref={ref}
        video={require('./src/assets/video/mikki.mp4')}
        videoWidth={1600}
        videoHeight={900}
        // autoplay
        pauseOnPress
        playInBackground
        fullScreenOnLongPress
        controls
        // pictureInPicture
        resizeMode="contain"
        // disableControlsAutoHide
        showDuration
      />
      <TouchableOpacity
        style={styles.pipButton}
        onPress={() => {
          handleToggleMode();
        }}>
        <Pip stroke={10} />
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: '#ffffff',
    flex: 1,
  },
  videoContainer: {
    position: 'absolute',
    top: 0,
    left: 0,
    bottom: 0,
    right: 0,
  },
  pipButton: {
    position: 'absolute',
    ...Platform.select({
      ios: {
        top: 60,
      },
      android: {
        top: 0,
      },
    }),
    right: 0,
  },
});

export default App;
