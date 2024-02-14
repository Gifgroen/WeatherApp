import SwiftUI
import ComposableArchitecture

struct AddContactView: View {
  @Perception.Bindable var store: StoreOf<AddContactFeature>

  var body: some View {
    WithPerceptionTracking {
      Form {
        TextField("Name", text: $store.contact.name.sending(\.setName))
        Button("Save") {
          store.send(.saveButtonTapped)
        }
      }
      .toolbar {
        ToolbarItem {
          Button("Cancel") {
            store.send(.cancelButtonTapped)
          }
        }
      }
    }
  }
}

#Preview {
  NavigationView {
    AddContactView(
      store: Store(
        initialState: AddContactFeature.State(
          contact: Contact(
            id: UUID(), name: "Blob"
          )
        ),
        reducer: { AddContactFeature() }
      )
    )
  }
}
