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
    let addressQuery = null;
    if (options.address) {
      if (options.address.street != null) {
        addressQuery ??= "";
        addressQuery += options.address.street + ",";
      }

      if (options.address.city != null) {
        addressQuery ??= "";
        addressQuery += options.address.city + ",";
      }

      if (options.address.state != null) {
        addressQuery ??= "";
        addressQuery += options.address.state + ",";
      }

      if (options.address.postalCode != null) {
        addressQuery ??= "";
        addressQuery += options.address.postalCode + ",";
      }

      if (options.address.country != null) {
        addressQuery ??= "";
        addressQuery += options.address.country + ",";
      }

      // Remove last comma
      addressQuery = addressQuery?.slice(0, -1);
    } else {
      addressQuery = `${options.latitude},${options.longitude}`;
    }

    window.open(
      `https://www.google.com/maps/dir/?api=1&destination=${addressQuery}&travelmode=${travelMode}`,
      "_blank"
    );
  }
}

const StartNavigation = registerPlugin<StartNavigationPluginWeb>("StartNavigationPlugin", {
  web: () => import("./web").then((m) => new m.StartNavigationPluginWeb()),
});

export * from "./definitions";
export { StartNavigation };
