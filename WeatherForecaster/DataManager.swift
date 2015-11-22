//
//  DataManager.swift
//  WeatherForecaster
//
//  Created by Larry Heimann on 11/6/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import Foundation
import CoreLocation

var locationManager = LocationManager()
var forecastURL = locationManager.forecastURL

class DataManager {
  
  class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
    var session = NSURLSession.sharedSession()
    
    let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
      if let responseError = error {
        completion(data: nil, error: responseError)
      } else if let httpResponse = response as? NSHTTPURLResponse {
        if httpResponse.statusCode != 200 {
          var statusError = NSError(domain:"cmuis.net", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
          completion(data: nil, error: statusError)
        } else {
          completion(data: data, error: nil)
        }
      }
    })
    
    loadDataTask.resume()
  }
  
  class func getForecastDataFromAPIWithSuccess(success: ((weatherData: NSData!) -> Void)) {
    loadDataFromURL(NSURL(string: forecastURL)!, completion:{(data, error) -> Void in
      if let urlData = data {
        success(weatherData: urlData)
      }
    })
  }
  
}