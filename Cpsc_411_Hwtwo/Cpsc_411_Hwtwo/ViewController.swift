//
//  ViewController.swift
//  Cpsc_411_Hwtwo
//
//  Created by Tommy Huynh on 11/25/20.
//

import UIKit

class ViewController: UIViewController {
    
    let Claim_button = UIButton()
    let statusMessage = UILabel()
    var Claim_val = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detail_Gen = ClaimDetailSectionGenerator()
        let sub_View = detail_Gen.generate()
        view.addSubview(sub_View)
        
          let Stack_View_3 = sub_View.arrangedSubviews
        for sv in Stack_View_3 {
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews {
                if ve is UITextField {
                    Claim_val.append(ve as! UITextField)
                }
            }
        }
        
        for i in 0...Claim_val.count-1 {
            Claim_val[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = Claim_val[i].leadingAnchor.constraint(equalTo: Claim_val[0].leadingAnchor)
            constr.isActive = true
        }
        
        // Button settings
        let Stack_View_2 = UIStackView()
        Stack_View_2.spacing = 10
        Claim_button.setTitle("Add", for: .normal)
        Claim_button.setTitleColor(UIColor.black, for: .normal)
        Claim_button.backgroundColor = UIColor.cyan
        Claim_button.addTarget(self, action: #selector(add(_:)), for: .touchUpInside)
        Stack_View_2.addArrangedSubview(Claim_button)
        view.addSubview(Stack_View_2)
        
        // Status indicator
        let Stack_View_1 = UIStackView()
        Stack_View_1.axis = .horizontal
        Stack_View_1.spacing = 20
        let status = UILabel()
        status.text = "Status:"
        Stack_View_1.addArrangedSubview(status)
        statusMessage.text = "<Status Message>"
        Stack_View_1.addArrangedSubview(statusMessage)
        view.addSubview(Stack_View_1)
        
        sub_View.translatesAutoresizingMaskIntoConstraints = false
        let top_Anc = sub_View.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let trail_Anc = sub_View.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let lead_Anc = sub_View.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        top_Anc.isActive = true
        trail_Anc.isActive = true
        lead_Anc.isActive = true
        
        // Messages
        Stack_View_2.translatesAutoresizingMaskIntoConstraints = false
        let top_Anc_2 = Stack_View_2.topAnchor.constraint(equalTo: sub_View.bottomAnchor)
        let trail_Anc_2 = Stack_View_2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        
        Stack_View_1.translatesAutoresizingMaskIntoConstraints = false
        let top_Anc_1 = Stack_View_1.topAnchor.constraint(equalTo: Stack_View_2.bottomAnchor)
        let trail_Anc_1 = Stack_View_1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let lead_Anc_1 = Stack_View_1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        
        //
        top_Anc_2.isActive = true
        trail_Anc_2.isActive = true
        top_Anc_1.isActive = true
        trail_Anc_1.isActive = true
        lead_Anc_1.isActive = true    }
    
    @objc func add(_ sender : UIButton) {
        let cTitle = Claim_val[0].text as String?
        let cDate = Claim_val[1].text as String?
        let cClaims = ClaimService()
        
        // Checks if fields have been filled and updates status message
        // Color indicates error on user end.
        if cTitle! == "" && cDate! == "" {
            self.statusMessage.backgroundColor = UIColor.yellow
            self.statusMessage.text = "Please enter the Claim *Title* and *Date*."
        }
        else if cTitle! == "" {
            self.statusMessage.backgroundColor = UIColor.yellow
            self.statusMessage.text = "Invalid Claim Title."
        }
        else if cDate! == "" {
            self.statusMessage.backgroundColor = UIColor.yellow
            self.statusMessage.text = "Invalid Date."
        }
        
        // If both fields are filled, update status message
        // Color indicator for failed or successful claim creation
        else {
            let cObj = Claim(Claim_title: cTitle!, Claim_date: cDate!)
            cClaims.addClaim(cObj: cObj, completion: { value in
                if value {
                    self.statusMessage.backgroundColor = UIColor.green
                    self.statusMessage.text = "Claim *\(cTitle!)*, successfully created."
                    self.Claim_val[0].text = ""
                    self.Claim_val[1].text = ""
                }
                else {
                    self.statusMessage.backgroundColor = UIColor.magenta
                    self.statusMessage.text = "Failed to create claim *\(cTitle!)*."
                }
            })
        }
    }
}

