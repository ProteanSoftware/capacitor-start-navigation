/**
 * Waze (ios, android, web)
 * Google Maps (ios, android, web)
 * Apple Maps (ios)
 */
export type StartNavigationMapApp = "waze" | "googlemaps" | "applemaps";

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
   * The app id of the maps app to use. If not specified, the default maps app will be used.
   */
  appId?: StartNavigationMapApp | null;
}

export interface StartNavigationPlugin {
  /**
   * Opens the native maps applications with directions started
   * @param options
   * @returns Promise
   */
  launchMapsApp(options: StartNavigationOptions): Promise<void>;
}
