# Tasks

React Native Task - Set up PIP Mode in both android and ios

## Plugins Used 

react-native-video-player -  for the video playback

## Methods

PipHandler - is a handler for handling native module methods
  - enterPipMode() -> To access `enterPipMode()` method mentioned inside native module
      - accepts width and height for pip mode and converts it into pip mode by using PictureInPictureParams of android
  - enblePIPModeIos() -> To access `enablePictureInPictureMode()` method inside the native module that contains the code to convert it into pip mode

# Demo
- android - [androidpip.webm](https://user-images.githubusercontent.com/78439989/226252697-05a6bba8-401e-4efb-a965-01be0b7b7693.webm)
- ios
