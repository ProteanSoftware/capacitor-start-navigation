import Foundation
import Capacitor
import CoreLocation
import MapKit

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(StartNavigationPlugin)
public class StartNavigationPlugin: CAPPlugin {
    
    @objc func launchMapsApp(_ call: CAPPluginCall) {

        if let latitude = call.getDouble("latitude"), let longitude = call.getDouble("longitude") {
          let mode = call.getString("travelMode", "driving");
          let coordinates = CLLocationCoordinate2DMake(latitude, longitude);
          let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil);
          let mapitem = MKMapItem(placemark: placemark);
          var options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving];
            
          if mode == "walking" {
            options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking];
          }
          
          if mode == "transit" {
            options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeTransit];
          }

          mapitem.name = call.getString("name") ?? "Destination";
          mapitem.openInMaps(launchOptions: options);
          call.resolve();
        } else {
          call.reject("latitude and/or longitude are null");
        }
    }
}
