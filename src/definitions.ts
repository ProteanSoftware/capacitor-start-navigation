export interface StartNavigationAddress {
  street: string | null;
  city: string | null;
  state: string | null;
  postalCode: string | null;
  country: string | null;
}
export interface StartNavigationOptions {
  /**
   * Geo-coordinate latitude.
   * Can be null for address only search.
   */
  latitude?: string | number | null;
  /**
   * Geo-coordinate longitude.
   * Can be null for address only search.
   */
  longitude?: string | number | null;
  /**
   * Search for an address. (iOS and Android)
   * Can be used in combination with <c>latitude</c> and <c>longitude</c> to refine search results (Android only).
   */
  address?: StartNavigationAddress | null;
  /**
   * Name label to be shown for end Location
   */
  name?: string | null;

  /**
   * Defaults to 'driving'
   * All options are available on web
   * On iOS only 'driving', 'walking' & 'transit' are available
   * On Android only 'driving', 'walking', 'bicycling' are available
   */
  travelMode?: TravelMode
}

export type TravelMode = 'driving' | 'walking' | 'transit' | 'bicycling';

export interface StartNavigationPlugin {
  /**
   * Opens the native maps applications with directions started
   * @param options
   * @returns Promise
   */
  launchMapsApp(options: StartNavigationOptions): Promise<void>;
}
