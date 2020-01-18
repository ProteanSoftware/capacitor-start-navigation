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
          let coordinates = CLLocationCoordinate2DMake(latitude, longitude);
          let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil);
          let mapitem = MKMapItem(placemark: placemark);
          let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving];

          mapitem.name = call.getString("name") ?? "Destination";
          mapitem.openInMaps(launchOptions: options);
          call.success();
        } else {
          call.reject("latitude and/or longitude are null");
        }
    }
}
