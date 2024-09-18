//
//  DataModel.swift
//  FirstSwiftUIApp
//
//  Created by Sambhav Singh on 16/09/24.
//

import Foundation

struct WeatherDay: Identifiable {
    let id = UUID()
    let dayOfWeek: String
    let imageName: String
    let temperature: Int
}
