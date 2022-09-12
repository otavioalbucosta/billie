//
//  ScanData.swift
//  billie
//
//  Created by Otávio Albuquerque on 08/09/22.
//

import Foundation

class TextItem: Identifiable {
    var id: String
    var text: String = ""
    
    init() {
        id = UUID().uuidString
    }
}


class RecognizedContent: ObservableObject {
    @Published var items = [TextItem]()
}

