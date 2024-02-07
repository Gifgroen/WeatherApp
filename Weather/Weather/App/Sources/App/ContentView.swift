import SwiftUI
import ComposableArchitecture

public struct ContentView: View {

  let store: StoreOf<CounterFeature>

  public init(store: StoreOf<CounterFeature>) {
    self.store = store
  }

  public var body: some View {
    VStack {
      Image(systemName: "sun.min")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, Weather!")

      WithPerceptionTracking {
        Text("\(store.count)")
          .frame(width: 92, height: 44)
          .background(Color.green)
          .foregroundColor(Color.white)
        HStack {
          Button("+") {
            store.send(.incrementButtonTapped)
          }
          .frame(width: 44, height: 44)
          .background(Color.gray)
          Button("-") {
            store.send(.decrementButtonTapped)
          }
          .frame(width: 44, height: 44)
          .background(Color.gray)
        }
      }
    }
    .padding()
  }
}

#Preview {
  ContentView(
    store: Store(initialState: CounterFeature.State()) {
      CounterFeature()
    }
  )
}
