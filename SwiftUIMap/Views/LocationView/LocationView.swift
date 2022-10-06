//
//  LocationView.swift
//  SwiftUIMap
//
//  Created by Ahmed Rajib on 3/10/22.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject var vm: LocationViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            VStack {
                
                header
                    .padding()

                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .padding()
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)
                                ))
                        }
                       
                    }
                }
            }
        }
        
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}


