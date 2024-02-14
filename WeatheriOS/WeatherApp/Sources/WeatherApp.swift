import SwiftUI
import ComposableArchitecture
import App
import Contacts

@main
struct WeatherApp: App {
  let store = StoreOf<AppFeature>(initialState: AppFeature.State()) {
    AppFeature()
      ._printChanges()
  }
  let contactsStore = Store(initialState: ContactsFeature.State()) {
    ContactsFeature()
      ._printChanges()
  }

  var body: some Scene {
    WindowGroup {
      ContentView(
        store: store,
        contactsStore: contactsStore
      )
    }
  }
}
