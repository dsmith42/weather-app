//
//  ContentView.swift
//  WeatherApp-SwiftUI
//
//  Created by Dan Smith on 07/11/2020.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
      
      VStack {
        CityTextView(cityName: "Cupertino, CA")
        
        WeatherView(imageName: "cloud.sun.fill", temperature: 76)
        
        HStack(spacing: 20) {
          WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
          WeatherDayView(dayOfWeek: "WED", imageName: "cloud.snow.fill", temperature: 73)
          WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 68)
          WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 80)
          WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.bolt.fill", temperature: 75)
        }
        Spacer()
        
        Button {
          print("tapped")
        } label: {
          WeatherButton(title: "Change Day Time",
                        textColor: .blue,
                        backgroundColor: .white)
        }
        
        Spacer()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct WeatherDayView: View {
  
  var dayOfWeek: String
  var imageName: String
  var temperature: Int
  var body: some View {
    
    VStack(spacing: 10) {
      Text(dayOfWeek)
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.white)
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
      Text("\(temperature)°")
        .font(.system(size: 24, weight: .medium))
        .foregroundColor(.white)
    }
  }
}

struct BackgroundView: View {
  
  var topColor: Color
  var bottomColor: Color
  
  var body: some View {
    LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
      .edgesIgnoringSafeArea(.all)
  }
}

struct CityTextView: View {
  
  var cityName: String
  
  var body: some View {
    Text(cityName)
      .foregroundColor(.white)
      .font(.system(size: 32, weight: .medium, design: .default))
      .padding()
  }
}

struct WeatherView: View {
  
  var imageName: String
  var temperature: Int
  
  var body: some View {
  VStack(spacing: 10) {
    Image(systemName: imageName)
      .renderingMode(.original)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
  
    Text("\(temperature)°")
      .font(.system(size: 70, weight: .medium))
      .foregroundColor(.white)
  }
  .padding(.bottom, 40)
  }
}
