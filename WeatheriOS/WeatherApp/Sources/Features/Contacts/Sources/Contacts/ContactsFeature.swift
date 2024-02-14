import Foundation
import ComposableArchitecture

@Reducer
public struct ContactsFeature {
  public init() { /* NOOP */ }

  @ObservableState
  public struct State: Equatable {
    @Presents var addContact: AddContactFeature.State?
    var contacts: IdentifiedArrayOf<Contact>

    public init(contacts: IdentifiedArrayOf<Contact> = []) {
      self.contacts = contacts
    }
  }

  public enum Action {
    case addButtonTapped
    case addContact(PresentationAction<AddContactFeature.Action>)
  }

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .addButtonTapped:
        state.addContact = AddContactFeature.State(
          contact: Contact(id: UUID(), name: "")
        )
        return .none

      case .addContact(.presented(.delegate(.saveContact(let contact)))):
        state.contacts.append(contact)
        state.addContact = nil
        return .none

      case .addContact:
        return .none
      }
    }
    .ifLet(\.$addContact, action: \.addContact) {
      AddContactFeature()
    }
  }
}
