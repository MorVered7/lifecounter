//
//  ViewController.swift
//  lifecounter
//
//  Created by Mor Vered on 4/19/25.
//

import UIKit

class ViewController: UIViewController {

    struct Player {
        var life: Int
    }
    var history: [String] = []

    var players: [Player] = []
    var gameStarted = false
    @IBAction func addPlayer(_ sender: Any) {
        guard players.count < 8 else { return }
        addPlayerView(index: players.count)
    }
    @IBOutlet weak var addPlayerButton: UIButton!
    
    @IBOutlet weak var loseButton: UILabel!
    @IBOutlet weak var stackview: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loseButton.isHidden = true

        for i in 0..<2 {
            addPlayerView(index: i)
        }
    }
    func addPlayerView(index: Int) {
        players.append(Player(life: 20))
        let playerView = createPlayerView(for: index)
        stackview.addArrangedSubview(playerView)
    }
    func createPlayerView(for index: Int) -> UIView {
        
        let player = UIStackView()
        player.axis = .horizontal
        player.heightAnchor.constraint(equalToConstant: 40).isActive = true

        let label = UILabel()
        label.text = "Player \(index + 1): 20"
        label.tag = 100 + index

        player.addArrangedSubview(label)
        let input = UITextField()
        input.placeholder = "1"
        input.tag = 300 + index
        input.widthAnchor.constraint(equalToConstant: 40).isActive = true
        input.keyboardType = .numberPad

        player.addArrangedSubview(input)

        let minus = UIButton(type: .system)
        minus.setTitle("-", for: .normal)
        minus.tag = index
        minus.addTarget(self, action: #selector(decreaseLife(_:)), for: .touchUpInside)

        player.addArrangedSubview(minus)

        let plus = UIButton(type: .system)
        plus.setTitle("+", for: .normal)
        plus.tag = index
        plus.addTarget(self, action: #selector(increaseLife(_:)), for: .touchUpInside)

        player.addArrangedSubview(plus)
        

        return player

    }
    @objc func increaseLife(_ sender: UIButton) {
        let index = sender.tag
        guard let inputField = stackview.viewWithTag(300 + index) as? UITextField else {return}
        let amountText = inputField.text ?? ""
        let amount = Int(amountText) ?? 1
        
        players[index].life += amount
        updatePlayerLabel(index: index)
        gameStarted = true
        addPlayerButton.isEnabled = false
        checkLoss(index: index)
        history.append("Player \(index + 1) gained \(amount) life.")

    }

    @objc func decreaseLife(_ sender: UIButton) {
        let index = sender.tag
        guard let inputField = stackview.viewWithTag(300 + index) as? UITextField else {return}
        let amountText = inputField.text ?? ""
        let amount = Int(amountText) ?? 1

        players[index].life -= amount
        updatePlayerLabel(index: index)
        gameStarted = true
        addPlayerButton.isEnabled = false
        checkLoss(index: index)
        history.append("Player \(index + 1) lost \(amount) life.")

    }
    func updatePlayerLabel(index: Int) {
        if let label = stackview.viewWithTag(100 + index) as? UILabel {
            label.text = "Player \(index + 1): \(players[index].life)"
        }
    }
    func checkLoss(index: Int) {
        if players[index].life < 1 {
            loseButton.isHidden = false
            loseButton.text = "PLAYER \(index + 1) LOSES!"
            history.append("Player \(index + 1) lost.")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHistory" {
            let destination = segue.destination as? HistoryViewController
            destination?.history = history
        }
    }


}

