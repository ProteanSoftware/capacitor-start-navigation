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
    /**
     * Defaults to 'driving'
     * All options are available on web
     * On iOS only 'driving', 'walking' & 'transit' are available
     * On Android only 'driving', 'walking', 'bicycling' are available
     */
    travelMode?: TravelMode
  }): Promise<void>;
}
