import Foundation
import SwiftUI
import ComposableArchitecture

public struct ContactsView: View {

  @Perception.Bindable var store: StoreOf<ContactsFeature>

  public init(store: StoreOf<ContactsFeature>) {
    self.store = store
  }

  public var body: some View {
    WithPerceptionTracking {
      NavigationView {
        List {
          ForEach(store.contacts) { contact in
            Text(contact.name)
          }
        }
        .navigationTitle("Contacts")
        .toolbar {
          ToolbarItem {
            Button {
              store.send(.addButtonTapped)
            } label: {
              Image(systemName: "plus")
            }
          }
        }
        .sheet(
          item: $store.scope(
            state: \.addContact,
            action: \.addContact
          )
        ) { addContactStore in
          NavigationView {
            AddContactView(store: addContactStore)
          }
          .navigationViewStyle(.stack)
        }
      }
      .navigationViewStyle(.stack)
    }
  }
}

#Preview {
  ContactsView(
    store: Store(
      initialState: ContactsFeature.State(
        contacts: [
          Contact(id: UUID(), name: "Blob"),
          Contact(id: UUID(), name: "Blob Jr"),
          Contact(id: UUID(), name: "Blob Sr"),
        ]
      ),
      reducer: { ContactsFeature() }
    )
  )
}
