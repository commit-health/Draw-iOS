import SwiftUI
import Alamofire
import Kingfisher

struct Developers: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var developers: [String] = [
        "김성원",
        "조병진",
        "김상구",
        "김은빈",
        "홍승재",
        "정승훈",
        "심미진"
    ]
    var stack: [String] = [
        "백엔드",
        "iOS",
        "디자인",
        "백엔드",
        "iOS",
        "Android",
        "웹 프론트엔드"
    ]
    var githubID: [String] = [
        "lilseongwon",
        "BJCHO0501",
        "MONOTYPEEE",
        "rlaisqls",
        "HongSJae",
        "Tmdhoon2",
        "azure-553"
    ]
    var Image_url_Arr: [String] = [
        "https://avatars.githubusercontent.com/u/102791105?v=4",
        "https://avatars.githubusercontent.com/u/80248855?v=4",
        "https://avatars.githubusercontent.com/u/76112135?v=4",
        "https://avatars.githubusercontent.com/u/81006587?v=4",
        "https://avatars.githubusercontent.com/u/102791216?v=4",
        "https://avatars.githubusercontent.com/u/102812085?v=4",
        "https://avatars.githubusercontent.com/u/80371353?v=4"
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ColorManager.BackgroundColor1.ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Image("CloseBtn")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.top, 16)
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        HStack {
                            Text("개발자들")
                                .foregroundColor(.black)
                                .font(.custom("Pretendard-Bold", size: 28))
                                .padding(.top, 40)
                            Spacer()
                        }
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(0..<developers.count, id: \.self) { i in
                                ZStack{
                                    VStack(spacing: 8) {
                                        HStack(spacing: 0) {
                                            KFImage.url(URL(string: Image_url_Arr[i]))
                                                .placeholder {
                                                    Circle().fill(Color.secondary)
                                                        .frame(width: 56, height: 56)
                                                }
                                                .resizable()
                                                .clipShape(Circle())
                                                .frame(width: 62, height: 62)
                                            Spacer()
                                            Text(developers[i])
                                                .foregroundColor(.black)
                                                .font(.custom("Pretendard-Bold", size: 24))
                                                .padding(.trailing, 8)
                                        }
                                        HStack {
                                            Text(stack[i])
                                                .foregroundColor(.black)
                                                .font(.custom("Pretendard-Medium", size: 16))
                                                .padding(.horizontal, 12)
                                                .padding(.vertical, 6)
                                                .background(Color(red: 0.905, green: 0.905, blue: 0.905))
                                                .cornerRadius(37)
                                                .padding(1)
                                                .background(Color("TabBarStroke"))
                                                .cornerRadius(37)
                                            Spacer()
                                        }
                                        
                                        Link(destination: URL(string: "https://github.com/" + githubID[i])!) {
                                            HStack(spacing: 0) {
                                                Image("LinkImage")
                                                    .resizable()
                                                    .frame(width: 12, height: 12)
                                                    .padding(4)
                                                Text("Github")
                                                    .foregroundColor(.black)
                                                    .font(.custom("Pretendard-Medium", size: 18))
                                                    .underline()
                                                Spacer()
                                            }
                                        }
                                    }
                                }
                                .padding(12)
                                .background(Color("TabBarFill"))
                                .cornerRadius(8)
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
        }
        .onAppear() {
            
        }
    }
}

struct Developers_Previews: PreviewProvider {
    static var previews: some View {
        Developers()
    }
}
