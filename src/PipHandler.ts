import {NativeEventEmitter, NativeModules, Platform} from 'react-native';

class PipHandler {
  EventEmitter: NativeEventEmitter | null;

  constructor() {
    this.EventEmitter =
      Platform.OS === 'android'
        ? new NativeEventEmitter(NativeModules.PipModule)
        : null;
  }

  onPipModeChanged(listener: (isModeEnabled: Boolean) => void) {
    return this?.EventEmitter?.addListener('PIP_MODE_CHANGE', listener);
  }

  enterPipMode(width?: number, height?: number) {
    return NativeModules?.PipModule?.enterPipMode(
      width ? Math.floor(width) : 0,
      height ? Math.floor(height) : 0,
    );
  }

  enblePIPModeIos() {
    return NativeModules.PIPIosCustomModule.enablePictureInPictureMode();
  }
}

export default new PipHandler();
