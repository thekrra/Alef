//
//  TabView.swift
//  DonationApplication
//
//  Created by Thekra on 27/08/1444 AH.
//

import SwiftUI

struct TabVieww: View {
    var body: some View {
      
        TabView {
                

             //Selection from map
                ContentView()
                
                    .tabItem {
                        Image(systemName: "globe.europe.africa")
                        Text("خريطة الخير")
                          }
             // Add to map
                  AddView()
                
                    .tabItem {
                        Image(systemName: "plus.circle")
                        Text("إضافة")
                        
                    }
                
                
                

            }

    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabVieww()
    }
}
