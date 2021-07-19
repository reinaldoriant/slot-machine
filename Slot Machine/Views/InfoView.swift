//
//  InfoView.swift
//  Slot Machine
//
//  Created by TI Digital on 19/07/21.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0){
            LogoView()
            
            Spacer()
            
            Form{
                Section(header: Text("About the application")){
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platform", secondItem: "iPhone, iPad, Mac")
                    FormRowView(firstItem: "Developer", secondItem: "Reinaldo Riant")
                    FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
                    FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
                    FormRowView(firstItem: "Website", secondItem: "kompas.id")
                    FormRowView(firstItem: "Copyright", secondItem: "© 2021 All rights reserved.")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(Button(action: {
            
        }) {
            Image(systemName: "xmark.circle")
                .font(.title)
        }
        .padding(.top,30)
        .padding(.trailing,20)
        .accentColor(Color.secondary), alignment: .topTrailing
        )
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    var body: some View {
        HStack{
            Text(firstItem)
                .foregroundColor(Color.gray)
            Spacer()
            Text(secondItem)
        }
    }
}
