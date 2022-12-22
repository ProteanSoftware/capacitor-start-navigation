package com.servicesight.capacitor.startnavigation;

import android.content.Intent;
import android.net.Uri;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin
public class StartNavigationPlugin extends Plugin {

    @PluginMethod
    public void launchMapsApp(PluginCall call) {
        Double latitude = call.getDouble("latitude", 0d);
        Double longitude = call.getDouble("longitude", 0d);
        String address = call.getString("address", null);

        if (latitude == 0d && longitude == 0d && address == null) {
            call.reject("Must supply either: latitude & longitude or an address to search");
        }

        String query = "google.navigation:q=" + latitude + "," + longitude;

        if (address != null) {
            query += "?q=" + address.replace(' ', '+');
        }

        Uri gmmIntentUri = Uri.parse(query);
        Intent mapIntent = new Intent(Intent.ACTION_VIEW, gmmIntentUri);
        mapIntent.setPackage("com.google.android.apps.maps");
        getContext().startActivity(mapIntent);

        call.resolve();
    }
}
