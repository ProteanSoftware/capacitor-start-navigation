import { WebPlugin } from '@capacitor/core';
import { StartNavigationPluginPlugin } from './definitions';

export class StartNavigationPluginWeb extends WebPlugin implements StartNavigationPluginPlugin {
  constructor() {
    super({
      name: 'StartNavigationPlugin',
      platforms: ['web']
    });
  }

  async launchMapsApp(options: { value: string }): Promise<{value: string}> {
    console.log('launchMapsApp', options);
    return options;
  }
}

const StartNavigationPlugin = new StartNavigationPluginWeb();

export { StartNavigationPlugin };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(StartNavigationPlugin);
