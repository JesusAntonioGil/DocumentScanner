//
//  HomeView.swift
//  DocumentScanner
//
//  Created by Jesus Antonio Gil on 17/2/25.
//

import SwiftUI
import SwiftData


struct HomeView: View {
    @State private var showScannerView: Bool = false
    @Query(sort: [.init(\Document.createdAt, order: .reverse)] ,animation: .snappy(duration: 0.25, extraBounce: 0)) private var documents: [Document]
    
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2), spacing: 15) {
                    ForEach(documents) { document in
                        
                    }
                }
                .padding(15)
            }
            .navigationTitle("Document´s")
            .safeAreaInset(edge: .bottom) {
                CreateButton()
            }
        }
        .fullScreenCover(isPresented: $showScannerView) {
            ScannerView { error in
                
            } didCancel: {
                
            } didFinish: { scan in
                
            }
            .ignoresSafeArea()
        }
    }
    
    
    @ViewBuilder
    private func CreateButton() -> some View {
        Button {
            showScannerView.toggle()
        } label: {
            HStack(spacing: 0) {
                Image(systemName: "document.viewfinder.fill")
                    .font(.title3)
                
                Text("Scan Documents")
            }
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(.purple.gradient, in: .capsule)
        }
        .hSpacing(.center)
        .padding(.vertical, 10)
        .background {
            Rectangle()
                .fill(.background)
                .mask {
                    Rectangle()
                        .fill(.linearGradient(colors: [
                            .white.opacity(0),
                            .white.opacity(0.6),
                            .white,
                            .white
                        ], startPoint: .top, endPoint: .bottom))
                }
                .ignoresSafeArea()
        }
    }
}


#Preview {
    ContentView()
}
