//
//  ViewController.swift
//  ARCWithObjectsExample1
//
//  Created by Papneja, Brajmohan on 04/04/18.
//  Copyright © 2018 Papneja, Brajmohan. All rights reserved.
//

/*
 This section we will be talking about reference cycles.
 Swift uses Automatic reference counting.
 For most part, Developers don't have to worry about. However, If we use relationships, in that case, We have to take care of not forming reference cycle.
 */

//Please find that What’s wrong with below classes Employee & Company?

import UIKit


class Company {
    weak var parent: Company?
    var subsidiaries: [Company] = []
    
    deinit {
        print("company instance got release from memory")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
       
        
        do
        {
        let tata = Company()
        let titan = Company()
        let tcs = Company()
        let tataCliq = Company()
        
        tata.subsidiaries = [titan,tcs,tataCliq]
        tata.subsidiaries.forEach { $0.parent = tata }
        }
        
       
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

