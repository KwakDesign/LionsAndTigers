//
//  LionCubs.swift
//  LionsAndTigers
//
//  Created by ABRAHAM KWAK on 3/31/15.
//  Copyright (c) 2015 Abraham Kwak. All rights reserved.
//

import Foundation

class LionCub: Lion {
    func rubBelly() {
        println("\(self.name): Rub my belly!")
    }
    
    override func roar() {
        
        super.roar()
        println("\(self.name): Growl Growl")
    }
    
}