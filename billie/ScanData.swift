//
//  ScanData.swift
//  billie
//
//  Created by Otávio Albuquerque on 08/09/22.
//

import Foundation

struct ScanData: Identifiable {
    var id = UUID()
    let content: String
    
    init(content: String){
        self.content = content
    }
}
