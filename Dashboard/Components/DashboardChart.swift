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
    var legend1Label: UILabel? = nil
    var legend1Circle: UIView? = nil
    
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
    
    @IBInspectable var legend1: String = "Legend 1" {
        didSet {
            setupLabels()
        }
    }
    
    @IBInspectable var legend1Color: UIColor = UIColor.black {
        didSet {
            setupLabels()
        }
    }
    
    private func setupLabels() {
        setupValueLabel()
        setupTitleLabel()
        setupLegend1Label()
        setupButton()
        setupLegend1Circle()
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
        detailsButton.backgroundColor = .white
        detailsButton.layer.cornerRadius = 18
        detailsButton.layer.borderWidth = 1
        detailsButton.layer.borderColor = UIColor.white.cgColor
        detailsButton.setTitleColor(.black, for: .normal)
        detailsButton.setTitle("Details", for: .normal)
        detailsButton.addTarget(self, action: #selector(DashboardChart.detailsButtonTapped(button:)), for: .touchUpInside)
        
        detailsButton.translatesAutoresizingMaskIntoConstraints = false
        detailsButton.heightAnchor.constraint(equalToConstant: 37.0).isActive = true
        detailsButton.widthAnchor.constraint(equalToConstant: 85.0).isActive = true
        let margins = self.layoutMarginsGuide
        
        addSubview(detailsButton)
        
        detailsButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 160).isActive = true
        detailsButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
    }
    
    @objc func detailsButtonTapped(button: UIButton) {
        print("Button pressed")
    }
    
    private func setupLegend1Label() {
        if self.legend1Label != nil {
            self.legend1Label?.removeFromSuperview()
        } else {
            self.legend1Label = UILabel()
        }
        
        let legend1Label = self.legend1Label!
        legend1Label.text = legend1
        legend1Label.textColor = legend1Color
        legend1Label.font = UIFont.systemFont(ofSize: 15.0, weight: UIFont.Weight.ultraLight)
        
        legend1Label.translatesAutoresizingMaskIntoConstraints = false
        let margins = self.layoutMarginsGuide
        
        addSubview(legend1Label)
        
        legend1Label.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 42).isActive = true
        legend1Label.topAnchor.constraint(equalTo: margins.topAnchor, constant: 60).isActive = true
    }
    
    private func setupLegend1Circle() {
        if self.legend1Circle != nil {
            self.legend1Circle?.removeFromSuperview()
        } else {
            self.legend1Circle = UIView()
        }
        
        let legend1Circle = self.legend1Circle!
        legend1Circle.backgroundColor = UIColor.clear
        legend1Circle.translatesAutoresizingMaskIntoConstraints = false
        legend1Circle.heightAnchor.constraint(equalToConstant: 5.0).isActive = true
        legend1Circle.widthAnchor.constraint(equalToConstant: 5.0).isActive = true
        let margins = self.layoutMarginsGuide
        
        addSubview(legend1Circle)
        
        legend1Circle.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 30).isActive = true
        legend1Circle.topAnchor.constraint(equalTo: margins.topAnchor, constant: 68).isActive = true
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 0,y: 0), radius: CGFloat(5), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        legend1Circle.layer.addSublayer(shapeLayer)
    }
    
}
