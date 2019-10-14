//
//  Support.swift
//  Atmapp
//
//  Created by user on 03/10/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

class Support: UIViewController {
  
    @IBOutlet weak var supportView: UIView!
    @IBOutlet weak var supportTableView: UITableView!
    let supportList = SupportList.supportList
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.supportTableView.delegate = self
        self.supportTableView.dataSource = self
        supportTableView.backgroundColor = .clear
        supportView.layer.cornerRadius = 60
        supportView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        

    }
}

extension Support: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        supportList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "support")
        
        cell?.textLabel?.text = supportList[indexPath.row]
        cell?.textLabel?.font = UIFont(name: "HelveticaNeue-Regular", size: 20)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
       {
           let verticalPadding: CGFloat = 6

           let maskLayer = CALayer()
          // maskLayer.cornerRadius = 30    //if you want round edges
           maskLayer.backgroundColor = UIColor.black.cgColor
           maskLayer.frame = CGRect(x: (((cell.bounds.origin.x)) + 15), y: (cell.bounds.origin.y), width: (((cell.bounds.width)) - 25), height: ((cell.bounds.height))).insetBy(dx: 2, dy: verticalPadding)
           cell.layer.mask = maskLayer
           cell.accessoryType = .disclosureIndicator
       
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }
}
