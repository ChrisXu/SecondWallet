//
//  TodayViewController.swift
//  todaywidget
//
//  Created by Chris Xu on 2019/9/7.
//  Copyright © 2019 chrisxu. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        containerView.layer.cornerRadius = 8
        
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        imageView.image = BarcodeGenerator.shared.generate(from: "2620683946907")
        
        completionHandler(NCUpdateResult.noData)
    }
    
}
