//
//  Withdrawal.swift
//  Atmapp
//
//  Created by user on 29/09/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

class Withdrawal: UIViewController {
    
    @IBOutlet weak var mainBalanceView: UIView!
    @IBOutlet weak var amountView: UIView!
    @IBOutlet weak var enterAmount: UITextField!
    @IBOutlet weak var denominationAmount: UIPickerView!
    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var abortButton: UIButton!
    @IBOutlet weak var verifyButton: UIButton!
    @IBOutlet weak var pinOneTextField: UITextField!
    @IBOutlet weak var pinFourTextField: UITextField!
    @IBOutlet weak var pinThreeTextField: UITextField!
    @IBOutlet weak var pinTwoTextField: UITextField!


   
    var userEnteredPin: String?
    let pin = "1111"
    var remainingAttempts = 3
    let moneyDenomination = MoneyDenomination.moneyDenomination
    let balance = 56379.01
    var selectedAmount: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        verifyButton.isEnabled = false
        pinOneTextField.delegate = self
        pinOneTextField.keyboardType = .numberPad
        pinTwoTextField.delegate = self
        pinTwoTextField.keyboardType = .numberPad
        pinThreeTextField.delegate = self
        pinThreeTextField.keyboardType = .numberPad
        pinFourTextField.delegate = self
        pinFourTextField.keyboardType = .numberPad

        enterAmount.delegate = self
        enterAmount.keyboardType = .numberPad
        
        denominationAmount.dataSource = self
        denominationAmount.delegate = self
        verifyButton.layer.cornerRadius = 15
        abortButton.layer.cornerRadius = 15
        mainBalanceView.layer.cornerRadius = 10
        amountView.layer.cornerRadius = 10
        balanceView.layer.cornerRadius = 60
        balanceView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        navigationItem.title = "WITHDRAWAL"
        createToolBar()
       
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
   
    }
    
    func createToolBar (){
        let toolBar =  UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(Withdrawal.dissmissKeyBoard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        enterAmount.inputAccessoryView = toolBar
        pinFourTextField.inputAccessoryView = toolBar
        pinOneTextField.inputAccessoryView = toolBar
        pinTwoTextField.inputAccessoryView = toolBar
        pinThreeTextField.inputAccessoryView = toolBar
        
    }
    
    private func voidexecuteLogin() {
        
        userEnteredPin = pinOneTextField.text! + pinTwoTextField.text! + pinThreeTextField.text! + pinFourTextField.text!
        if pinFourTextField.text?.utf16.count == 1{
            
            let amount = Double(enterAmount.text!)
                if  amount == nil {
                     displayMyAlertMessage(userMessage: "Enter Amount you want to withdrawal")
                }else{
                    if (remainingAttempts != 0){
                         if pin == userEnteredPin && amount! <= balance {
                           let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Verified") as! Verified
                           self.show(nextViewController, sender: self)
                         
                        }else{
                            var msg = " "
                           
                           if amount! > balance {
                                displayMyAlertMessage(userMessage: "The Amount entered have exceeded the balance")
                            }
                           else if (remainingAttempts > 0){
                                msg = "\(remainingAttempts) attempts left."
                                displayMyAlertMessage(userMessage: "Pin do not match " + msg);
                                remainingAttempts  = remainingAttempts - 1
                            }
                        }
                    }else{
                        displayMyAlertMessage(userMessage: "Your Card Have been permanently retained, please contact your bank")
                       let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                       let nextViewController = storyBoard.instantiateViewController(withIdentifier: "card") as! CardView
                                       self.show(nextViewController, sender: self)
                    }

                
            }
        }
             
        
    }
    @objc func dissmissKeyBoard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= (keyboardSize.height - 170)
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func displayMyAlertMessage(userMessage:String)
    {

        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertController.Style.alert);

        let okAction = UIAlertAction(title:"Ok", style:UIAlertAction.Style.default, handler:nil);
        myAlert.addAction(okAction);

        self.present(myAlert, animated:true, completion:nil);

    }

    
    @IBAction func abortButton(_ sender: UIButton) {
    }
    
    @IBAction func verifyButton(_ sender: UIButton) {
       voidexecuteLogin()
     
    }
}

extension Withdrawal: UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moneyDenomination.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return moneyDenomination[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedAmount = moneyDenomination[row]
        enterAmount.text = selectedAmount
    }
    
    
}

extension Withdrawal: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Find out what the text field will be after adding the current edit
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if Int(text) != nil {
            // Text field converted to an Int
            verifyButton.isEnabled = true
        } else {
            // Text field is not an Int
            verifyButton.isEnabled = false
        }

        // Return true so the text field will be changed
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
          verifyButton.becomeFirstResponder()
        let text = textField.text
        if text?.utf16.count == 1 {
          
            switch textField {
            case pinOneTextField:
                 pinTwoTextField.becomeFirstResponder()
            case pinTwoTextField:
                pinThreeTextField.becomeFirstResponder()
            case pinThreeTextField:
                pinFourTextField.becomeFirstResponder()
            case pinFourTextField:
                pinFourTextField.becomeFirstResponder()
               
            default:
               break
            }
        }
        

    }
}
