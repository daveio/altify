import SwiftUI

struct APIKeyView: View {
    @State private var apiKey: String = ""
    @State private var savedMessage: String = ""
    @State private var fetchedAPIKey: String = ""
    @State private var showError: Bool = false

    var body: some View {
        ZStack {
            Color(Color.monokaiBackground)

            VStack {
                TextField("Enter API Key", text: $apiKey)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding()

                if showError {
                    Text("API key cannot be empty")
                        .foregroundColor(Color.monokaiRed)
                        .padding(.horizontal)
                }

                Button(action: saveAPIKey) {
                    Text("Save API Key")
                        .foregroundColor(Color.monokaiForeground)
                        .padding()
                        .background(Color.monokaiGreen)
                        .cornerRadius(8)
                }
                .padding()

                Text(savedMessage)
                    .padding()
                    .foregroundColor(Color.monokaiForeground)

                Button(action: fetchAPIKey) {
                    Text("Fetch API Key")
                        .foregroundColor(Color.monokaiForeground)
                        .padding()
                        .background(Color.monokaiBlue)
                        .cornerRadius(8)
                }
                .padding()

                Text("Fetched API Key: \(fetchedAPIKey)")
                    .padding()
                    .foregroundColor(Color.monokaiForeground)
            }
            .padding()
        }
        .onAppear(perform: fetchAPIKey)
    }

    private func saveAPIKey() {
        if apiKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            showError = true
            savedMessage = ""
            return
        }
        
        showError = false
        KeychainHelper.shared.save(key: "apiKey", value: apiKey)
        savedMessage = "API key saved successfully!"
    }

    private func fetchAPIKey() {
        if let key = KeychainHelper.shared.fetch(key: "apiKey") {
            fetchedAPIKey = key
        } else {
            fetchedAPIKey = "API key not found"
        }
    }
}

#Preview {
    APIKeyView()
        .preferredColorScheme(.dark)
}
