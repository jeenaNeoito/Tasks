import {useState, useEffect} from 'react';
import {Platform, EmitterSubscription} from 'react-native';

import PipHandler from './PipHandler';

export function usePipMode(): Boolean {
  const [isModeEnabled, setIsPipModeEnabled] = useState<Boolean>(false);

  useEffect(() => {
    let pipListener: EmitterSubscription | undefined;
    if (Platform.OS === 'android') {
      pipListener = PipHandler.onPipModeChanged(setIsPipModeEnabled);
    }

    return () => {
      pipListener?.remove();
    };
  }, []);
  console.log('isModeEnabled', isModeEnabled);

  return isModeEnabled;
}

export default usePipMode;
