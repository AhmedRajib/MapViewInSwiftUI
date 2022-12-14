//
//  LocationListView.swift
//  SwiftUIMap
//
//  Created by Ahmed Rajib on 3/10/22.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject var vm: LocationViewModel
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                
                Button {
                     // MARK: - Handle Action
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)

                }
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationViewModel())
    }
}

extension LocationListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
                 
                VStack(alignment: .leading) {
                    Text(location.name)
                        .font(.headline)
                    Text(location.cityName)
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                    
            }
        }
    }
}
