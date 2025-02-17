//
//  ScannerView.swift
//  DocumentScanner
//
//  Created by Jesus Antonio Gil on 17/2/25.
//

import SwiftUI
import VisionKit


struct ScannerView: UIViewControllerRepresentable {
    var didFisnishWithError: (Error) -> ()
    var didCancel: () -> ()
    var didFinish: (VNDocumentCameraScan) -> ()
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = VNDocumentCameraViewController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var parent: ScannerView
        
        init(parent: ScannerView) {
            self.parent = parent
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            parent.didFinish(scan)
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            parent.didCancel()
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: any Error) {
            parent.didFisnishWithError(error)
        }
    }
}


