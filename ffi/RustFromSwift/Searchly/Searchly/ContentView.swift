import SwiftUI

struct ContentView: View {
  let a = (0 ... 8).map({ _ in Int.random(in: 0 ... 16) }).sorted()
  let x = Int.random(in: 0 ... 32)

  @State var i = -1
  var body: some View {
    VStack(alignment: .leading, content: {
      Text("a = \(self.a.description)")
        .monospaced()
        .padding(.vertical, 2)
      Text("x = \(self.x)")
        .monospaced()
        .padding(.vertical, 2)
      Text("i = \(self.i)")
        .monospaced()
        .padding(.vertical, 2)
    })
    .padding()
    Button("Search", action: self.search)
      .bold()
      .padding()
  }

  func search() {
    self.i = binary_search(
      self.a.withUnsafeBufferPointer({ $0.baseAddress }),
      self.a.count,
      self.x
    )
  }
}

#Preview {
  ContentView()
}
