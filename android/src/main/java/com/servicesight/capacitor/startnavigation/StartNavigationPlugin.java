package com.servicesight.capacitor.startnavigation;

import com.getcapacitor.JSObject;
import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;

import android.content.Intent;
import android.net.Uri;

@NativePlugin()
public class StartNavigationPlugin extends Plugin {

    @PluginMethod()
    public void launchMapsApp(PluginCall call) {
        String value = call.getString("value");

        Double latitude = 52.2823;
        Double longitude = 1.5849;

        Uri gmmIntentUri = Uri.parse("google.navigation:q=" + latitude + "," + longitude);
        Intent mapIntent = new Intent(Intent.ACTION_VIEW, gmmIntentUri);
        mapIntent.setPackage("com.google.android.apps.maps");
        getContext().startActivity(mapIntent);

        JSObject ret = new JSObject();
        ret.put("value", value);
        call.success(ret);
    }
}
