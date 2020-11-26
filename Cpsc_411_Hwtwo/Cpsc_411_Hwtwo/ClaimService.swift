//
//  ClaimService.swift
//  Cpsc_411_Hwtwo
//
//  Created by Tommy Huynh on 11/25/20.
//

import Foundation

// Claim Struct
struct Claim : Codable {
    var Claim_title : String
    var Claim_date : String
}

class ClaimService {
    
    // Add claims to the server using POST
    func addClaim(cObj: Claim, completion: @escaping (Bool) -> Void) {
        let requestUrl = "http://localhost:8020/ClaimService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(cObj)
        var value = Bool()
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            DispatchQueue.main.async {
                if let resp = data {
                    // type of resp is Data
                    let respStr = String(bytes: resp, encoding: .utf8)
                    print("The response data sent from the server is \(respStr!)")
                    value = true
                    completion(value)
                    //
                } else if let respError = error {
                    print("Server Error: \(respError)")
                    value = false
                    completion(value)
                }
            }
        }
        task.resume()
    }
    
    // Commented out lecture code
    /*
    func getAll() {
        //var personList = [Person]()
        print("About to send HTTP request to server")
        let requestUrl = "http://localhost:8020/PersonService/getAll"
        let request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let respData = data {
                // data is of Data type
                //et respStr = String(data: respData, encoding: .utf8)
                //print("The response data is \(respStr!)")
                self.personList = try! JSONDecoder().decode([Person].self, from: respData)
                print("The Person List : \(self.personList)")
                //
                OperationQueue.main.addOperation {
                    if self.viewController is SummaryViewController {
                        let svc = self.viewController as! SummaryViewController
                        svc.refreshScreen1()
                    } else {
                        self.viewController.refreshScreen(pObj: self.personList[self.currentIndx])
                    }

                }
            }
        }
        task.resume()
    }
 */
}
