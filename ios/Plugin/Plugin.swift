import Foundation
import Capacitor
import Contacts
import CoreLocation
import MapKit

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(StartNavigationPlugin)
public class StartNavigationPlugin: CAPPlugin {
    @objc func launchMapsApp(_ call: CAPPluginCall) {
        let mode = call.getString("travelMode", "driving");
        var options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving];
              
        if mode == "walking" {
          options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking];
        }
          
        if mode == "transit" {
          options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeTransit];
        }

        if let jsAddress = call.getObject("address") {
            let address = CNMutablePostalAddress()
            if let street = jsAddress["street"] as? String {
                address.street = street
            }
            if let city = jsAddress["city"] as? String {
                address.city = city
            }
            if let state = jsAddress["state"] as? String {
                address.state = state
            }
            if let postalCode = jsAddress["postalCode"] as? String {
                address.postalCode = postalCode
            }
            if let country = jsAddress["country"] as? String {
                address.country = country
            }
            let geocoder = CLGeocoder()
            geocoder.geocodePostalAddress(address) { (placemarks, error) in
                if let error = error {
                    call.reject(error.localizedDescription)
                } else if let placemarks = placemarks {
                    let mkPlacemark = MKPlacemark(placemark: placemarks[0])
                    let mapitem = MKMapItem(placemark: mkPlacemark)

                    mapitem.name = call.getString("name") ?? "Destination"
                    mapitem.openInMaps(launchOptions: options)
                    call.resolve()
                } else {
                    call.reject("Unknown error occured")
                }
            }
        } else if let latitude = call.getDouble("latitude"), let longitude = call.getDouble("longitude") {
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapitem = MKMapItem(placemark: placemark)

            mapitem.name = call.getString("name") ?? "Destination"
            mapitem.openInMaps(launchOptions: options)
            call.resolve()
        } else {
            call.reject("latitude and/or longitude are null")
        }
    }
}
