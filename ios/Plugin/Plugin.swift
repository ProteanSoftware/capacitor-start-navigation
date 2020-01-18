import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(StartNavigationPlugin)
public class StartNavigationPlugin: CAPPlugin {
    
    @objc func launchMapsApp(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""

        let latitude: CLLocationDegrees = 52.2823
        let longitude: CLLocationDegrees = 1.5849
        let regiondistance: CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionspan = MKCoordinateRegionMakeWithDistance(coordinates, regiondistance, regiondistance)
        let options = MKLaunchOptionsMapCenterKey:NSValue(MKCoordinate:regionspan.center),MKLaunchOptionsMapSpanKey:NSValue(MKCoordinateSpan:regionspan.span)]

        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapitem = MKMapItem(placemark: placemark)
        mapitem.name = "Name you want"
        mapitem.openInMapsWithLaunchOptions(options)
        
        call.success([
            "value": value
        ])
    }
}
