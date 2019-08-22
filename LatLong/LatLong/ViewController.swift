//
//  ViewController.swift
//  LatLong
//
//  Created by dipa on 22/08/19.
//  Copyright © 2019 dipa. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    //var latLong = (0.0,0.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        let address = "Hinjewadi"

        latLongForAddress(address: address) { lat, long in
            print(lat, long)
        }
    }
    func latLongForAddress(address: String, latLong: @escaping (Double,Double)->Void){
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    // handle no location found
                    return
            }
            latLong(location.coordinate.latitude,location.coordinate.longitude)
        }
    }

}

