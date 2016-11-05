//
//  RegisterViewController.swift
//  WhaleProject
//
//  Created by minki han on 2016. 10. 24..
//  Copyright © 2016년 Sold Bridge. All rights reserved.
//


import UIKit
import Foundation

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var userid: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var userpassword: UITextField!
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        
        var urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
         urlString = "http://52.78.198.235:8080/test/selectIFTest.do"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                let json = JSON(data: data)
                print("BEGINING OF JSON")
                print(json);
                print("BEGINING OF DATA")
                print(data)
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    // we're OK to parse!
                    parse(json: json)
                }
            }
        }
       

        //let myUrl = URL ( string: "http://localhost:8080/user/registerUser.do" );
        let myUrl = NSURL(string: "http://52.78.198.235:8080/test/selectIFTest.do");
        
        var req = URLRequest( url : (myUrl)! as URL);
        
        req.httpMethod = "POST"
        let postString = "USER_ID=\(userid.text!)&USER_NM=\(username.text!)&PASSWORD=\(userpassword.text!)"
        
        print("POST STRING WAS ####  \(postString)")
        req.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: req) { data, response, error in
            guard let data = data, error == nil else {                                                 // check forfundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            
            let sampleJson = JSON ( data: data)
            print("responseString = \(responseString!)")
            
            var dataString = "{\"result\" : [{\"cmpy_nm\":\"SK주식회사\",\"group_nm\":\"SK\",\"cre_id\":\"\",\"upd_id\":\"\",\"emplys_cnt\":5,\"cmpy_cd\":\"B0000\",\"upd_dt\":\"0002-11-30\",\"cre_dt\":\"2016-10-29\",\"cmpy_logo_img\":\"SK_logo.svg.png\",\"group_cd\":\"A0000\"},{\"cmpy_nm\":\"SK플래닛\",\"group_nm\":\"SK\",\"cre_id\":\"\",\"upd_id\":\"\",\"emplys_cnt\":1000,\"cmpy_cd\":\"B0001\",\"upd_dt\":\"0002-11-30\",\"cre_dt\":\"2016-10-29\",\"cmpy_logo_img\":\"SK_logo.svg.png\",\"group_cd\":\"A0000\"} }";
            //let data1 = Data(base64Encoded:dataString);
            dataString = responseString!;
            let data1 = dataString.data(using: .utf8)
            print("TEST DATA1JSON### \(data1)")
            
            
            let testJson = JSON( data: data1!);
            print("TEST JSON### \(testJson)")
            self.parse(json: testJson)
            
            
            
            /*
            if data = data,
              let json =try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                for case let result in json["result"] {
                    if let vo = Restaurant(son: result) {
                        vo.append(restaurant)
                        print("************** \("vo.cmpy_nn") ****************")
                        }
                    }
                }
            */
            
            /*init(data: NSData){  // ~this chunk~
                self.json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error)
            }*/
        }
        task.resume()
        
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        print("Register View Controller \(self.navigationController?.isNavigationBarHidden)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parse(json: JSON) {
        print("PARSING JSON BEGINS");
        print(json)
        for result in json["result"].arrayValue {
            let cmpy_nm = result["cmpy_nm"].stringValue
            let group_nm = result["group_nm"].stringValue
            let emplys_cnt = result["emplys_cnt"].stringValue
            //let obj = ["title": title, "body": body, "sigs": sigs]
            print("cmpy_nm \(cmpy_nm) \n group_nm \(group_nm) \n emplys_cnt \(emplys_cnt)");
            
        }
        
        
    }

    
    
}

