//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Mor Vered on 4/22/25.
//

import UIKit

class HistoryViewController: UIViewController {
    var history: [String] = []
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.text = history.joined(separator: "\n")
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var historyTextView: UITextView!


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
