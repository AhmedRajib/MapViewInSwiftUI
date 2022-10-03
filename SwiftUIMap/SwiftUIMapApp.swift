//
//  SwiftUIMapApp.swift
//  SwiftUIMap
//
//  Created by Ahmed Rajib on 3/10/22.
//

import SwiftUI

@main
struct SwiftUIMapApp: App {
    
    @StateObject private var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
