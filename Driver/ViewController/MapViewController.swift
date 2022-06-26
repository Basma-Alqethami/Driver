//
//  MapViewController.swift
//  Driver
//
//  Created by Basma Alqethami on 20/11/1443 AH.
//

import UIKit
import MapKit
import CoreLocation
import GooglePlaces

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    var Manager = CLLocationManager()
    
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var searchView: UIStackView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTable: UITableView!
    
    var matchingItems:[MKMapItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTable.delegate = self
        searchTable.dataSource = self
        
        Manager.delegate = self
        Manager.desiredAccuracy = kCLLocationAccuracyBest
        
        if isLocationServiceEnabled(){
            checkAuthorization()
        }else{
            showAlart(msg: "Please enable location service")
        }
        searchBar.delegate = self
        }
    
    func isLocationServiceEnabled() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    func checkAuthorization(){
        switch Manager.authorizationStatus {
        case .notDetermined:
            Manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            Manager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
        case .authorizedAlways:
            Manager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
        case .denied:
            showAlart(msg: "Please authorize access to location")
            break
        case .restricted:
            showAlart(msg: "Authorization restricted")
            break
        default:
            showAlart(msg: "default ...")
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("location: \(location.coordinate)")
            zoomToUserLocation(location: location)
        }
        Manager.stopUpdatingLocation()
    }
    
    func zoomToUserLocation(location: CLLocation){
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            Manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            Manager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
        case .authorizedAlways:
            Manager.startUpdatingLocation()
            mapView.showsUserLocation = true
            break
        case .denied:
            showAlart(msg: "Please authorize access to location")
            break

        default:
            showAlart(msg: "default ...")
            break
        }
    }
    
    func showAlart(msg: String) {
        let alart = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alart.addAction(UIAlertAction(title: "Close", style: .default))
        alart.addAction(UIAlertAction(title: "Settings", style: .default, handler: {action in
            UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
        }))
        present(alart, animated: true, completion: nil)
    }
    
    @IBAction func btn_GetLocation(_ sender: Any) {
        Manager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    @IBAction func searchForDes(_ sender: Any) {
        searchView.isHidden = false
        locationView.isHidden = true
    }

}

extension MapViewController : UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchBarText = searchBar.text, !searchBarText.replacingOccurrences(of: " ", with: "").isEmpty else {
            return
        }
        matchingItems.removeAll()
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {
                return
            }
            self.matchingItems = response.mapItems
            self.searchTable.reloadData()
        }
    }
}

extension MapViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searrchCell",for: indexPath) as! SearchCell
        let selectedItem = matchingItems[indexPath.row].placemark
        let details = parseAddress(selectedItem: selectedItem)
        cell.searchResult.text = ("\(selectedItem.name!), \(details)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let Data = matchingItems[indexPath.row]
        dropPinZoomIn(placemark: Data.placemark)
    }
    
    func dropPinZoomIn(placemark:MKPlacemark){
        let region = MKCoordinateRegion(center: placemark.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
    
    func parseAddress(selectedItem:MKPlacemark) -> String {
        // put a space between "4" and "Melrose Place"
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
        // put a comma between street and city/state
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
        // put a space between "Washington" and "DC"
        let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
        let addressLine = String(
            format:"%@%@%@%@%@%@%@",
            // street number
            selectedItem.subThoroughfare ?? "",
            firstSpace,
            // street name
            selectedItem.thoroughfare ?? "",
            comma,
            // city
            selectedItem.locality ?? "",
            secondSpace,
            // state
            selectedItem.administrativeArea ?? ""
        )
        return addressLine
    }
}
//
//extension MapViewController: MKMapViewDelegate {
//
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        let identifier = "MyPin"
//
//        if annotation is MKUserLocation {
//            return nil
//        }
//
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//
//        if annotationView == nil {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView?.canShowCallout = true
//            annotationView?.image = UIImage(named: "Image")
//        } else {
//            annotationView?.annotation = annotation
//        }
//
//        return annotationView
//    }
//}
