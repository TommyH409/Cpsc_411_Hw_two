//
//  ClaimDetailSectionGenerator.swift
//  Cpsc_411_Hwtwo
//
//  Created by Tommy Huynh on 11/25/20.
//

import UIKit

class ClaimDetailSectionGenerator {
    
    func generate() -> UIStackView {
        let stack_View = UIStackView()
        stack_View.axis = .vertical
        stack_View.distribution = .fill
        stack_View.spacing = 20
        
        let stack_View_1 = UIStackView()
        stack_View_1.distribution = .fill
        
        // App Header
        let title = UILabel()
        title.text = "Please Enter Claim Information"
        title.textAlignment = .center
        title.font = UIFont(name:"Georgia-Bold", size: 18)
        stack_View_1.addArrangedSubview(title)
        stack_View.addArrangedSubview(stack_View_1)
        
        // Names for user-inputted data
        var view_Gen = FieldValueViewGenerator(n: "Claim Title: ")
        var sub_View = view_Gen.generate()
        stack_View.addArrangedSubview(sub_View)
        view_Gen = FieldValueViewGenerator(n: "Date: ")
        sub_View = view_Gen.generate()
        stack_View.addArrangedSubview(sub_View)
        
        // Sets orientation
        stack_View_1.translatesAutoresizingMaskIntoConstraints = false
        let stack_View_top = stack_View_1.topAnchor.constraint(equalTo: stack_View.safeAreaLayoutGuide.topAnchor)
        let stack_View_trail = stack_View_1.trailingAnchor.constraint(equalTo: stack_View.safeAreaLayoutGuide.trailingAnchor)
        let stack_View_lead = stack_View_1.leadingAnchor.constraint(equalTo: stack_View.safeAreaLayoutGuide.leadingAnchor)
        stack_View_top.isActive = true
        stack_View_trail.isActive = true
        stack_View_lead.isActive = true
        
        return stack_View
        
    }
}
