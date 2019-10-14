//
//  TransactionDetails.swift
//  Atmapp
//
//  Created by user on 03/10/2019.
//  Copyright © 2019 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation

struct TransactionDetails {
    static let transaction = [
        Transaction(names: "Withdrawal", locations: "Unilag Branch ATM", amount: "-20,052", time: "1:52AM"),
        Transaction(names: "SMS Alert Fee", locations: "0000013923413456", amount: "-8.00", time: "2:00AM"),
        Transaction(names: "Credit", locations: "MR FOLA AGORO", amount: "+100,000", time: "5:47PM"),
        Transaction(names: "Credit", locations: "USMAN UCHENNA.O", amount: "+20,000", time: "2:00PM"),
        Transaction(names:  "Withdrawal", locations: "IDUMOTABRANCHATM", amount: "+20,000", time: "12:00PM"),
        Transaction(names: "SMS Alert Fee", locations: "0000013923413452", amount: "-8.00", time: "11:00AM"),
        Transaction(names: "Withdrawal", locations: "0000013923413456", amount: "-8.00", time: "1:45PM"),
        Transaction(names: "SMS Alert Fee", locations: "0000013923413489", amount: "-8.00", time: "4:00PM")
    ]
}
