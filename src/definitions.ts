declare module "@capacitor/core" {
  interface PluginRegistry {
    StartNavigationPlugin: StartNavigationPluginPlugin;
  }
}

export interface StartNavigationPluginPlugin {
  launchMapsApp(options: { value: string }): Promise<{value: string}>;
}
