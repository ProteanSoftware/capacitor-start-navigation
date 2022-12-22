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
   * Search for an address.
   * Can be used in combination with <c>latitude</c> and <c>longitude</c> to refine search results.
   */
  address?: string | null;
  /**
   * Name label to be shown for end Location
   */
  name?: string | null;
}

export interface StartNavigationPlugin {
  /**
   * Opens the native maps applications with directions started
   * @param options
   * @returns Promise
   */
  launchMapsApp(options: StartNavigationOptions): Promise<void>;
}
