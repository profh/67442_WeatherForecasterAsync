//
//  Forecast.swift
//  WeatherForecaster
//
//  Created by Larry Heimann on 11/7/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import Foundation

class Forecast {
  
  var temp: Float?
  var city: String?
  var icon: NSURL?
  var status: Bool = false
  
  init() {
    DataManager.getForecastDataFromAPIWithSuccess { (weatherData) -> Void in
      println("Test : \(self.city)")
      let json = JSON(data: weatherData)
      let cityName = String(stringInterpolationSegment: json["name"])
      let iconImg = String(stringInterpolationSegment: json["weather"][0]["icon"])
      let cityTemp = json["main"]["temp"].floatValue
      
      self.city = cityName as String
      self.temp = cityTemp as Float
      self.icon = NSURL(fileURLWithPath: "http://openweathermap.org/img/w/\(iconImg).png")!
      self.status = true
      
      println("City : \(self.city!)")
      println("Temp : \(self.temp!)")
      println("Icon : \(self.icon!)")
      
    }
    
    println("City2: \(self.city)")
    
  }
  
  func convertFromKelvinToFahrenheit() -> Int {
    var fahrenheit = 9/5 * (self.temp! - 273) + 32
    return Int(fahrenheit)
  }
  
}
