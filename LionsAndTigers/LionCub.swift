//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by yousheng chang on 9/27/14.
//  Copyright (c) 2014 InfoTech Inc. All rights reserved.
//

import Foundation

class LionCub:Lion {
    
    var isMale = false
    
    func rubLionCub(){
        println("lionCub: snuggle and happy")
    }
    
    override func roar(){
        super.roar()
        println("lionCub: broal, broal")
    }
    
    override func randomFact() -> String {
        
        var randomFact:String
        
        if isMale {
            randomFact = "Cubs are usually hidden in dense bushes for appromixes six weeks"
        }else{
            randomFact = "Cubs start to eat meat after six weeks"
        }
        return randomFact
        
    }
    
    
}
