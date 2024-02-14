import Foundation
import ComposableArchitecture

@Reducer
public struct AddContactFeature {
  @ObservableState
  public struct State: Equatable {
    var contact: Contact
  }

  public enum Action {
    case cancelButtonTapped
    case delegate(Delegate)
    case saveButtonTapped
    case setName(String)

    public enum Delegate: Equatable {
      case saveContact(Contact)
    }
  }

  @Dependency(\.dismiss) var dismiss

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {

      case .cancelButtonTapped:
        return .run { _ in await self.dismiss() }

      case .delegate:
        return .none

      case .saveButtonTapped:
        return .run { [contact = state.contact] send in
          await send(.delegate(.saveContact(contact)))
          await self.dismiss()
        }

      case .setName(let name):
        state.contact.name = name
        return .none
      }
    }
  }
}
