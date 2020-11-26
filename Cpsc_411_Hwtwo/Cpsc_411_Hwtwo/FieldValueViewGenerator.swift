//
//  FieldValueViewGenerator.swift
//  Cpsc_411_Hwtwo
//
//  Created by Tommy Huynh on 11/25/20.
//

import UIKit

class FieldValueViewGenerator {
    var label_Name : String!
    
    init(n : String) {
        label_Name = n
    }
    
    func generate() -> UIStackView {
        let stack_View = UIStackView()
        stack_View.axis = .horizontal
        stack_View.distribution = .fill
        stack_View.spacing = 30
        
        // Creates the lines for the values
        let lbl = UILabel()
        lbl.text = label_Name
        stack_View.addArrangedSubview(lbl)
        let value_Lines = UITextField()
        value_Lines.borderStyle = .none
        value_Lines.layer.masksToBounds = false
        value_Lines.layer.backgroundColor = UIColor.white.cgColor
        value_Lines.layer.shadowColor = UIColor.darkGray.cgColor
        value_Lines.layer.shadowOffset = CGSize.init(width: 0.0, height: 1.0)
        value_Lines.layer.shadowOpacity = 1.0
        value_Lines.layer.shadowRadius = 0.0
        value_Lines.placeholder = "          "
        value_Lines.sizeToFit()
        stack_View.addArrangedSubview(value_Lines)
    
        // Setting orientation
        lbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        value_Lines.setContentHuggingPriority(.defaultLow, for: .horizontal)
        lbl.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        value_Lines.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        //
        return stack_View
    }
}
