//
//  VisionSandboxApp.swift
//  VisionSandbox
//
//  Created by Abdulaziz Alobaili on 26/08/2022.
//

import SwiftUI

@main
struct VisionSandboxApp: App {
    @StateObject private var visionService = VisionService()
    
    var body: some Scene {
        WindowGroup {
            ContentView(visionService: visionService)
        }
    }
}
