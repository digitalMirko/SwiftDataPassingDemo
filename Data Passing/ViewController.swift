//
//  ViewController.swift
//  Data Passing
//
//  Created by Mirko Cukich on 8/10/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//
//  Swift Data Passing Demo - Demo 7 of 30


import UIKit
// first screen view controller
class ViewController: UIViewController {
    
    // text view
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Done button clicked shows text typed on next screen  
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:
            UIBarButtonItem.SystemItem.done, target: self, action: #selector(didPressDoneButton(_:)))
    }
    // performs seque to next screen
    @objc func didPressDoneButton(_ sender: UIBarButtonItem){
        performSegue(withIdentifier: SecondViewController.identifier, sender: self)
    }
    
    // prepare for segue to trigger, collect info, supply to next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SecondViewController.identifier{
            let vc = segue.destination as! SecondViewController
            vc.text = self.textView.text!
        }
    }

}
// second screen view controller
class SecondViewController: UIViewController {
    
    // text view
    @IBOutlet weak var textView: UITextView!
    
    // text string, supply data from first screen
    var text: String?
    
    // segue to trigger
    static let identifier = "details"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // shows text from other screen
        textView.text = text
    }
}
