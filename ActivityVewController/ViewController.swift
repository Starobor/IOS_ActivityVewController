//
//  ViewController.swift
//  ActivityVewController
//
//  Created by Citizen on 06.09.2018.
//  Copyright © 2018 Citizen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewControlle: UIActivityViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        textField.center = view.center
        textField.borderStyle = .roundedRect
        textField.placeholder = "enter text to share"
        textField.delegate = self
        view.addSubview(textField)
    }

    func createButton() {
        buttonShare = UIButton(type: .roundedRect)
        buttonShare.frame = CGRect(x: 50, y: 500, width: 280, height: 45)
        buttonShare.setTitle("Share", for: .normal)
        buttonShare.addTarget(self, action: #selector(handleShare(sender:)), for: .touchUpInside)
        view.addSubview(buttonShare)
    }

    @objc func handleShare(sender: Any) {
        let text = textField.text
        
        if text?.count == 0 {
            let messege = "First input text, after press button"
            let alertController = UIAlertController(title: nil, message: messege, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
        activityViewControlle = UIActivityViewController(activityItems: [self.textField], applicationActivities: nil)
        present(activityViewControlle!, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

