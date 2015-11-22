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

    isForecastRetrieved({ (result) -> Void in
      // sleep(2)
      self.updateLabels()
    })

    dateLabel.text = getDateHumanReadable()

  }

  func isForecastRetrieved(completion: (result: Forecast) -> Void) {
    forecast = Forecast()
    var i = 0
    do { i += 1 } while forecast!.city == nil
    completion(result: forecast!)
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

