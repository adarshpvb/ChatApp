import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastmessageId = ""
    
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            self.messages.sort{$0.timeStamp < $1.timeStamp}
            if let id = self.messages.last?.id {
                self.lastmessageId = id
            }
        }
    }
    func sentMessage(text:String){
        do{
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timeStamp: Date())
            try db.collection("messages").document().setData(from: newMessage)
        }catch{
            print("Error adding message to firestore: \(error)")
        }
        
    }
}
