//
//  LikeSendView.swift
//  SwiftUIHeroAnimation
//
//  Created by Gab on 2024/01/19.
//

import SwiftUI
import Kingfisher

public struct LikeSendView<ContentView: View>: View {
    
    @Binding var isShowing: Bool
    public var content: () -> ContentView
    
    public init(isShowing: Binding<Bool>,
                @ViewBuilder content: @escaping () -> ContentView) {
        self._isShowing = isShowing
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

//struct LikeSendView_Previews: PreviewProvider {
//    static var previews: some View {
//        LikeSendView()
//    }
//}
