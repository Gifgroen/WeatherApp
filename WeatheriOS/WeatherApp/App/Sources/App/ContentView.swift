import SwiftUI
import ComposableArchitecture
import Contacts
import Counter
import WeatherForecast

public struct ContentView: View {

  let store: StoreOf<AppFeature>
  let contactsStore: StoreOf<ContactsFeature>

  public init(
    store: StoreOf<AppFeature>,
    contactsStore: StoreOf<ContactsFeature>
  ) {
    self.store = store
    self.contactsStore = contactsStore
  }

  public var body: some View {
    TabView {
      WeatherView()
        .tabItem {
          Image(systemName: "viewfinder")
          Text("Weather")
        }

      CounterView(store: store.scope(state: \.tab1, action: \.tab1))
        .tabItem {
          Image(systemName: "viewfinder")
          Text("Counter 1")
        }

      ContactsView(store: contactsStore)
        .tabItem {
          Image(systemName: "viewfinder")
          Text("Contacts")
        }
    }
  }
}
