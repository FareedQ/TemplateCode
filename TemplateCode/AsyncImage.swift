//
// From SwiftUI by Example by Paul Hudson
// https://www.hackingwithswift.com/quick-start/swiftui
//
// You're welcome to use this code for any purpose,
// commercial or otherwise, with or without attribution.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/paul.jpg"))
        { phase in switch phase {
        case.failure: Image(systemName: "photo").font(.largeTitle)
        case .success(let image): image.resizable()
            default: ProgressView() }
        }
        .frame(width: 256, height: 256)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
