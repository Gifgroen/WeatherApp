import SwiftUI
import ComposableArchitecture
import App

@main
struct WeatherApp: App {
  static let store = Store(initialState: CounterFeature.State()) {
    CounterFeature()
      ._printChanges()
  }

  var body: some Scene {
    WindowGroup {
      ContentView(
        store: WeatherApp.store
      )
    }
  }
}
