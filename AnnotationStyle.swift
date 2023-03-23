//
//  AnnotationStyle.swift
//  DonationApplication
//
//  Created by Thekra on 27/08/1444 AH.
//

import SwiftUI


struct FrdigeIcon: View {
    
    var body: some View {
    
        
        VStack(spacing:0 ){
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
    }
    
    
}

struct AnnotationStyle_Previews: PreviewProvider {
    static var previews: some View {
        FrdigeIcon()
    }
}
