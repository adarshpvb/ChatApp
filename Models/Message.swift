//
//  Message.swift
//  Chat_App
//
//  Created by Adarsh Begur on 15/08/23.
//

import SwiftUI

struct Message: Identifiable,Codable {
    var id: String
    var text: String
    var received: Bool
    var timeStamp: Date
}

//struct Message_Previews: PreviewProvider {
//    static var previews: some View {
//        Message()
//    }
//}
