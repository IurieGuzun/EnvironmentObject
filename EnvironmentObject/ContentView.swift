//
//  ContentView.swift
//  EnvironmentObject
//
//  Created by Iurie Guzun on 2021-01-07.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var score = 0
}

struct ContentView: View {
    @EnvironmentObject var settings: UserSettings
        var body: some View {
            NavigationView {
                VStack {
                    Text("Score: \(settings.score)")
                    // A button that writes to the environment settings
                    Button(action: {
                        self.settings.score += 1
                    }) {
                        Text("Increase Score")
                    }

                    NavigationLink(destination: DetailView()) {
                        Text("Show Detail View")
                    }
                }
            }
        }
    }

    struct DetailView: View {
        @EnvironmentObject var settings: UserSettings

        var body: some View {
            // A text view that reads from the environment settings
            VStack{
            Text("Score: \(settings.score)")
            Button(action: {
                self.settings.score += 1
            }) {
                Text("Increase Score")
            }
            }}
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
