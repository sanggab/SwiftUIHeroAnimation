//
//  LikeHistoryView.swift
//  SwiftUIHeroAnimation
//
//  Created by Gab on 2024/01/23.
//

import SwiftUI

public struct LikeHistoryView: View {
    
    
    public var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    Text("Likes you")
                        .foregroundColor(.black)
                        .font(.system(.headline))
                }
                .frame(height: 50, alignment: .center)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .background(.white)
                
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            Text("Up list")
                                .foregroundColor(.black)
                            
                            Text("99+")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .padding(.horizontal, 3)
                                .padding(.vertical, 5)
                                .background(.red)
                                .cornerRadius(10)
                        }
                        .frame(minHeight: 50, alignment: .center)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.blue)
                        .padding(.leading, 10)
                        
                        LazyHStack(spacing: 10) {
                            ForEach(0..<10) { index in
                                Rectangle()
                                    .fill(.blue)
                                    .frame(width: 100)
                                    .frame(height: 150)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal, 10)
                        
                    }
                    .frame(height: 250)
                    .frame(maxWidth: .infinity)
                    .background(.mint)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .frame(maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .padding(.all, 10)
                        .overlay {
                            VStack {
                                Image("imgLikeNoHistory")
                                    .fixedSize()
                                
                                Text("No Likes yet")
                                    .font(.system(.headline))
                                    .foregroundColor(.gray)
                            }
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.pink)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
    }
}

//struct LikeHistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        LikeHistoryView()
//    }
//}
