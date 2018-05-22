import React from 'react';
import AppPlatform from './App_platform';
import AppExpo from './App_expo';

import renderer from 'react-test-renderer';

it('renders without crashing', () => {
  const rendered = renderer.create(<AppPlatform />).toJSON();
  expect(rendered).toBeTruthy();
});
