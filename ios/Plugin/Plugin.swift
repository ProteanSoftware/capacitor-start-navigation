import Foundation
import Capacitor
import CoreLocation

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(StartNavigationPlugin)
public class StartNavigationPlugin: CAPPlugin {
    
    @objc func launchMapsApp(_ call: CAPPluginCall) {
        let latitude: CLLocationDegrees = call.getDouble("latitude");
        let longitude: CLLocationDegrees = call.getDouble("longitude");
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude);
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil);
        let mapitem = MKMapItem(placemark: placemark);
        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving];

        mapitem.name = call.getString("name") ?? "Destination";
        mapitem.openInMaps(launchOptions: options);
        call.success()
    }
}
