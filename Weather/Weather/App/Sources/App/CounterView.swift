import SwiftUI
import ComposableArchitecture

public struct CounterView: View {

  let store: StoreOf<CounterFeature>

  public init(store: StoreOf<CounterFeature>) {
    self.store = store
  }

  public var body: some View {
    VStack {
      Image(systemName: "sun.min")
        .resizable()
        .frame(width: 88, height: 88)
        .imageScale(.large)
        .foregroundStyle(.blue)
        .padding(32)
        .background(Color.indigo.opacity(0.4))
        .cornerRadius(24)

      Text("Hello, Weather!")
        .font(.largeTitle)
      
      WithPerceptionTracking {
        Text("\(store.count)")
          .font(.title)
          .padding()
          .background(Color.green)
          .foregroundColor(Color.white)
        HStack {
          Button("-") {
            store.send(.decrementButtonTapped)
          }
          .font(.largeTitle)
          .padding()
          .background(Color.gray)

          Button("+") {
            store.send(.incrementButtonTapped)
          }
          .font(.largeTitle)
          .padding()
          .background(Color.gray)
        }
        Button("Fact") {
          store.send(.factButtonTapped)
        }
        .font(.title)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
 
        Button(store.isTimerRunning ? "Stop timer" : "Start timer") {
          store.send(.toggleTimerButtonTapped)
        }
        .font(.title)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
 
        if let fact = store.fact?.facts.first {
          Text(fact)
            .font(.title)
            .multilineTextAlignment(.center)
            .padding()
        }
      }
    }
    .padding()
  }
}

#Preview {
  CounterView(
    store: Store(initialState: CounterFeature.State()) {
      CounterFeature()
    }
  )
}
