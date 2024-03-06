//
//  LoginView.swift
//  199 Developments Assignment
//
//  Created by Aryan Sharma on 06/03/24.
//


import SwiftUI


struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    private let usernameKey = "userUsername"
    private let passwordKey = "userPassword"

    @EnvironmentObject var notesManager: NotesManager
    @Binding var isLoggedIn: Bool

    var body: some View {
        NavigationView {
            VStack {
                TextField("Mobile/Email", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Login") {
                    // Retrieve user information from UserDefaults
                    let storedUsername = UserDefaults.standard.string(forKey: usernameKey) ?? ""
                    let storedPassword = UserDefaults.standard.string(forKey: passwordKey) ?? ""

                    // Check if the entered credentials match the stored ones
                    if username == storedUsername && password == storedPassword {
                        // Add login success logic here
                        print("Login successful")
                        isLoggedIn = true
                    } else {
                        // Add login failure logic here
                        print("Login failed")
                    }
                }
                .padding()

                NavigationLink(destination: SignupView()) {
                    Text("Sign Up")
                }
            }
            .padding()
            .navigationTitle("Login")
        }
    }
}



#Preview {
    LoginView(isLoggedIn: .constant(false))
        .environmentObject(NotesManager())
}


