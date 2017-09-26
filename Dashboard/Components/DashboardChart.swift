//
//  DashboardChart.swift
//  Dashboard
//
//  Created by Muhammad Yusuf on 9/26/17.
//  Copyright © 2017 Rekon. All rights reserved.
//

import UIKit

@IBDesignable class DashboardChart: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var valueLabel: UILabel? = nil
    var titleLabel: UILabel? = nil
    var detailsButton: UIButton? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabels()
    }
    
    @IBInspectable var valueLabelText: String = "0.00" {
        didSet {
            setupLabels()
        }
    }
    
    @IBInspectable var valueLabelColor: UIColor = UIColor.black {
        didSet {
            setupLabels()
        }
    }
    
    @IBInspectable var title: String = "Title" {
        didSet {
            setupLabels()
        }
    }
    
    @IBInspectable var titleColor: UIColor = UIColor.black {
        didSet {
            setupLabels()
        }
    }
    
    private func setupLabels() {
//        self.backgroundColor = UIColor(red:0.23, green:0.39, blue:0.73, alpha:1.0)
        
        setupValueLabel()
        setupTitleLabel()
        setupButton()
    }
    
    private func setupValueLabel() {
        
        if self.valueLabel != nil {
            self.valueLabel?.removeFromSuperview()
        } else {
            self.valueLabel = UILabel()
        }
        
        let valueLabel = self.valueLabel!
        valueLabel.text = valueLabelText
        valueLabel.textColor = valueLabelColor
        valueLabel.font = UIFont.systemFont(ofSize: 36.0, weight: UIFont.Weight.ultraLight)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        valueLabel.widthAnchor.constraint(equalToConstant: 105.0).isActive = true
        let margins = self.layoutMarginsGuide
        
        addSubview(valueLabel)
        
        valueLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 30).isActive = true
        valueLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 1).isActive = true
    }
    
    private func setupTitleLabel() {
        
        if self.titleLabel != nil {
            self.titleLabel?.removeFromSuperview()
        } else {
            self.titleLabel = UILabel()
        }
        
        let titleLabel = self.titleLabel!
        titleLabel.text = title
        titleLabel.textColor = titleColor
        titleLabel.font = UIFont.systemFont(ofSize: 17.0, weight: UIFont.Weight.ultraLight)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 105.0).isActive = true
        let margins = self.layoutMarginsGuide
        
        addSubview(titleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 30).isActive = true
        titleLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 31).isActive = true
    }
    
    private func setupButton() {
        
        if self.detailsButton != nil {
            self.detailsButton?.removeFromSuperview()
        } else {
            self.detailsButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 27))
        }
        
        let detailsButton = self.detailsButton!
        detailsButton.setTitle("Details", for: UIControlState.normal)
        
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        detailsButton.heightAnchor.constraint(equalToConstant: 27.0).isActive = true
        detailsButton.widthAnchor.constraint(equalToConstant: 75.0).isActive = true
        let margins = self.layoutMarginsGuide
        
        addSubview(detailsButton)
        
        detailsButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 150).isActive = true
        detailsButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
    }
    
}
