//
//  File.swift
//  
//
//  Created by Karsten Westra on 12/02/2024.
//

import Foundation

public struct FactResponse: Codable {
  let facts: [String]
  let success: Bool
}
