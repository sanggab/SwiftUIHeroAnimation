//
//  ContentView.swift
//  SwiftUIHeroAnimation
//
//  Created by Gab on 2024/01/12.
//

import SwiftUI

public class AnimationID {
    static let imageID = "image"
}

public struct ContentView: View {
    private var imageString: String = "https://upload3.inven.co.kr/upload/2023/06/23/bbs/i16526700580.jpg"
    @State private var isShowingDetail: Bool = false
    @State private var isAppeared = false
    @State private var isAnimating = false
    @Namespace var animation
    
    public var body: some View {
        ZStack {
            VStack {

                Rectangle()
                    .fill(.pink)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)

                if isShowingDetail {
//                    HeroCardView(isShowingDetail: $isShowingDetail,
//                                 isAppeard: $isAppeared,
//                                 imageString: imageString,
//                                 animation: animation)
//                    .transition(.scale(scale: 1))
//                    .disabled(isAnimating)
                    TestHeroCardView(isShowingDetail: $isShowingDetail,
                                 isAppeard: $isAppeared,
                                 imageString: imageString,
                                 animation: animation)
//                    .transition(.scale(scale: 1))
                    .disabled(isAnimating)
                } else {
                    CardView(isShowingDetail: $isShowingDetail,
                             isAppeard: $isAppeared,
                             imageString: imageString,
                             animation: animation)
//                    .transition(.scale(scale: 1))
                    .disabled(isAnimating)
                }
            }
            .ignoresSafeArea(.keyboard, edges: .all)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .onChange(of: isShowingDetail) { newValue in
            checkAnimation(newValue: newValue)
        }
        .background(.green)
    }
    
    private func checkAnimation(newValue: Bool) {
        print("newValue -> \(newValue)")
        
        if newValue {
                   // Disable user interaction while animation
                   isAnimating = true
                   DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                       isAnimating = false
                   }
               } else {
                   // Disable user interaction while animation
                   isAnimating = true
                   DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                       isAnimating = false
                   }
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
