//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by yousheng chang on 9/26/14.
//  Copyright (c) 2014 InfoTech Inc. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {

    var name = ""
    var age = 0
    var breed = ""
    var image = UIImage(named:"")
    
    func chuff(){
        println("Tiger chuff chuff")
    }
    
    func chuffNumberOfTimes(numberOfTimes:Int){
        for var i = 0; i < numberOfTimes; ++i {
            self.chuff()
            
        }
    }
    
    func chuffNumberOfTimes(numberOfTimes: Int, isLoud:Bool){
        
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            
            if isLoud {
                chuff()
            }else{
                println("purr, purr")
            }
            
        }
    }
    
    func ageInTigerYearsFromAge(age: Int) -> Int{
        let ageInTigerYears = age * 3
        return ageInTigerYears
    }
    
    func randomFact() ->String {
        
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact=""
        switch randomNumber {
        case 0:
            randomFact = "Tiger is the biggest spiece in the cat family"
        case 1:
            randomFact = "Tigers can reach a length of 3.3 meters"
        case 2:
            randomFact = "a group of Tigers is known as 'ambush' or 'streak'"
        default:
            randomFact = "a group of Tigers is known as 'ambush' or 'streak'"
            
        }
        return randomFact
        
    }
    
}
