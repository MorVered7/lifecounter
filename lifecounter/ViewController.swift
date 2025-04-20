//
//  ViewController.swift
//  lifecounter
//
//  Created by Mor Vered on 4/19/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        p1_lifecount.text = "\(p1_lifecount_var)"
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var p1_lifecount: UILabel!
    var p1_lifecount_var: Int = 20
    
    @IBOutlet weak var lifecount_player1: UILabel!
    
    @IBAction func p1_minus(_ sender: Any) {
        p1_lifecount_var -= 1
        p1_lifecount.text = "\(p1_lifecount_var)"
    }
    @IBAction func p1_plus(_ sender: Any) {
        p1_lifecount_var += 1
        p1_lifecount.text = "\(p1_lifecount_var)"
    }
    @IBAction func p1_plus5(_ sender: Any) {
        p1_lifecount_var += 5
        p1_lifecount.text = "\(p1_lifecount_var)"
    }
    @IBAction func p1_minus5(_ sender: Any) {
        p1_lifecount_var -= 5
        p1_lifecount.text = "\(p1_lifecount_var)"
    }
}

