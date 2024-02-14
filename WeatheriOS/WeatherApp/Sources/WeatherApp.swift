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
      ContentView(store: store)
    }
  }
}
