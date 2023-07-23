//
//  LoginView.swift
//  TodoApp
//
//  Created by Greg on 2023-07-22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            // Header
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color.blue)
                VStack {
                    Text("To Do List")
                        .foregroundColor(Color.white)
                        .bold()
                    Text("Take It Easy...")
                        .foregroundColor(Color.white)
                }
            }
            .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
