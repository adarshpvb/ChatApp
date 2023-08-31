//
//  Chat_AppApp.swift
//  Chat_App
//
//  Created by Adarsh Begur on 14/08/23.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct Chat_AppApp: App {
    
    init(){
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
