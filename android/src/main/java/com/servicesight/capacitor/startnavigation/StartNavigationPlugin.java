package com.servicesight.capacitor.startnavigation;

import com.getcapacitor.JSObject;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;

import android.content.Intent;
import android.net.Uri;

@CapacitorPlugin()
public class StartNavigationPlugin extends Plugin {

    @PluginMethod()
    public void launchMapsApp(PluginCall call) {
        Double latitude = call.getDouble("latitude");
        Double longitude = call.getDouble("longitude");
        String mode = call.getString("travelMode", "driving");
        mode = GetMode(mode);

        Uri gmmIntentUri = Uri.parse("google.navigation:q=" + latitude + "," + longitude + "&mode=" + mode);
        Intent mapIntent = new Intent(Intent.ACTION_VIEW, gmmIntentUri);
        mapIntent.setPackage("com.google.android.apps.maps");
        getContext().startActivity(mapIntent);

        call.resolve();
    }

    public String GetMode(String input) {
        String mode = "d";
        if (mode.equals("walking")) {
            mode = "w";
        } else if (mode.equals("bicycling")) {
            mode = "b";
        }

        return mode;
    }
}
