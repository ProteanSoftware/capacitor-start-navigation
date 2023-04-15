import { WebPlugin, registerPlugin } from "@capacitor/core";

import type { StartNavigationOptions, StartNavigationPlugin } from "./definitions";

export class StartNavigationPluginWeb extends WebPlugin implements StartNavigationPlugin {
  constructor() {
    super({
      name: "StartNavigationPlugin",
      platforms: ["web"],
    });
  }

  async launchMapsApp(options: StartNavigationOptions): Promise<void> {
    const travelMode = options.travelMode || 'driving';
    window.open(
      `https://www.google.com/maps/dir/?api=1&destination=${options.latitude},${options.longitude}&travelmode=${travelMode}`,
      "_blank"
    );
  }
}

const StartNavigation = registerPlugin<StartNavigationPluginWeb>("StartNavigationPlugin", {
  web: () => import("./web").then((m) => new m.StartNavigationPluginWeb()),
});

export * from "./definitions";
export { StartNavigation };
