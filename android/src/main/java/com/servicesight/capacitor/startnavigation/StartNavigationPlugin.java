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
        String mode = call.getString("travelMode", "driving");
        mode = GetMode(mode);
        JSObject address = call.getObject("address", null);

        if (latitude == 0d && longitude == 0d && address == null) {
            call.reject("Must supply either: latitude & longitude or an address to search");
        }

        String query = "google.navigation:q=" + latitude + "," + longitude;

        if (address != null) {
            String addressQuery = "";
            String street = address.getString("street", null);
            String city = address.getString("city", null);
            String state = address.getString("state", null);
            String postalCode = address.getString("postalCode", null);
            String country = address.getString("country", null);

            if (street != null) {
                addressQuery += street + "+";
            }

            if (city != null) {
                addressQuery += city + "+";
            }

            if (state != null) {
                addressQuery += state + "+";
            }

            if (postalCode != null) {
                addressQuery += postalCode + "+";
            }

            if (country != null) {
                addressQuery += country + "+";
            }

            if (addressQuery.length() > 0) {
                query += "?q=" + addressQuery.substring(0, addressQuery.length() - 1);
            }
        }

        query += "&mode=" + mode;

        Uri gmmIntentUri = Uri.parse(query);
        Intent mapIntent = new Intent(Intent.ACTION_VIEW, gmmIntentUri);
        mapIntent.setPackage("com.google.android.apps.maps");
        getContext().startActivity(mapIntent);

        call.resolve();
    }

    public String GetMode(String input) {
        String mode = "d";
        if (input.equals("walking")) {
            mode = "w";
        } else if (input.equals("bicycling")) {
            mode = "b";
        }

        return mode;
    }
}
