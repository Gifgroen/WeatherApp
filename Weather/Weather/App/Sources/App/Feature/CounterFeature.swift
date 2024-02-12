import Foundation
import ComposableArchitecture

@Reducer
public struct CounterFeature {

  public init() { /* NOOP */ }

  @ObservableState
  public struct State {
    var count = 0
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
          let (data, _) = try await URLSession.shared
            .data(from: URL(string: "https://dog-api.kinduff.com/api/facts?number=\(count)")!)
          let facts = try JSONDecoder().decode(FactResponse.self, from: data)
          await send(.factResponse(facts))
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
