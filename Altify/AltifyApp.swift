//
//  AltifyApp.swift
//  Altify
//
//  Created by Dave Williams on 26/03/2025.
//

import SwiftUI
import SwiftData


extension Color {
    static let monokaiBackground = Color(red: 15/255, green: 16/255, blue: 10/255)
    static let monokaiForeground = Color(red: 220/255, green: 220/255, blue: 215/255)
    static let monokaiGreen = Color(red: 83/255, green: 113/255, blue: 23/255)
    static let monokaiBlue = Color(red: 51/255, green: 108/255, blue: 119/255)
    static let monokaiPurple = Color(red: 87/255, green: 64/255, blue: 127/255)
    static let monokaiOrange = Color(red: 126/255, green: 75/255, blue: 15/255)
    static let monokaiRed = Color(red: 124/255, green: 19/255, blue: 57/255)
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.monokaiBackground)
            .foregroundColor(Color.monokaiForeground)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.monokaiForeground, lineWidth: 1)
            )
    }
}

@main
struct AltifyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            APIKeyView()
                .preferredColorScheme(.dark)
        }
        .modelContainer(sharedModelContainer)
    }
}
