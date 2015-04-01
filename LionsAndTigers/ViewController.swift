//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by ABRAHAM KWAK on 3/8/15.
//  Copyright (c) 2015 Abraham Kwak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var lions:[Lion] = []
    var lionCubs:[LionCub] = []
    
    var currentIndex = 0
    
    var currentAnimal = (species: "Tiger", index: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.chuff()
        myTiger.chuffNumberOfTimes(0, isLoud: false)
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        
        self.myTigers.append(myTiger)
        
        println("The name of my tiger is \(myTiger.name), it's breed is a \(myTiger.breed), it's age is \(myTiger.age), here's how he looks \(myTiger.image)")
        
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 7
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        secondTiger.chuffNumberOfTimes(3, isLoud: false)
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 5
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 12
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        println("\(myTigers)")
        
        var lion = Lion()
        lion.age = 4
        lion.name = "Mufasa"
        lion.image = UIImage(named: "Lion.jpg")
        lion.subspecies = "West African"
        lion.isAlphaMale = false
        
        var lioness = Lion()
        lioness.age = 3
        lioness.name = "Sarabi"
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.subspecies = "Barbary"
        lioness.isAlphaMale = false
        
        lion.roar()
        lioness.roar()
        
        lion.changeToAlpha()
//        print(lion.isAlphaMale)
        
        self.lions += [lion, lioness]
        
        var cub = LionCub()
        cub.age = 1
        cub.name = "Simba"
        cub.image = UIImage(named: "LionCub1.jpg")
        cub.subspecies = "Masai"
        
        cub.roar()
        cub.rubBelly()
        
        var femaleCub = LionCub()
        femaleCub.age = 1
        femaleCub.name = "Nala"
        femaleCub.image = UIImage(named: "LionCub2.jpeg")
        femaleCub.subspecies = "Transvaal"
        femaleCub.isAlphaMale = false
        
        self.lionCubs += [cub, femaleCub]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
    }
    
    func updateAnimal() {
        switch currentAnimal {
        case("Tiger", _) :
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        default :
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateView() {
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLabel.text = tiger.randomFact()
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLabel.text = lion.randomFact()
            }
            
             self.randomFactLabel.hidden = false
            
            }, completion: {
                (finished: Bool) -> () in
        })
    }

}

