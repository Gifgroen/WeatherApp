import Foundation

public struct Contact: Equatable, Identifiable {
  public let id: UUID
  var name: String

  public init(id: UUID, name: String) {
    self.id = id
    self.name = name
  }
}
