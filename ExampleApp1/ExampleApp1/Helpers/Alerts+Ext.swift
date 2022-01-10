//
//  Alerts+Ext.swift
//  ExampleAPP
//
//  Created by HANAN  on 07/01/2022.
//

import UIKit

class Alerts {
    typealias ActionCompletion = ((UIAlertAction) -> Void)?
    func presentErrorAlert(vc: UIViewController,title: String, msg: String, btnTitle: String, completion: ActionCompletion) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: btnTitle, style: .default, handler: completion)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}
