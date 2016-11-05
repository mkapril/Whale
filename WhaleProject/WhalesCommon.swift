//
//  WhalesCommon.swift
//  WhaleProject
//
//  Created by minki han on 2016. 10. 25..
//  Copyright © 2016년 Sold Bridge. All rights reserved.
//
//
//  Common.swift
//  WhaleProject
//
//  Created by minki han on 2016. 10. 25..
//  Copyright © 2016년 Sold Bridge. All rights reserved.
//

import Foundation

public class WhalesCommon  {
   
    
    func hasConnectivity() -> Bool {
        do {
            let reachability: Reachability =  try Reachability.init()!
            let networkStatus: Int = reachability.currentReachabilityStatus.hashValue
            
            return (networkStatus != 0)
        }
        catch {
            // Handle error however you please
            return false
        }
    }
}
