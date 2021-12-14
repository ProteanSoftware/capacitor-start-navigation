package com.servicesight.capacitor.startnavigation;

import com.getcapacitor.JSObject;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;

import android.content.Intent;
import android.net.Uri;

import org.json.JSONException;

@CapacitorPlugin()
public class StartNavigationPlugin extends Plugin {

    @PluginMethod()
    public void launchMapsApp(PluginCall call) {
        try {
            Double latitude = call.getData().getDouble("latitude");
            Double longitude = call.getData().getDouble("longitude");
            Uri gmmIntentUri = Uri.parse("google.navigation:q=" + latitude + "," + longitude);

            Intent mapIntent = new Intent(Intent.ACTION_VIEW, gmmIntentUri);
            mapIntent.setPackage("com.google.android.apps.maps");
            getContext().startActivity(mapIntent);

            call.success();
        } catch (JSONException e) {
            e.printStackTrace();
        }


    }
}
