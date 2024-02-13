import SwiftUI
import ComposableArchitecture
import App

@main
struct WeatherApp: App {
  let store = Store(initialState: AppFeature.State()) {
    AppFeature()
      ._printChanges()
  }
 
  var body: some Scene {
    WindowGroup {
      TabView {
        CounterView(store: store.scope(state: \.tab1, action: \.tab1))
          .tabItem {
            Text("Counter 1")
          }
        CounterView(store: store.scope(state: \.tab2, action: \.tab2))
          .tabItem {
            Text("Counter 2")
          }
      }
    }
  }
}
