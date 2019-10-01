//
//  ViewController.swift
//  Atmapp
//
//  Created by user on 23/09/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var transactionHistoryView: UIView!
    @IBOutlet weak var transactionTableView: UITableView!
    @IBOutlet weak var balanceView: UIView!
    let cellSpacingHeight: CGFloat = 30
    
    let transactionNames = ["Withdrawal", "SMS Alert Fee", "Credit","Credit","Withdrawal","SMS Alert Fee","Withdrawal","SMS Alert Fee"]
    let transactionLocation = ["Unilag Branch ATM","0000013923413456","MR FOLA AGORO","USMAN UCHENNA.O","IDUMOTA BRANCH ATM","0000013923413452","0000013923413456","0000013923413489"]
    let transactionAmount = ["-20,052","-8.00","+100,000","+20,000","+20,000","-8.00","-8.00","-8.00"]
    let transactionTime = ["1:52AM","2:00AM","5:47PM","2:00PM","12:00PM","11:00AM","1:45PM","4:00PM"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.transactionTableView.delegate = self
        self.transactionTableView.dataSource = self
        transactionTableView.separatorColor = UIColor.clear
        balanceView.layer.cornerRadius = 10
        transactionHistoryView.layer.cornerRadius = 40
    }


}

extension ViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
     
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        
        label.backgroundColor = UIColor.systemGreen
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        if section == 0{
            label.text = "          Today"
              
        }else{
            label.text = "          Yesterday"
        }
         return label
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

       return transactionNames.count
       //return transactionLocation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transaction")! as? TransactionTableViewCell
        
        let name = transactionNames[indexPath.row]
        let location = transactionLocation[indexPath.row]
        let amount = transactionAmount[indexPath.row]
        let time = transactionTime[indexPath.row]
        cell?.transactionName.text = name
        cell?.transactionLocation.text = location
        cell?.transactionAmount.text = amount
        cell?.transactionTime.text = time
        return cell!
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 6

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 30    //if you want round edges
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: (((cell.bounds.origin.x)) + 15), y: (cell.bounds.origin.y), width: (((cell.bounds.width)) - 25), height: ((cell.bounds.height))).insetBy(dx: 2, dy: verticalPadding)
        cell.layer.mask = maskLayer
    }
    
}

