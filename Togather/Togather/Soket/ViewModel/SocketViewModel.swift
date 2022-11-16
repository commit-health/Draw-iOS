import Foundation
import SocketIO
import Moya

final class SocketViewModel: ObservableObject {
    private var manager = SocketManager(
        socketURL: URL(string: "http://52.55.240.35:8081")!,
        config: [.log(true),
        .compress,
//        .extraHeaders(Header.socket.header()!),
//        .version(.two),
        .reconnects(false)
//        .forceWebsockets(false)
        ]
    )
    var socket: SocketIOClient!
    @Published var message = [String]()
    init() {
        socket = self.manager.socket(forNamespace: "/socket.io")
        socket.on(clientEvent: .connect) { (data, ack) in
            print("서버에 연결되었습니다. \(data), \(ack)")
        }
        socket.connect()
    }
    func socketCounnect() {
        socket.connect()
    }
    func socketDisconnect() {
        socket.disconnect()
    }
    func onError() {
        socket.on("error") { (dataArrya, ack) in
            print("에러 타입: \(type(of: dataArrya))")
            print("에러: \(dataArrya), \(ack)")
//            let data = dataArrya[0] as! NSDictionary
//            print(data["code"] as! String)
        }
    }
    func onChat() {
        socket.on("chat") { (dataArrya, ack) in
            print("chat 타입: \(type(of: dataArrya))")
            print("chat: \(dataArrya), \(ack)")
//            let data = dataArrya[0] as! NSDictionary
//            print(data["code"] as! String)
        }
    }
    func onRoom() {
        socket.emit("join", ["is_join_room": true, "room_id": 1])
    }

}
