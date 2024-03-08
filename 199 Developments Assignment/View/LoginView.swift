//
//  LoginView.swift
//  199 Developments Assignment
//
//  Created by Aryan Sharma on 06/03/24.
//


import SwiftUI
import CoreData

struct LoginView: View {
  @Environment(\.managedObjectContext) var viewContext
  @State private var username: String = ""
  @State private var password: String = ""
  @State private var isShowingAlert = false
  @State private var alertMessage = ""
  @Binding var isLoggedIn: Bool

  var body: some View {
    NavigationView {
      VStack {
        TextField("Email", text: $username)
          .padding()
          .textFieldStyle(RoundedBorderTextFieldStyle())

        SecureField("Password", text: $password)
          .padding()
          .textFieldStyle(RoundedBorderTextFieldStyle())

        Button("Login") {
          guard let user = fetchUser(username: username, password: password) else {
            print("Login failed. User not found.")
            isShowingAlert = true
            alertMessage = "Invalid username or password."
            return
          }
          isLoggedIn = true
          print("Login successful")
        }
        .padding()

        NavigationLink(destination: SignupView()) {
          Text("Sign Up")
        }
      }
      .padding()
      .navigationTitle("Login")
      .alert(isPresented: $isShowingAlert) {
        Alert(title: Text("Login Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
      }
    }
  }

  private func fetchUser(username: String, password: String) -> NSManagedObject? {
    let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: "User")
    fetchRequest.predicate = NSPredicate(format: "username == %@ && password == %@", username, password)
    
    do {
      let users = try viewContext.fetch(fetchRequest)
      return users.first
    } catch {
      print("Error fetching user: \(error)")
      return nil
    }
  }
}


#Preview {
    LoginView(isLoggedIn: .constant(false))
        .environmentObject(NotesManager())
}


