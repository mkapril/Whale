//
//  ViewController.swift
//  WhaleProject
//
//  Created by minki han on 2016. 10. 20..
//  Copyright © 2016년 Sold Bridge. All rights reserved.
//

import UIKit

class NextWebViewController: UIViewController {
    
    var username = "";
    var password = "";
    
    @IBOutlet weak var RegWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // 로그인 ID, PW
        
        print("LOGIN ID IS \(username) AND PASSWORD IS \(password)")
        
        // 인터넷 커넥션 없을 때 처리 추가
        
        let myUrl = URL ( string: "http://52.78.198.235:8080/sample/openSampleBoardList.do" );
        let req = URLRequest( url : (myUrl)! as URL);
        
        RegWebView.loadRequest(req);
        
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

