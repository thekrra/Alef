import SwiftUI
import CoreLocation
import MapKit
import Combine



class LocationManager: NSObject, ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate{
  // MARK: Properties
  @Published var mapView: MKMapView = .init()
  @Published var manager: CLLocationManager = .init()
  //MARK: Search Bar Test
  @Published var searchText: String = ""
  var cancellable: AnyCancellable?
  override init() {
    super.init()
    // MARK: Setting Delegates
    manager.delegate = self
    mapView.delegate = self
    // MARK: Requesting Location Access
    manager.requestWhenInUseAuthorization()
    // MARK: Search Textfield Watching
    cancellable = $searchText
      .debounce (for: .seconds (0.5), scheduler: DispatchQueue.main)
      .removeDuplicates ()
      .sink(receiveValue: { value in
        self.fetchPlaces (value: value)
      })
  }
    func fetchPlaces (value: String){
    print(value)
  }
  }
