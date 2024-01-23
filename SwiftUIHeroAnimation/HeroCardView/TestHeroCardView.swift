//
//  TestHeroCardView.swift
//  SwiftUIHeroAnimation
//
//  Created by Gab on 2024/01/18.
//

import SwiftUI
import Kingfisher

public struct TestHeroCardView: View {
    @Binding public var isShowingDetail: Bool
    @Binding public var isAppeard: Bool
    public var imageString: String
    let animation: Namespace.ID
    
    @State private var offsetY: CGFloat = 450
    @State private var opacity: Double = 0.0
    @State private var text: String = "Add a Commnent"
    @State private var keyboardState: Bool = false
    @State private var keyboardHeight: CGFloat = 0
    @State private var buttonPoint: CGPoint = .init(x: 80, y: -80)
    @FocusState private var focusState: Bool
    @State private var testOffsetY: CGFloat = 0
    
    public var body: some View {
        GeometryReader { proxy in
            let _ = print("proxy size -> \(proxy.size)")
            
            if keyboardState {
                Color.gray
                    .zIndex(3)
                    .onTapGesture {
                        focusState = false
                    }
                    .opacity(0.5)
            }
            
            KFImage(URL(string: imageString))
                .resizable()
                .matchedGeometryEffect(id: AnimationID.imageID, in: animation, anchor: .top)
                .frame(height: 300, alignment: .top)
                .frame(maxWidth: .infinity, alignment: .center)
                .zIndex(2)
                .padding(.horizontal, 10)
                .padding(.top, 150)
                .onTapGesture {
                    withAnimation(.linear) {
                        isShowingDetail = false
                    }
                }
            
            VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    TextEditor(text: $text)
                        .padding(.all, 10)
                        .foregroundColor(.gray)
                        .focused($focusState)
                        .onChange(of: text) { newValue in
                            print("text newvalue -> \(newValue)")
                        }
                    
                    if keyboardState {
                        Rectangle()
                            .fill(.red)
                            .frame(width: 40, height: 40)
                            .transition(AnyTransition.opacity.animation(.easeInOut))
                            .matchedGeometryEffect(id: "Button", in: animation)
                            .padding(.top, 10)
                            .padding(.trailing, 10)
                            .opacity(keyboardState ? 1.0 : 0.0)
                    }
                }
                .matchedGeometryEffect(id: "HStack", in: animation)
                .frame(height: 100)
                .frame(maxWidth: keyboardState ? .infinity : proxy.size.width - 40)
                .background(.white)
                .cornerRadius(keyboardState ? 0 : 10)
                .offset(y: testOffsetY)
                
                Text("Send like to NatashaRosi")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 50)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.yellow)
                    }
                    .padding(.top, 30)
                
                Button("Cancel") {
                    print("닫어닫어")
                    withAnimation(.linear) {
                        isShowingDetail = false
                    }
                }
                .background(.pink)
                .padding(.top, 30)
            }
            .frame(height: 250, alignment: .top)
            .frame(maxWidth: .infinity)
            .offset(y: offsetY)
            .zIndex(keyboardState ? 4 : 2)
                
        }
        .onAppear {
            withAnimation(.linear) {
                offsetY = 400
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification).filter({ _ in !keyboardState})) { output in
            print("keyboardWillShowNotification")
            
            if let userinfo = output.userInfo {
                if let size = userinfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    print("keyboard Size -> \(size)")
                    guard let duration = userinfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
                        return
                    }
                    
                    print("duration -> \(duration)")
                    
                    keyboardHeight = size.height
                    
                    withAnimation(.linear) {
                        keyboardState = true
                    }
                    
                    withAnimation(.easeOut(duration: duration)) {
                        testOffsetY = -56
                    }
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { output in
            print("keyboardDidHideNotification")
            if let userinfo = output.userInfo {
                if let size = userinfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    print("keyboard Size -> \(size)")
                    guard let duration = userinfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
                        return
                    }
                    
                    print("duration -> \(duration)")
                    
                    keyboardHeight = 0
                    
                    withAnimation(.linear) {
                        keyboardState = false
                    }
                    
                    withAnimation(.easeOut(duration: duration + 0.05)) {
                        testOffsetY = 0
                    }
                }
            }
        }
        .background(.gray)
    }
}

//struct TestHeroCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestHeroCardView()
//    }
//}
