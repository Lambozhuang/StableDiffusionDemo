//
//  StableDiffusionDemo_MacApp.swift
//  StableDiffusionDemo-mac
//
//  Created by Lambo77 on 2022/12/4.
//

import SwiftUI

@main
struct StableDiffusionDemo_MacApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 600, maxWidth: 600, minHeight: 700, maxHeight: 700)
                .environmentObject(viewModel)
        }
    }
}
