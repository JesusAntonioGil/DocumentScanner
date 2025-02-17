//
//  DocumentScannerApp.swift
//  DocumentScanner
//
//  Created by Jesus Antonio Gil on 17/2/25.
//

import SwiftUI
import SwiftData


@main
struct DocumentScannerApp: App { 
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Document.self)
        }
    }
}
