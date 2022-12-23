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
    if (!options.appId) {
      options.appId = "googlemaps";
    }

    if (options.appId === "waze") {
      return this.launchWaze(options);
    } else if (options.appId === "googlemaps") {
      return this.launchGoogleMaps(options);
    } else {
      return Promise.reject(`AppId ${options.appId} is not supported`);
    }   
  }

  private launchWaze(options: StartNavigationOptions): Promise<void> {
    if (options.address) {
      const address = options.address;
      window.open(
        `https://www.waze.com/ul?q=${address.street} ${address.city} ${address.state} ${address.postalCode} ${address.country}&navigate=yes`,
        "_blank"
      );
    } else {
      window.open(
        `https://www.waze.com/ul?ll=${options.latitude},${options.longitude}&navigate=yes`,
        "_blank"
      );
    }

    return Promise.resolve();
  }

  private launchGoogleMaps(options: StartNavigationOptions): Promise<void> {
    window.open(
      `https://www.google.com/maps/dir/?api=1&destination=${options.latitude},${options.longitude}&travelmode=driving`,
      "_blank"
    );

    return Promise.resolve();
  }
}

const StartNavigation = registerPlugin<StartNavigationPluginWeb>("StartNavigationPlugin", {
  web: () => import("./web").then((m) => new m.StartNavigationPluginWeb()),
});

export * from "./definitions";
export { StartNavigation };
