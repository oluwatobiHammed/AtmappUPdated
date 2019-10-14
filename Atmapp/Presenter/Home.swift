//
//  ViewController.swift
//  Atmapp
//
//  Created by user on 23/09/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import UIKit

class Home: UIViewController {

    @IBOutlet weak var transactionHistoryView: UIView!
    @IBOutlet weak var transactionTableView: UITableView!
    @IBOutlet weak var balanceView: UIView!
    let cellSpacingHeight: CGFloat = 30
    let transactions = TransactionDetails.transaction
     
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

extension Home:  UITableViewDataSource, UITableViewDelegate {
    
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

       return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transaction")! as? TransactionTableViewCell
        
        let transaction = transactions[indexPath.row]
      
        cell?.transactionName.text = transaction.transactionNames
        cell?.transactionLocation.text = transaction.transactionLocation
        cell?.transactionAmount.text = transaction.transactionAmount
        cell?.transactionTime.text = transaction.transactionTime
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

