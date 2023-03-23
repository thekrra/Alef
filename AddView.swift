import Foundation
import MapKit
import SwiftUI



struct AddView: View {
  enum ProfileSection : String, CaseIterable {
      case fridge = "ثلاجة"
      case Box = "صندوق ملابس"
      case Water = "ماء سبيل"
  }
    
    
  @State private var showingEditScreen = false
  @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(
      latitude: 24.764090,
      longitude: 46.631575),
    latitudinalMeters: 6000,
    longitudinalMeters: 6000
  )
  @State private var showingPopover = false
  @State var segmentationSelection : ProfileSection = .fridge
  var body: some View {
    VStack{
      Picker("", selection: $segmentationSelection) {
        ForEach(ProfileSection.allCases, id: \.self) { option in
          Text(option.rawValue)
        }
      }.pickerStyle(SegmentedPickerStyle())
      MapView() .edgesIgnoringSafeArea(.all)
      Button("اضافة") {
           showingPopover = true
         }
         .popover(isPresented: $showingPopover) {
           Text("شكرا لك :)، سيتم النظر في طلبك خلال الأيام القادمة")
             .font(.headline)
             .frame(width: nil, height: 20.0)
         }
    }
  }

  struct MapView : UIViewRepresentable {
    func makeCoordinator () -> MapView.Coordinator {
      return MapView.Coordinator (parent1: self)
      let AccentColor = Color("AccentColor")
    }
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
      let map = MKMapView ( )
      let coordinate = CLLocationCoordinate2D(latitude: 24.767286, longitude: 46.635596)
      map.region = MKCoordinateRegion (center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
      let annotaion = MKPointAnnotation()
      annotaion.coordinate = coordinate
      map.delegate = context.coordinator
      map.addAnnotation (annotaion)
      return map
    }
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }
    class Coordinator : NSObject, MKMapViewDelegate{
      var parent : MapView
      init (parent1 : MapView) {
        parent = parent1
      }
      func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->
      MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier:
                        "pin")
        pin.isDraggable = true
        pin.pinTintColor = .red
        pin.animatesDrop = true
        return pin
      }
      func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState:
             MKAnnotationView.DragState) {
        print(view.annotation?.coordinate.latitude)
      }
    }
  }
}
struct ADDView_Previews: PreviewProvider {
  static var previews: some View {
    AddView()
  }
}

