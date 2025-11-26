//
//  ViewController.swift
//  MemoryLeakRaceConditionDemo
//
//  Created by                     Nand Parikh on 26/11/25.
//

/* To test it -
    From right panel select "Show the debug navigator or
    click on share icon above the debug console
    it will show Person(1) and Pet(1) when you not use the weak
 
    Alternet way - Product -> Profile -> Leak and run your app
 */

import UIKit
class Person {
    var pet: Pet?
    
    deinit { print("Person deinit called") }
}

class Pet {
    var owner: Person?
//    weak var owner: Person?
    deinit { print("Pet deinit called") }
}

class ViewController: UIViewController {

    @IBAction func btnClick(_ sender: UIButton) {
        var p : Person? = Person()
        var dog : Pet? = Pet()

        p?.pet = dog
        dog?.owner = p

        p = nil
        dog = nil
        print("End of viewDidLoad")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}




