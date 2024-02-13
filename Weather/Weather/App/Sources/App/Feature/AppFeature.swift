import Foundation
import ComposableArchitecture

@Reducer
public struct AppFeature {
  public init() { /* NOOP */}

  public struct State: Equatable {
    public var tab1 = CounterFeature.State()
    public var tab2 = CounterFeature.State()

    public init() { /* NOOP */ }
  }

  public enum Action {
    case tab1(CounterFeature.Action)
    case tab2(CounterFeature.Action)
  }

  public var body: some ReducerOf<Self> {
    Scope(state: \.tab1, action: \.tab1) {
      CounterFeature()
    }
    Scope(state: \.tab2, action: \.tab2) {
      CounterFeature()
    }
    Reduce { action, state in
      return .none
    }
  }
}
