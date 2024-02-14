import Foundation
import ComposableArchitecture

@Reducer
public struct CounterFeature {

  public init() { /* NOOP */ }

  @ObservableState
  public struct State: Equatable {
    public static func == (lhs: CounterFeature.State, rhs: CounterFeature.State) -> Bool {
      return lhs.count == rhs.count
      && lhs.fact == rhs.fact
      && lhs.isTimerRunning == rhs.isTimerRunning
    }
 
    public var count = 0
    var fact: FactResponse? = nil
    var isTimerRunning = false

    public init() { /* NOOP */ }
  }

  public enum Action {
    case decrementButtonTapped
    case incrementButtonTapped
    case factButtonTapped
    case factResponse(FactResponse)
    case timerTick
    case toggleTimerButtonTapped
  }

  enum CancelID { case timer }

  @Dependency(\.dogFacts) var dogFacts

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .decrementButtonTapped:
        state.count -= 1
        return .none

      case .incrementButtonTapped:
        state.count += 1
        return .none

      case .factButtonTapped:
        return .run { [count = state.count] send in
          try await send(.factResponse(self.dogFacts.fetch(count)))
        }

      case .factResponse(let fact):
        state.fact = fact
        return .none

      case .timerTick:
        state.count += 1
        return .none

      case .toggleTimerButtonTapped:
        state.isTimerRunning.toggle()
        if state.isTimerRunning {
          return .run { send in
            while true {
              try await Task.sleep(nanoseconds: 1000000000)
              await send(.timerTick)
            }
          }
          .cancellable(id: CancelID.timer)
        } else {
          return .cancel(id: CancelID.timer)
        }
      }

    }
  }
}
