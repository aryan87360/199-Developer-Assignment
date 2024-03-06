//
//  SignupView.swift
//  199 Developments Assignment
//
//  Created by Aryan Sharma on 06/03/24.
//


import CoreData
import SwiftUI

struct SignupView: View {
    @State private var name: String = ""
    @State private var mobile: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var savePassword: Bool = false

    private let nameKey = "userName"
    private let mobileKey = "userMobile"
    private let emailKey = "userEmail"
    private let passwordKey = "userPassword"
    private let savePasswordKey = "saveUserPassword"

    @State private var isShowingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Mobile", text: $mobile)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: mobile, perform: { newValue in
                    validateMobile()
                })

            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: email, perform: { newValue in
                    validateEmail()
                })

            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: password, perform: { newValue in
                    validatePassword()
                })

            Toggle("Save Password", isOn: $savePassword)
                .padding()

            Button("Signup") {
                // Perform additional validations before saving
                if validateMobile() && validateEmail() && validatePassword() {
                    // Save user information to UserDefaults
                    UserDefaults.standard.set(name, forKey: nameKey)
                    UserDefaults.standard.set(mobile, forKey: mobileKey)
                    UserDefaults.standard.set(email, forKey: emailKey)
                    UserDefaults.standard.set(password, forKey: passwordKey)
                    UserDefaults.standard.set(savePassword, forKey: savePasswordKey)
                } else {
                    isShowingAlert = true
                }
            }
            .padding()
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Validation Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
    }

    private func validateMobile() -> Bool {
        let mobileRegex = "^\\d{10}$"
        if NSPredicate(format: "SELF MATCHES %@", mobileRegex).evaluate(with: mobile) {
            return true
        } else {
            alertMessage = "Invalid mobile number. Please enter a valid 10-digit Indian mobile number."
            return false
        }
    }


    private func validateEmail() -> Bool {
        let emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$"
        if NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email) {
            return true
        } else {
            alertMessage = "Invalid email address. Please enter a valid email."
            return false
        }
    }


    private func validatePassword() -> Bool {
        let nameLowercased = name.lowercased()
        let nameContainedInPassword = password.lowercased().contains(nameLowercased)
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z]{2,})(?=.*\\d{2,})(?=.*[^A-Za-z\\d]{1,}).{8,15}$"
        
        if password.count >= 8, password.count <= 15, !nameContainedInPassword, NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password) {
            return true
        } else {
            alertMessage = "Invalid password. Please follow the password criteria."
            return false
        }
    }
}



#Preview {
    SignupView()
}
