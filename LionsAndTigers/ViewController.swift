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
    var lions:[Lion] = []
    var lionCubs:[LionCub] = []
    
    
    var currentIndex = 0
    var currentAnimal = (specise:"Tiger", index: 0)
    
    
    
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
        
        var lion = Lion()
        lion.age = 4
        lion.name = "Mufasa"
        lion.subspecies = "West Africa"
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.changeAlphaMale()
        lion.roar()
        
        
        var lioness = Lion()
        lioness.age = 3
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.roar()
        
        self.lions += [lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masia"
        lionCub.isMale = true
        
        println("lionCub should roar after this line:")
        lionCub.roar()
        lionCub.rubLionCub()
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Travelra"
        femaleLionCub.isMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]
        
        
        
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func updateAnimal(){
        
        switch currentAnimal{
            case ("Tiger", _):
                var randomNumber = Int(arc4random_uniform(UInt32(lions.count)))
                currentAnimal = ("Lion", randomNumber)
        case ("Lion", _):
            var randomNumber = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomNumber)
        default:
                var randomNumber = Int(arc4random_uniform(UInt32(myTigers.count)))
                currentAnimal = ("Tiger", randomNumber)
            
        }
        
    }
    
    func updateView(){
    
 
            UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                
                if self.currentAnimal.specise == "Tiger" {
                    
                    var tiger = self.myTigers[self.currentAnimal.index]
                    self.myImageView.image = tiger.image
                    self.nameLabel.text = tiger.name
                    self.breedLabel.text = tiger.breed
                    self.ageLabel.text = "\(tiger.age)"
                    self.randomFactLabel.text = tiger.randomFact()
                    self.randomFactLabel.hidden = false
                }
                else if self.currentAnimal.specise == "Lion" {
                    
                    var lion = self.lions[self.currentAnimal.index]
                    self.myImageView.image = lion.image
                    self.nameLabel.text = lion.name
                    self.breedLabel.text = lion.subspecies
                    self.ageLabel.text = "\(lion.age)"
                    self.randomFactLabel.text = lion.randomFact()
                    //self.randomFactLabel.hidden = true
                }
                else if self.currentAnimal.specise == "LionCub" {
                    var lionCub = self.lionCubs[self.currentAnimal.index]
                    self.myImageView.image = lionCub.image
                    self.nameLabel.text = lionCub.name
                    self.breedLabel.text = lionCub.subspecies
                    self.ageLabel.text = "\(lionCub.age)"
                    self.randomFactLabel.text = lionCub.randomFact()
                }
                
                }, completion: {(finished: Bool)->() in
            })
   
    }
    @IBAction func nextToolBarButtonItemPressed(sender: UIBarButtonItem) {
        
       // updateTiger()
        
        updateAnimal()
        updateView()
        
        
     }
    
    func updateTiger(){
        
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

