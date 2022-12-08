//
//  StableDiffusionDemoApp.swift
//  StableDiffusionDemo
//
//  Created by Lambo77 on 2022/12/4.
//

import SwiftUI

@main
struct StableDiffusionDemoApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
