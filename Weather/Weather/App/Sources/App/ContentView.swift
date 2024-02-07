import SwiftUI

public struct ContentView: View {

  public init() {
    /* NOOP */
  }

  public var body: some View {
    VStack {
      Image(systemName: "sun.min")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, Weather!")
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
