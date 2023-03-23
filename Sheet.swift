//
//  ContentView.swift
//  bbb
//
//  Created by Raghad Altoum on 23/08/1444 AH.
//

import SwiftUI
import MapKit

struct Sheet: View {
    
    
    
    //sections
    enum ProfileSection : String, CaseIterable {
        
        case All = "الكل"
        case Fridge = "ثلاجة طعام"
        case Box = "صندوق ملابس"
        case Water = "ماء سبيل"
    }
    
    //map
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 24.764090,
            longitude: 46.631575),
        
        latitudinalMeters: 6000,
        longitudinalMeters: 6000
    )
    
    
    //first selection = all
    
    @State var segmentationSelection : ProfileSection = .All
    @State private var showingEditScreen = false

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334722,
                                       longitude: -122.008889),
        span: MKCoordinateSpan(latitudeDelta: 1,
                               longitudeDelta: 1)
    )

    @State private var pins: [Pin] = [
        Pin(name: "Apple Park",
            description: "Apple Inc. headquarters",
            coordinate: CLLocationCoordinate2D(latitude: 37.334722,
                                               longitude:-122.008889))
    ]

    var body: some View {
        Map(coordinateRegion: $region,
            interactionModes: .all,
            annotationItems: pins,
            annotationContent: { pin in
                MapAnnotation(coordinate: pin.coordinate,
                              content: {
                                PinButtonView(pin: pin)
                              })
            })
    }
}
struct Pin: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var coordinate: CLLocationCoordinate2D

}
struct PinButtonView: View {
    @State private var showingEditScreen = false
    @State var pin: Pin

    var body: some View {
        Button(action: {
            showingEditScreen.toggle()
        }) {
            Image(systemName: "mappin")
                .padding()
                .foregroundColor(.red)
                .font(.title)
        }
        .sheet(isPresented: $showingEditScreen,
               content: {
                EditView(pin: self.$pin)
               })
    }
}
struct EditView: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var pin: Pin

    var body: some View {
        NavigationView {
            Form {
                    TextField("Place name", text: $pin.name)

                    TextField("Description", text: $pin.description)
            }
            .navigationTitle("Edit place")
            .navigationBarItems(trailing: Button("Done") {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}



struct Sheet_Previews: PreviewProvider {
    static var previews: some View {

                Sheet()
            }
        }
