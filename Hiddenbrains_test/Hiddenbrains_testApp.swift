//
//  Hiddenbrains_testApp.swift
//  Hiddenbrains_test
//
//  Created by Jigar on 24/11/22.
//

import SwiftUI

@main
struct Hiddenbrains_testApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: SongListViewModel())
        }
    }
}
