//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by yousheng chang on 9/26/14.
//  Copyright (c) 2014 InfoTech Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var myImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var ageLabel: UILabel!
    
    @IBOutlet var breedLabel: UILabel!
    
    @IBOutlet var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Tiggle"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        myTiger.chuffNumberOfTimes(2)
        myTiger.chuffNumberOfTimes(2, isLoud: false)
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        
        
        
        println("myTiger's name is \(myTiger.name). myTiger's breed is \(myTiger.breed). myTiger's image is \(myTiger.image)")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tiggress"
        secondTiger.breed = "Indochinese"
        secondTiger.age = 2
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        //secondTiger.chuff()
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jecob"
        thirdTiger.breed = "Malayan"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        //thirdTiger.chuff()
        
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        //fourthTiger.chuff()
        
        myTigers += [myTiger, secondTiger, thirdTiger, fourthTiger]
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func nextToolBarButtonItemPressed(sender: UIBarButtonItem) {
        
        
        
        var randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        while randomIndex == self.currentIndex {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        }
        self.currentIndex = randomIndex
        
        var tiger = myTigers[randomIndex]
        
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.breedLabel.text = tiger.breed
            self.ageLabel.text = "\(tiger.age)"
            self.randomFactLabel.text = tiger.randomFact()
              
            }, completion: {(finished: Bool)->() in
        })
        
    }
}

