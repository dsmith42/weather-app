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
      LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                     startPoint: .topLeading,
                     endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
      VStack {
        Text("Cupertino, CA")
          .foregroundColor(.white)
          .font(.system(size: 32, weight: .medium, design: .default))
          .padding()
        
        VStack(spacing: 10) {
          Image(systemName: "cloud.sun.fill")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
          Text("76°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
        }
        .padding(.bottom, 40)
        
        HStack(spacing: 20) {
          WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
          WeatherDayView(dayOfWeek: "WED", imageName: "cloud.snow.fill", temperature: 73)
          WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 68)
          WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 80)
          WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.bolt.fill", temperature: 75)
        }
        Spacer()
        
        Button(action: {}) {
          Text("Press me")
        }
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
