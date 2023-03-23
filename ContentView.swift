
// contet.swift
// aaa
//
// Created by Raghad Altoum on 27/08/1444 AH.
//

import MapKit
import SwiftUI
import CoreLocation


struct ContentView: View {
    
  @StateObject var locationManager: LocationManager = .init()
    
    
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
  @State var segmentationSelection : ProfileSection = .fridge
  var body: some View {
    VStack{
      Picker("", selection: $segmentationSelection) {
        ForEach(ProfileSection.allCases, id: \.self) { option in
          Text(option.rawValue)
        }
      }.pickerStyle(SegmentedPickerStyle())
      if segmentationSelection.rawValue == "ثلاجة" {
        var pins: [Pin] = [
          Pin(name: " ثلاجة طعام خيرية" ,
            description:"حي العقيق",
            coordinate: CLLocationCoordinate2D(latitude: 24.764090,
                              longitude: 46.631575)),
          Pin(
            name: "ثلاجة ٢",
            description: "ثلاجة رقم اثنين",
            coordinate: CLLocationCoordinate2D(latitude: 24.800173,
                              longitude: 46.625800)),
          Pin(name: "ثلاجة ٣",
            description: "ثلاجة رقم ثلاثة",
            coordinate: CLLocationCoordinate2D(latitude: 24.779077,
                              longitude: 46.642060))
        ]
          Map(coordinateRegion: $region,
            interactionModes: .all,
            annotationItems: pins,
            annotationContent: { pin in
            MapAnnotation(coordinate: pin.coordinate,
                   content: {
              PinButtonView2(pin: pin)
            })
          })
      } else if segmentationSelection.rawValue == "صندوق ملابس" {
        var pins: [Pin] = [
          Pin(name: "صندوق خيري ",
            description: "صندوق ملابس للتبرع ",
            coordinate: CLLocationCoordinate2D(latitude: 24.764090, longitude: 46.631575))
        ]
        Map(coordinateRegion: $region,
          interactionModes: .all,
          annotationItems: pins,
          annotationContent: { pin in
          MapAnnotation(coordinate: pin.coordinate,
                 content: {
            PinButtonView3(pin: pin)
          })
        })
      } else {
        var pins: [Pin] = [
          Pin(name: "ماء سبيل",
            description: "برادة ماء سبيل خيرية",
            coordinate: CLLocationCoordinate2D(latitude: 24.800173,
                              longitude: 46.631575)),
          Pin(name: "ماء سبيل ٢ ",
            description: " برادة ماء سبيل خيرية",
            coordinate: CLLocationCoordinate2D(latitude: 24.800955,
                              longitude: 46.660925))
        ]
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
    }}
}
struct Pin: Identifiable {
  let id = UUID()
  var name: String
  var description: String
  var coordinate: CLLocationCoordinate2D
}
let AccentColor = Color("AccentColor")

struct PinButtonView: View {
  @State private var showingEditScreen = false
  @State var pin: Pin
  var body: some View {
    Button(action: {
      showingEditScreen.toggle()
    }) {
      Image(systemName: "drop.circle.fill")
           .resizable()
           .scaledToFit()
           .frame(width: 30,height: 30)
           .font(.headline)
           .foregroundColor(.white)
           .padding(6)
           .background(AccentColor)
           .cornerRadius(36)
    }
    .sheet(isPresented: $showingEditScreen,
          content: { HStack {
         Image ("water")
           .resizable()
           . frame (width: 100, height: 100) .cornerRadius (8)
         VStack(alignment:
           .leading) {
               Label("الرياض - حي الصحافة", systemImage: "mappin.and.ellipse")
               Label("على بعد ١٠ دقائق", systemImage: "clock.arrow.circlepath")
               Label("على بعد ٨ كم",
             systemImage: "paperplane.circle")
             }
       }
       .padding ()
       .presentationDetents ([. fraction (0.20)])
       .presentationDragIndicator(.visible)
               })
     }
   }
struct PinButtonView2: View {
  @State private var showingEditScreen = false
  @State var pin: Pin
  var body: some View {
    Button(action: {
      showingEditScreen.toggle()
    }) {
      Image(systemName: "refrigerator.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 30,height: 30)
          .font(.headline)
          .foregroundColor(.white)
          .padding(6)
          .background(AccentColor)
          .cornerRadius(36)
    }
    .sheet(isPresented: $showingEditScreen,
          content: { HStack {
      Image ("fridge")
        .resizable()
        . frame (width: 100, height: 100) .cornerRadius (10)
         VStack(alignment:
           .leading) {
               Label("الرياض - حي الغدير", systemImage: "mappin.and.ellipse")
               Label("على بعد ٧ دقائق", systemImage: "clock.arrow.circlepath")
               Label("على بعد ٥ كم",
             systemImage: "paperplane.circle")
             }
       }
       .padding ()
       .presentationDetents ([. fraction (0.20)])
       .presentationDragIndicator(.visible)
          })
     }
   }
struct PinButtonView3: View {
  @State private var showingEditScreen = false
  @State var pin: Pin
  var body: some View {
    Button(action: {
      showingEditScreen.toggle()
    }) {
      Image(systemName: "archivebox.circle.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 30,height: 30)
          .font(.headline)
          .foregroundColor(.white)
          .padding(6)
          .background(AccentColor)
          .cornerRadius(36)
    }
    .sheet(isPresented: $showingEditScreen,
          content: { HStack {
         Image ("box")
           .resizable()
           . frame (width: 100, height: 100) .cornerRadius (10)
         VStack(alignment:
            .leading) {
             Label("الرياض - حي حطين", systemImage: "mappin.and.ellipse")
               Label("على بعد ٣ دقائق", systemImage: "clock.arrow.circlepath")
               Label("على بعد ١,٥ كم",
                  systemImage: "paperplane.circle")
             }
       }
       .padding ()
       .presentationDetents ([. fraction (0.20)])
       .presentationDragIndicator(.visible)
          })
     }
   }
// HERE
struct EditView: View {
  @Environment(\.presentationMode) var presentationMode
  @Binding var pin: Pin
  var body: some View {
    NavigationView {
      Form {
          TextField("Place name", text: $pin.name)
          TextField("Description", text: $pin.description)
      }
      .navigationTitle("معلومات اضافية")
      .navigationBarItems(trailing: Button("انهاء") {
        self.presentationMode.wrappedValue.dismiss()
      })
    }
  }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
