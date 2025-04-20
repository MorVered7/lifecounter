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
        lifecount_player2.text = "\(p2_lifecount_var)"
        // Do any additional setup after loading the view.
        lose.isHidden = true
    }
    @IBOutlet weak var p1_lifecount: UILabel!
    var p1_lifecount_var: Int = 20
    @IBOutlet weak var lifecount_player2: UILabel!
    var p2_lifecount_var: Int = 20
    
    @IBOutlet weak var lose: UITextField!
    
    @IBOutlet weak var lifecount_player1: UILabel!
    
    @IBAction func p1_minus(_ sender: Any) {
        p1_lifecount_var -= 1
        p1_lifecount.text = "\(p1_lifecount_var)"
        if p1_lifecount_var < 1 {
            lose.text = "Player 1 Loses!"
            lose.isHidden = false
        }
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
        if p1_lifecount_var < 1 {
            lose.text = "Player 1 Loses!"
            lose.isHidden = false
        }
    }
    @IBAction func p2_minus(_ sender: Any) {
        p2_lifecount_var -= 1
        lifecount_player2.text = "\(p2_lifecount_var)"
        if p2_lifecount_var < 1 {
            lose.text = "Player 2 Loses!"
            lose.isHidden = false
        }
    }
    @IBAction func p2_plus(_ sender: Any) {
        p2_lifecount_var += 1
        lifecount_player2.text = "\(p2_lifecount_var)"
    }
    @IBAction func p2_minus5(_ sender: Any) {
        p2_lifecount_var -= 5
        lifecount_player2.text = "\(p2_lifecount_var)"
        if p2_lifecount_var < 1 {
            lose.text = "Player 2 Loses!"
            lose.isHidden = false
        }
    }
    @IBAction func p2_plus5(_ sender: Any) {
        p2_lifecount_var += 5
        lifecount_player2.text = "\(p2_lifecount_var)"
    }
}

