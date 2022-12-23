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
        JSObject address = call.getObject("address", null);
        String mapsApp = call.getString("app", "googlemaps");

        if (latitude == 0d && longitude == 0d && address == null) {
            call.reject("Must supply either: latitude & longitude or an address to search");
        }

        String addressQuery = "";

        if (address != null) {
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
                addressQuery = addressQuery.substring(0, addressQuery.length() - 1);
            }
        }

        if (mapsApp.equals("waze")) {
            launchWaze(latitude, longitude, addressQuery);
            call.resolve();
        } else if (mapsApp.equals("googlemaps")) {
            launchGoogleMaps(latitude, longitude, addressQuery);
            call.resolve();
        } else {
            call.reject("maps app \"" + mapsApp + "\" is not supported");
        }
    }

    private void launchGoogleMaps(Double latitude, Double longitude, String address) {
        String query = "google.navigation:q=" + latitude + "," + longitude;
        query += "?q=" + address;

        Uri gmmIntentUri = Uri.parse(query);
        Intent mapIntent = new Intent(Intent.ACTION_VIEW, gmmIntentUri);
        mapIntent.setPackage("com.google.android.apps.maps");
        getContext().startActivity(mapIntent);
    }

    private void launchWaze(Double latitude, Double longitude, String address) {
        String url = "waze://?";

        if (address != null && address.length() > 0) {
            url += "q=" + address.replace("+", "%20");
        } else {
            url += "ll=" + latitude + "," + longitude;
        }

        url += "&navigate=yes";

        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        getContext().startActivity(intent);
    }
}
