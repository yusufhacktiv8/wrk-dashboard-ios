//
//  ChartViewController.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 9/29/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {
    
    @IBOutlet weak var chartScrollView: UIScrollView!
    @IBOutlet weak var chartStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initChartViews()
    }
    
    private func initChartViews() {
        var chartView = UIView()
        chartView.backgroundColor = UIColor.green
        chartStackView.addArrangedSubview(chartView)
        
        chartView.widthAnchor.constraint(equalTo: chartScrollView.widthAnchor).isActive = true
        chartView.heightAnchor.constraint(equalTo: chartScrollView.heightAnchor).isActive = true
        
        chartView = UIView()
        chartView.backgroundColor = UIColor.blue
        chartStackView.addArrangedSubview(chartView)
        
        chartView.widthAnchor.constraint(equalTo: chartScrollView.widthAnchor).isActive = true
        chartView.heightAnchor.constraint(equalTo: chartScrollView.heightAnchor).isActive = true
        
        chartView = UIView()
        chartView.backgroundColor = UIColor.yellow
        chartStackView.addArrangedSubview(chartView)
        
        chartView.widthAnchor.constraint(equalTo: chartScrollView.widthAnchor).isActive = true
        chartView.heightAnchor.constraint(equalTo: chartScrollView.heightAnchor).isActive = true
        
//        chartView.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
//        chartView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
//        chartView.widthAnchor.constraint(equalTo: chartScrollView.widthAnchor, multiplier: 1).isActive = true
//        chartView.heightAnchor.constraint(equalTo: chartScrollView.heightAnchor, multiplier: 1).isActive = true
//        chartView.centerXAnchor.constraint(equalTo: chartScrollView.centerXAnchor).isActive = true
//        chartView.centerYAnchor.constraint(equalTo: chartStackView.centerYAnchor).isActive = true
        
        
        
        
    }
}
