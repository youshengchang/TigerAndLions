//
//  Lion.swift
//  LionsAndTigers
//
//  Created by yousheng chang on 9/27/14.
//  Copyright (c) 2014 InfoTech Inc. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var name = ""
    var subspecies = ""
    var isAlphaMale = false
    var image = UIImage(named: "")
    
    func roar(){
        println("Lion: roar, roar")
    }
    
    func changeAlphaMale(){
        isAlphaMale = true
    }
    
    func randomFact() -> String {
        var randomFact = ""
        if isAlphaMale {
            randomFact = "Male lions are easy to recognize thanks to their distinguish manes. Males with darker manes are more likely attracting the female."
        }else{
            randomFact = "Female lioneese are the stable social uint and not tolerate the outside females"
        }
        return randomFact
        
    }
    
}
