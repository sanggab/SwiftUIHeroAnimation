//
//  CardView.swift
//  SwiftUIHeroAnimation
//
//  Created by Gab on 2024/01/16.
//

import SwiftUI
import Kingfisher

public struct CardView: View {
    @Binding public var isShowingDetail: Bool
    @Binding public var isAppeard: Bool
    public var imageString: String
    
    let animation: Namespace.ID
    
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
//            .frame(width: 300, height: 300)
            
            
            KFImage(URL(string: imageString))
                .resizable()
                .matchedGeometryEffect(id: AnimationID.imageID, in: animation, anchor: .top)
                .frame(width: 50, height: 50)
                .padding(.leading, 10)
                .onTapGesture {
                    withAnimation(.linear) {
                        isShowingDetail = true
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.white)
        .onAppear {
            withAnimation(.linear) {
                isAppeard = isShowingDetail
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(isShowingDetail: .constant(false), isAppeard: .constant(false), imageString: "https://photo.honeymatchs.com/dev_photo/profile/YUhxRHBZR0NkNHRVYkdaalozMS9lSUdEZXBCWGJtVmdwN2Ux?s=b", animation: Namespace().wrappedValue)
    }
}

public extension Animation {
    static var hero: Animation {
        .interactiveSpring(response: 0.6, dampingFraction: 0.85, blendDuration: 0.25)
    }
}
