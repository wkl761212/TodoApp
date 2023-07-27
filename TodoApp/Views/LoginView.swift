//
//  LoginView.swift
//  TodoApp
//
//  Created by Greg on 2023-07-22.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, background: .blue)
                
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Aderess", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .teal) {
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                        
                // Create Account
                VStack {
                    Text("New Here?")
                    
                    NavigationLink("Create Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                        
                Spacer()
                        
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
