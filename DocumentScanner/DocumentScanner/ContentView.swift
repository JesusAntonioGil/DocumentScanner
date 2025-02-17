//
//  ContentView.swift
//  DocumentScanner
//
//  Created by Jesus Antonio Gil on 17/2/25.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("showIntroView") private var showIntroView: Bool = true
    
    var body: some View {
        HomeView()
            .sheet(isPresented: $showIntroView) {
                InfoScreenView()
                    .interactiveDismissDisabled()
            }
    }
}


#Preview {
    ContentView()
}
