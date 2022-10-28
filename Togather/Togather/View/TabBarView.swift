
import SwiftUI

enum TabIndex {
    case home, chat, write, mypage, search
}

struct TabBarView: View {
    @State var tabIndex = TabIndex.home
    @State var showModal = false
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                Spacer()
                ZStack(alignment: .bottom) {
                    TabView(selection: $tabIndex) {
                        HomeView()
                            .tag(TabIndex.home)
                        ChatListView()
                            .tag(TabIndex.chat)
                        SearchView()
                            .tag(TabIndex.search)
                        MyView()
                            .tag(TabIndex.mypage)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    ZStack {
                        VStack(spacing: 0) {
                            Rectangle()
                                .foregroundColor(Color("TabBarStroke"))
                                .frame(width: proxy.size.width, height: 1)
                            Rectangle()
                                .foregroundColor(Color("TabBarFill"))
                                .frame(width: proxy.size.width, height: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 86 : 106)
                        }
                        HStack(alignment: .top, spacing: 0) {
                            Button {
                                tabIndex = .home
                            } label: {
                                VStack {
                                    Image(tabIndex == .home ? "HomeOn" : "HomeOff")
                                        .font(.system(size: 25))
                                        .foregroundColor(tabIndex == .home ? Color("TabBarSelectedColor") : Color("TabBarNoSelectedColor"))
                                        .frame(width: 28, height: 28)
                                    Text("홈")
                                        .font(.custom("Pretendard-Bold", size: 14))
                                        .foregroundColor(tabIndex == .home ? Color("TabBarSelectedColor") : Color("TabBarNoSelectedColor"))
                                    Spacer()
                                }
                                .frame(width: proxy.size.width/6, height: 50)
                            }
                            .buttonStyle(.plain)
                            Button {
                                tabIndex = .chat
                            } label: {
                                VStack {
                                    Image(tabIndex == .chat ? "ChatOn" : "ChatOff")
                                        .font(.system(size: 25))
                                        .foregroundColor(tabIndex == .chat ? Color("TabBarSelectedColor") : Color("TabBarNoSelectedColor"))
                                        .frame(width: 28, height: 28)
                                    Text("채팅")
                                        .font(.custom("Pretendard-Bold", size: 14))
                                        .foregroundColor(tabIndex == .chat ? Color("TabBarSelectedColor") : Color("TabBarNoSelectedColor"))
                                    Spacer()
                                }
                                .frame(width: proxy.size.width/6, height: 50)
                            }
                            .buttonStyle(.plain)
                            Button {
                                self.showModal.toggle()
                            } label: {
                                VStack {
                                    Image(tabIndex == .write ? "WritingOn" : "WritingOff")
                                        .font(.system(size: 25))
                                        .foregroundColor(tabIndex == .write ? Color("TabBarSelectedColor") : Color("TabBarNoSelectedColor"))
                                        .frame(width: 28, height: 28)
                                    Text("글쓰기")
                                        .font(.custom("Pretendard-Bold", size: 14))
                                        .foregroundColor(tabIndex == .write ? Color("TabBarSelectedColor") : Color("TabBarNoSelectedColor"))
                                    Spacer()
                                }
                                .frame(width: proxy.size.width/6, height: 50)
                            }
                            .buttonStyle(.plain)
                            .sheet(isPresented: self.$showModal) {
                                WritingView(showModal: self.$showModal)
                            }
                            .buttonStyle(.plain)
                            Button {
                                tabIndex = .search
                            } label: {
                                VStack {
                                    Image(tabIndex == .search ? "SearchOn" : "SearchOff")
                                        .font(.system(size: 25))
                                        .foregroundColor(tabIndex == .search ? Color("TabBarSelectedColor") : Color("TabBarNoSelectedColor"))
                                        .frame(width: 28, height: 28)
                                    Text("검색")
                                        .font(.custom("Pretendard-Bold", size: 14))
                                        .foregroundColor(tabIndex == .search ? Color("TabBarSelectedColor") : Color("TabBarNoSelectedColor"))
                                    Spacer()
                                }
                                .frame(width: proxy.size.width/6, height: 50)
                            }
                            .buttonStyle(.plain)
                            Button {
                                tabIndex = .mypage
                            } label: {
                                VStack {
                                    Image(tabIndex == .mypage ? "MyOn" : "MyOff")
                                        .font(.system(size: 25))
                                        .foregroundColor(tabIndex == .mypage ? Color("TabBarSelectedColor") : Color("TabBarNoSelectedColor"))
                                        .frame(width: 28, height: 28)
                                    Text("나")
                                        .font(.custom("Pretendard-Bold", size: 14))
                                        .foregroundColor(tabIndex == .mypage ? Color("TabBarSelectedColor") : Color("TabBarNoSelectedColor"))
                                    Spacer()
                                }
                                .frame(width: proxy.size.width/6, height: 50)
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 5 : 25)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
