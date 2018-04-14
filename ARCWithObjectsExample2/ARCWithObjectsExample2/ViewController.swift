//
//  ViewController.swift
//  ARCWithObjectsExample2
//
//  Created by Papneja, Brajmohan on 04/04/18.
//  Copyright © 2018 Papneja, Brajmohan. All rights reserved.
//

import UIKit

//Please find What's wrong with the following code.

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned var customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        do{
        var john: Customer?
        john = Customer(name: "John Appleseed")
        
        let card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
        john!.card = card
        john = nil
        print(card.number)
            
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

