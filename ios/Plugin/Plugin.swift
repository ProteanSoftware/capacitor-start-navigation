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
        let appId = call.getString("appId", "applemaps")
        let latitude = call.getDouble("latitude", 0)
        let longitude = call.getDouble("longitude", 0)
        let address = CNMutablePostalAddress()
        var hasAddress = false
        if let jsAddress = call.getObject("address") {
            hasAddress = true
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
        }

        if appId == "applemap" {
            if hasAddress {
                let geocoder = CLGeocoder()
                geocoder.geocodePostalAddress(address) { (placemarks, error) in
                    if let error = error {
                        call.reject(error.localizedDescription)
                    } else if let placemarks = placemarks {
                        let mkPlacemark = MKPlacemark(placemark: placemarks[0])
                        let mapitem = MKMapItem(placemark: mkPlacemark)
                        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]

                        mapitem.name = call.getString("name") ?? "Destination"
                        mapitem.openInMaps(launchOptions: options)
                        call.resolve()
                    } else {
                        call.reject("Unknown error occured")
                    }
                }
            } else {
                let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
                let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
                let mapitem = MKMapItem(placemark: placemark)
                let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]

                mapitem.name = call.getString("name") ?? "Destination"
                mapitem.openInMaps(launchOptions: options)
                call.resolve()
            }
        } else if appId == "waze" {
            var wazeUrl = URL(string: "waze://")!
            if UIApplication.shared.canOpenURL(wazeUrl) {
                let bundleId = Bundle.main.bundleIdentifier
                var queryUrl = "https://waze.com/ul?"
                if hasAddress {
                    queryUrl += "q=\(address.street)%20\(address.city)%20\(address.state)%20\(address.postalCode)%20\(address.country)"
                } else {
                    queryUrl += "ll=\(latitude),\(longitude)"
                }
                wazeUrl = URL(string: "\(queryUrl)&navigate=yes&utm_source=\(bundleId)")!
                UIApplication.shared.open(wazeUrl, options: [:], completionHandler: nil)
                call.resolve()
            } else {
                call.reject("Waze not installed")
            }
        } else {
            call.reject("app id \"" + appId + "\" is not supported")
        }
    }
}
