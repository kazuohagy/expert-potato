//
//  ContentView.swift
//  butWhy
//
//  Created by Kazuo on 12/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! nao toma banho")
            Text("Lucca é firmeza")
            Button("Clique") {
                print("clicou")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
