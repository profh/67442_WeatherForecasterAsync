//
//  LocationManager.swift
//  WeatherForecaster
//
//  Created by Larry Heimann on 11/16/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager {
  
  var city: String = "Wherever"
  var latitude: String = "0.00"
  var longitude: String = "0.00"
  var locationManager = CLLocationManager()
  var forecastURL: String = ""
  
  init() {
    getLocation()
    self.forecastURL = "http://api.openweathermap.org/data/2.5/weather?lat=\(self.latitude)&lon=\(self.longitude)&APPID=ad83d72d867862de7a87faec3178ffa6"
  }
  
  
  func getLocation() {
    locationManager.requestWhenInUseAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.startUpdatingLocation()
    }
    self.latitude = "\(locationManager.location!.coordinate.latitude)"
    self.longitude = "\(locationManager.location!.coordinate.longitude)"
  }
}