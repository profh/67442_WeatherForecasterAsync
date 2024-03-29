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
    forecast = Forecast()
    updateLabels()
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

