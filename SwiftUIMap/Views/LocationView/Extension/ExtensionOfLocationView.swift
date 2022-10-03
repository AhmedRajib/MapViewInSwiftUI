//
//  ExtensionOfLocationView.swift
//  SwiftUIMap
//
//  Created by Ahmed Rajib on 3/10/22.
//

import SwiftUI

extension LocationView {
    
    var header: some View {
        VStack {
            Button {
                 // MARK: - Handle Button Action
                withAnimation(.easeInOut) {
                    vm.showLocationsList.toggle()
                }
            } label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
//                            .rotationEffect(vm.showLocationsList ? .radians(.pi + (.pi)) : .radians(.pi))
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
                    
            }

            if vm.showLocationsList {
                LocationListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3) ,radius: 20, x: 0,y: 15)
    }
}
