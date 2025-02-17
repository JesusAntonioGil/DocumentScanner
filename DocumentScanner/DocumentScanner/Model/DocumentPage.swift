//
//  DocumentPage.swift
//  DocumentScanner
//
//  Created by Jesus Antonio Gil on 17/2/25.
//

import Foundation
import SwiftData


@Model
class DocumentPage {
    var document: Document?
    var pageIndex: Int
    @Attribute(.externalStorage) var pageData: Data
    
    
    init(document: Document? = nil, pageIndex: Int, pageData: Data) {
        self.document = document
        self.pageIndex = pageIndex
        self.pageData = pageData
    }
}
