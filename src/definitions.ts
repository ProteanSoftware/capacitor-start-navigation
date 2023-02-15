declare global {
  interface PluginRegistry {
    StartNavigationPlugin: StartNavigationPluginPlugin;
  }
}

export type TravelMode = 'driving' | 'walking' | 'transit' | 'bicycling';

export interface StartNavigationPluginPlugin {
  /**
   * Opens the native maps applications with directions started
   * @param options 
   * @returns Promise 
   */
  launchMapsApp(options: { 
    latitude: string | number,
    longitude: string | number,
    name?: string,
    travelMode?: TravelMode
  }): Promise<void>;
}
