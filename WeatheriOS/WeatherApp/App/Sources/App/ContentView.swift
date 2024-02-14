import SwiftUI
import ComposableArchitecture
import Contacts
import Counter
import WeatherForecast

public struct ContentView: View {

  let store: StoreOf<AppFeature>

  public init(store: StoreOf<AppFeature>) {
    self.store = store
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

      ContactsView()
        .tabItem {
          Image(systemName: "viewfinder")
          Text("Contacts")
        }
    }
  }
}
