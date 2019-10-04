//
//  CardView.swift
//  Atmapp
//
//  Created by user on 27/09/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

class CardView:  UIViewController{
    
    @IBOutlet weak var selectionTableView: UITableView!
    @IBOutlet weak var cardView: UIView!
    let Names = CardDetails.settingsNames
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.selectionTableView.delegate = self
        self.selectionTableView.dataSource = self
        selectionTableView.backgroundColor = .clear
        selectionTableView.reloadData()
        cardView.layer.cornerRadius = 60
        cardView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    @objc func toggle(_ sender: UISwitch){
        print("Switch!")
    }

}
extension CardView: UITableViewDataSource, UITableViewDelegate{
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settings1") as? CardTableViewCell
        let switchObj = UISwitch(frame: CGRect(x: 1, y: 1, width: 20, height: 20))
            switchObj.isOn = false
        switchObj.addTarget(self, action: #selector(toggle(_:)), for: .valueChanged)
        cell?.settingsLabel.text = Names[indexPath.row]
        if indexPath.row == 0 {
            cell?.accessoryType = .disclosureIndicator
        }
        if indexPath.row == 1 {
            cell?.accessoryType = .disclosureIndicator
        }
        
        if indexPath.row == 2 {
            cell?.accessoryView = switchObj
        }
        if indexPath.row == 3 {
            cell?.accessoryView = switchObj
        }
        
        if indexPath.row == 4 {
            cell?.accessoryView = switchObj
        }
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "transfer", sender: nil)
        }
        tableView.reloadData()

            tableView.deselectRow(at: indexPath, animated: true)
    }
}
