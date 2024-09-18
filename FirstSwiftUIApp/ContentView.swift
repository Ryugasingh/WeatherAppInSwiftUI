//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Sambhav Singh on 15/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityName(cityName: "Aligarh, UP")
                MainDayView(imageName: isNight ? "cloud.moon.rain.fill" : "cloud.sun.fill", temperature: isNight ? 24 : 32)
                
                HStack(spacing:20){
                    ForEach(weatherData) { day in
                        WeatherDayView(daysOfWeeks: day.dayOfWeek, imageName: day.imageName, temperature: day.temperature)
                    }
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButtonView(title: "Change day time", backgroundColor: Color(.white), textColor: .blue)
                }
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var daysOfWeeks: String
    var imageName: String
    var temperature : Int
    var body: some View {
        VStack{
            Text(daysOfWeeks)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            
            
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
     @Binding var isNight:Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,isNight ? .gray : Color("LightBlue")]),
                       startPoint: .top,
                       endPoint: .bottom)
        .ignoresSafeArea()
    }
}

struct CityName: View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .font(.system(size: 38, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(10)
    }
}

struct MainDayView: View {
    var imageName:String
    var temperature:Int
    var body: some View {
        VStack(alignment:.center, spacing:2){
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom,50)
    }
}

