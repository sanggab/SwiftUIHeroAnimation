//
//  HeroCardView.swift
//  SwiftUIHeroAnimation
//
//  Created by Gab on 2024/01/15.
//

import SwiftUI

public struct HeroCardView: View {
    @Binding public var isShowingDetail: Bool
    @Binding public var isAppeard: Bool
    public var imageString: String
    let animation: Namespace.ID
    
    @State private var offsetY: CGFloat = 0
    @State private var opacity: Double = 0.0
    @State private var text: String = "Add a Commnent"
    @State private var keyboardState: Bool = false
    @State private var keyboardHeight: CGFloat = 0
//    @State private var focusState: Bool = false
    @FocusState private var focusState: Bool
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
//            AsyncImage(url: URL(string: imageString)) { image in
//                image
//                    .resizable()
//                    .matchedGeometryEffect(id: AnimationID.imageID, in: animation, anchor: .top)
//                    .aspectRatio(contentMode: .fill)
//            } placeholder: {
//
//            }
//            .frame(width: 400, height: 400)
            Rectangle()
                .fill(.pink)
                .matchedGeometryEffect(id: AnimationID.imageID, in: animation, anchor: .top)
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .zIndex(2)
//                .offset(y: -30)
                .onTapGesture {
                    withAnimation(.hero) {
                        isShowingDetail = false
                    }
                }
                .padding(.top, 150)
                .padding(.horizontal, 10)
            
            VStack(spacing: 0) {
                
                Rectangle()
                    .fill(.white)
                    .padding(.horizontal, 20)
                    .frame(height: 100)
                
                
//                Text("Send like to NatashaRosi")
//                    .padding(.vertical, 10)
//                    .padding(.horizontal, 50)
//                    .background {
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(.yellow)
//                    }
//                    .padding(.top, 30)
                
            }
            .frame(height: 400, alignment: .bottom)
            .frame(maxWidth: .infinity, alignment: .leading)
            .zIndex(2)
            .background(.blue)
            
//            TextEditor(text: $text)
//                .frame(height: 100)
//                .frame(maxWidth: .infinity)
//                .matchedGeometryEffect(id: "TextEditor", in: animation)
//                .foregroundColor(.gray)
//                .offset(y: offsetY)
//                .transition(.scale(scale: 1))
//                .focused($focusState)
//                .zIndex(2)
//                .onChange(of: text) { newValue in
//                    print("text newvalue -> \(newValue)")
//                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.gray)
        .onAppear {
            withAnimation(.linear) {
                isAppeard = isShowingDetail
            }
            
            withAnimation(.linear) {
                offsetY = -80
                opacity = 1.0
            }
        }
        .onTapGesture {
            focusState = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { output in
            print("keyboardWillShowNotification")
            keyboardState = true
            
            if let userinfo = output.userInfo {
                if let size = userinfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    print("keyboard Size -> \(size)")
                    keyboardHeight = size.height
                    withAnimation(.linear) {
//                        offsetY = -keyboardHeight
                        offsetY = 0
                    }
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)) { output in
            print("keyboardDidHideNotification")
            keyboardState = false
            keyboardHeight = 0
        }
    }
}

struct HeroCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        HeroCardView(isShowingDetail: .constant(false), isAppeard: .constant(false), imageString: "https://photo.honeymatchs.com/dev_photo/profile/YUhxRHBZR0NkNHRVYkdaalozMS9lSUdEZXBCWGJtVmdwN2Ux?s=b", animation: Namespace().wrappedValue)
    }
}
