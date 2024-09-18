//
//  ButtonFile.swift
//  FirstSwiftUIApp
//
//  Created by Sambhav Singh on 16/09/24.
//

import SwiftUI


struct WeatherButtonView: View {
    var title:String
    var backgroundColor:Color
    var textColor:Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 55, alignment: .center)
            .background(backgroundColor.gradient)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)), style: FillStyle())
    }
}
