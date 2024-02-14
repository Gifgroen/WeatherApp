import Foundation
import ComposableArchitecture
import Counter
import Contacts

@Reducer
public struct AppFeature {
  public init() { /* NOOP */ }

  public struct State: Equatable {
    public var tab1 = CounterFeature.State()

    public init() { /* NOOP */ }
  }

  public enum Action {
    case tab1(CounterFeature.Action)
  }

  public var body: some ReducerOf<Self> {
    Scope(state: \.tab1, action: \.tab1) {
      CounterFeature()
    }
    Reduce { action, state in
      return .none
    }
  }
}
