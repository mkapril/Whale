//
//  ViewController.swift
//  WhaleProject
//
//  Created by minki han on 2016. 10. 20..
//  Copyright © 2016년 Sold Bridge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
          self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        let whalesCommon = WhalesCommon()
        let isOnline = whalesCommon.hasConnectivity() ;
        print("###Internet Connection \(isOnline)" );
        
        
        let reachability = Reachability()!
        
        if reachability.isReachable {
            if reachability.isReachableViaWiFi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        } else {
            print("Network not reachable")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func login() -> Bool {
        
        return true;
    }
    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("#### PREPARE FOR SEGUE ###") ;
        
        if segue.identifier == "LoginSegue" {
            if let destinationVC = segue.destination as? NextWebViewController {
                print("#### CALLING NEXT WEB VIEW ###") ;
                destinationVC.username = username.text!
                destinationVC.password = password.text!
                
            }
        }

    }
    

}

