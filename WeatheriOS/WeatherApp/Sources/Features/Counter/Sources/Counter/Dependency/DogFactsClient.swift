import Foundation
import ComposableArchitecture

struct DogFactsClient {
  var fetch: (Int) async throws -> FactResponse
}

extension DogFactsClient: DependencyKey {
  static let liveValue = Self(
    fetch: { number in
      let (data, _) = try await URLSession.shared
        .data(from: URL(string: "https://dog-api.kinduff.com/api/facts?number=\(number)")!)
      let facts = try JSONDecoder().decode(FactResponse.self, from: data)
      return facts
    }
  )
}

extension DependencyValues {
  var dogFacts: DogFactsClient {
    get { self[DogFactsClient.self] }
    set { self[DogFactsClient.self] = newValue }
  }
}
