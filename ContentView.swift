//
//  ContentView.swift
//  Chat_App
//
//  Created by Adarsh Begur on 14/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
//    var messageArray = ["Hello!","How are you doing?","Hello Abhiram MG!"]
    var body: some View {
        VStack {
            VStack {
                TitleRow()
            
                ScrollViewReader {proxy in
                    ScrollView{
                        ForEach(messagesManager.messages, id: \.id) {message in
                            MessageBubble(message: message)
                        }
                        
                    }
                    .padding(.top,10)
                    .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .onChange(of: messagesManager.lastmessageId) { id in
                    withAnimation{
                        proxy.scrollTo(id,anchor: .bottom)
                        
                    }
                    
                }
                }
            }
            
            .background(Color("Peach"))
            
            MessageField()
                .environmentObject(messagesManager)
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
