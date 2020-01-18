import { WebPlugin } from '@capacitor/core';
import { StartNavigationPluginPlugin } from './definitions';

export class StartNavigationPluginWeb extends WebPlugin implements StartNavigationPluginPlugin {
  constructor() {
    super({
      name: 'StartNavigationPlugin',
      platforms: ['web']
    });
  }

  async launchMapsApp(options: {
    latitude: string,
    longitude: number,
    name?: string
  }): Promise<void> {
    console.log('launchMapsApp', options);
  }
}

const StartNavigationPlugin = new StartNavigationPluginWeb();

export { StartNavigationPlugin };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(StartNavigationPlugin);
