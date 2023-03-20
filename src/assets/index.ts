import {lazy} from 'react';
import {FallBackUi, withIconSuspense} from '../utils/lazyIcon';

const Pip = withIconSuspense(
  lazy(() => import('../assets/svg/pip.svg')),
  FallBackUi,
);

export {Pip};
