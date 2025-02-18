//
//  CGSize+Extensions.swift
//  DocumentScanner
//
//  Created by Jesus Antonio Gil on 18/2/25.
//

import Foundation


extension CGSize {
    // This function will return a new size that fits the given size in a aspect ratio
    func aspectFit(_ to: CGSize) -> CGSize {
        let scaleX = to.width / self.width
        let scaleY = to.height / self.height
        
        let aspectRatio = min(scaleX, scaleY)
        return .init(width: aspectRatio * width, height: aspectRatio * height)
    }
}
