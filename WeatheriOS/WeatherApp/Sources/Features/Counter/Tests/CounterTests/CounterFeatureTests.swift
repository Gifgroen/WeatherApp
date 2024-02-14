import XCTest
import ComposableArchitecture
@testable import Counter

@MainActor
final class CounterFeatureTests: XCTestCase {

  func testCounter() async throws {
    let store = TestStore(initialState: CounterFeature.State()) {
      CounterFeature()
    }

    await store.send(.incrementButtonTapped) { state in
      state.count = 1
    }
    await store.send(.decrementButtonTapped) { state in
      state.count = 0
    }
  }

  func testTimer() async throws {
    let store = TestStore(initialState: CounterFeature.State()) {
      CounterFeature()
    }

    await store.send(.toggleTimerButtonTapped) { state in
      state.isTimerRunning = true
    }
    await store.receive(\.timerTick, timeout: 2 * 1000000000) {
      $0.count = 1
    }
    await store.send(.toggleTimerButtonTapped) {
      $0.isTimerRunning = false
    }
  }

  func testDogFacts() async throws {
    let store = TestStore(initialState: CounterFeature.State()) {
      CounterFeature()
    } withDependencies: { deps in
      deps.dogFacts.fetch = { _ in FactResponse(facts: ["Who is a good boy?"], success: true)  }
    }

    await store.send(CounterFeature.Action.factButtonTapped)

    await store.receive(\.factResponse, timeout: 1000000000) {
      $0.fact = FactResponse(facts: ["Who is a good boy?"], success: true)
    }
  }
}
