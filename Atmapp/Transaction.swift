//
//  Transaction.swift
//  Atmapp
//
//  Created by user on 14/10/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

struct Transaction {
    let transactionNames: String
    let transactionLocation: String
    let transactionAmount: String
    let transactionTime: String
    
    init(names: String, locations: String, amount: String, time: String) {
        transactionNames = names
        transactionLocation = locations
        transactionAmount = amount
        transactionTime = time
    }

}
