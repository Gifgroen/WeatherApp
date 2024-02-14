import Foundation

public struct FactResponse: Codable {
  let facts: [String]
  let success: Bool
}

extension FactResponse: Equatable {
  public static func ==(lhs: FactResponse, rhs: FactResponse) -> Bool {
    return lhs.facts == rhs.facts
      && lhs.success == rhs.success
  }
}
