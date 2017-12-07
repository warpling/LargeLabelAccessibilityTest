//
//  ViewController.swift
//  LargeLabelAccessibilityTest
//
//  Created by Ryan McLeod on 12/6/17.
//  Copyright © 2017 Ryan McLeod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var elPequeno: UILabel!
    @IBOutlet weak var elGordo: UILabel!
    @IBOutlet weak var debugButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stackView.distribution = .fillEqually

        let rowCount = 20
        for index in 1...rowCount {
            let label = UILabel()
            label.text = "\(index)"
            label.font = UIFont.systemFont(ofSize: 18)
            label.backgroundColor = UIColor.black.withAlphaComponent(CGFloat(index) / CGFloat(rowCount))
            stackView.addArrangedSubview(label)
        }

        elPequeno.text = "X"
        elPequeno.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        elPequeno.font = UIFont.boldSystemFont(ofSize: 80)

        elGordo.text = "X"
        elGordo.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        elGordo.font = UIFont.boldSystemFont(ofSize: 200)

        autoSetAccessibilityElements()
    }

    @IBAction func debugAction() {
        if (view.accessibilityElements == nil) {
            manuallySetAccessibilityElements()
        } else {
            autoSetAccessibilityElements()
        }
    }

    func manuallySetAccessibilityElements() {

        view.accessibilityElements = [elPequeno, elGordo, debugButton] + stackView.arrangedSubviews
//        view.accessibilityElements =  stackView.arrangedSubviews + [elPequeno, elGordo, debugButton] // Reversed
        debugButton.setTitle("set accessibilityElements to nil (auto)", for: .normal)
        debugButton.setTitleColor(.blue, for: .normal)
    }

    func autoSetAccessibilityElements() {
        view.accessibilityElements = nil
        debugButton.setTitle("set accessibilityElements manually", for: .normal)
        debugButton.setTitleColor(.red, for: .normal)
    }
}

