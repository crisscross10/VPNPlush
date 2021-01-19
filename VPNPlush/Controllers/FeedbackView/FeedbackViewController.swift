//
//  FeedbackViewController.swift
//  BeeVPN
//
//  Created by Robo Warrier on 16/09/20.
//  Copyright © 2020 Robo Warrier. All rights reserved.
//

import UIKit
import MessageUI

class FeedbackViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_Msg: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btn_Submit(_ sender: Any) {
        self.view.endEditing(true)
        
        if let email = self.txt_Email.text, email.isEmpty {
            Utilities.showAlertView(controller: self, title: "", message: "Please enter email")
        }
        else if !self.isValidEmail(email: self.txt_Email.text ?? "") {
            Utilities.showAlertView(controller: self, title: "", message: "Please enter valid email")
        } else if self.txt_Msg.text.isEmpty {
            Utilities.showAlertView(controller: self, title: "", message: "Please enter your message")
        } else {
            
            
            if MFMailComposeViewController.canSendMail() {
                let messageBody = self.txt_Msg.text ?? ""
                let toRecipents = ["info@optimumtrio.com"]
                let mc: MFMailComposeViewController = MFMailComposeViewController()
                mc.mailComposeDelegate = self
                mc.setSubject("BeeVPN Feedback")
                mc.setMessageBody(messageBody, isHTML: false)
                mc.setToRecipients(toRecipents)
                self.present(mc, animated: true, completion: nil)
            }
            else {
                // show failure alert
                let alert = UIAlertController(title: "Error", message: "Mail is not configured.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                      switch action.style{
                      case .default:
                            print("default")
                      case .cancel:
                            print("cancel")
                      case .destructive:
                            print("destructive")
                      @unknown default:
                        fatalError()
                    }}))
                self.present(alert, animated: true, completion: nil)
            }

        }
    }

    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
