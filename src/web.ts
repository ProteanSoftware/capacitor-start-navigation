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
    window.open(`https://www.google.com/maps/dir/?api=1&destination=${options.latitude},${options.longitude}&travelmode=driving`, "_blank");
  }
}

const StartNavigationPlugin = new StartNavigationPluginWeb();

export { StartNavigationPlugin };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(StartNavigationPlugin);
