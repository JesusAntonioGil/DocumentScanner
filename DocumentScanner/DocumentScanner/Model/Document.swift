//
//  Document.swift
//  DocumentScanner
//
//  Created by Jesus Antonio Gil on 17/2/25.
//

import Foundation
import SwiftData


@Model
class Document {
    var name: String
    var createdAt: Date = Date()
    @Relationship(deleteRule: .cascade, inverse: \DocumentPage.document)
    var pages: [DocumentPage]?
    var isLocked: Bool = false
    // For Zoom Transition
    var uniqueViewID: String = UUID().uuidString
    
    
    init(name: String, pages: [DocumentPage]? = nil) {
        self.name = name
        self.pages = pages
    }
}
