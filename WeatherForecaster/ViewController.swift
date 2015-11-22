//
//  ViewController.swift
//  WeatherForecaster
//
//  Created by Larry Heimann on 11/6/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import UIKit
import CoreLocation

var temp: Float?
var city: String?
var icon: String?

class ViewController: UIViewController, CLLocationManagerDelegate {
  
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var tempLabel: UILabel!
  var forecast: Forecast?
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // get the forecast async
    dispatch_async(dispatch_get_main_queue(), {
      self.forecast = Forecast()
      
      // only for demo purposes; forecast retrieved too fast normally
      sleep(2)
      var i = 0
      do { i += 1 } while self.forecast!.city == nil
      // update labels as soon as forecast is retrieved
      self.updateLabels()
    })
    
    // Don't wait to put in the date and time
    dateLabel.text = getDateHumanReadable()
  }

  func updateLabels() {
    if let cityForecast = forecast!.city {
      cityLabel.text = "\(cityForecast)"
    } else {
      cityLabel.text = "TBD"
    }
    
    if let tempForecast = forecast!.temp {
      tempLabel.text = "\(forecast!.convertFromKelvinToFahrenheit())"
    } else {
      tempLabel.text = "TBD"
    }
  }
  
  func getDateHumanReadable () -> String {
    let dateNow: NSDate = NSDate()
    let formatter = NSDateFormatter()
    formatter.dateStyle = NSDateFormatterStyle.MediumStyle
    formatter.timeStyle = .ShortStyle
    
    let dateString = formatter.stringFromDate(dateNow)
  
    return dateString
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }


}

