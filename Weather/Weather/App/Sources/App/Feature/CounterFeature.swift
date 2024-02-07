import Foundation
import ComposableArchitecture

@Reducer
public struct CounterFeature {

  public init() { /* NOOP */ }

  @ObservableState
  public struct State {
    var count = 0

    public init() { /* NOOP */ }
  }

  public enum Action {
    case decrementButtonTapped
    case incrementButtonTapped
  }

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .decrementButtonTapped:
        state.count -= 1
        return .none
      case .incrementButtonTapped:
        state.count += 1
        return .none
      }
    }
  }
}
