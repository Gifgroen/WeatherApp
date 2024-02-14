import Foundation
import SwiftUI

public struct WeatherView: View {

  public init() { /* NOOP */ }

  public var body: some View {
    VStack {
      Image(systemName: "sun.min")
        .resizable()
        .frame(width: 88, height: 88)
        .imageScale(.large)
        .foregroundStyle(.blue)
        .padding(32)
        .background(Color.indigo.opacity(0.4))
        .cornerRadius(24)

      Text("Hello, Weather!")
        .font(.largeTitle)
    }
  }
}

#Preview {
  WeatherView()
}
