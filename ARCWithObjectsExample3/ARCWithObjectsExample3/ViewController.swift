//
//  ViewController.swift
//  ARCWithObjectsExample3
//
//  Created by Papneja, Brajmohan on 04/04/18.
//  Copyright © 2018 Papneja, Brajmohan. All rights reserved.
//

import UIKit

//Please find, What's wrong with this code.

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
    
    deinit {
        print("Country \(self.name) got deallocated")
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    
    deinit {
        print("City \(self.name) got deallocated")
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let country = Country(name: "Canada", capitalName: "Ottawa")
        print("\(country.name)'s capital city is called \(country.capitalCity.name)")
        // Prints "Canada's capital city is called Ottawa"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

