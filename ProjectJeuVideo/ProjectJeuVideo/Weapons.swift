//
//  Weapon.swift
//  ProjectJeuVideo
//
//  Created by Jean François Santolaria on 13/04/2018.
//

import Foundation

// Create class Weapon

class Weapon {
    let name: String
    var points: Int
    
    init(name: String, points: Int) {
        self.name = name
        self.points = points
        
    }
}

// Create class Sword who inherits class Weapon

class Sword: Weapon {
    
    init() {
        super.init(name: "Epée 🗡", points: -30)
        
    }
}

// Create class MageBaton who inherits class Weapon

class MageBaton: Weapon {
    
    init() {
        super.init(name: "Baton ☄️", points: 10)
    }
}

// Create class Fists who inherits class Weapon

class Fists: Weapon {
    
    init() {
        super.init(name: "Poings 👊", points: -15)
    }
}

// Create class Axe who inherits class Weapon

class Axe: Weapon {
    
    init() {
        super.init(name: "Hache ⛏", points: -60)
    }
}

// Create class Lucille, weapon of Boss who inherits class Weapon

class Lucille: Weapon {
    
    init() {
        super.init(name: "Lucille 💥", points: -60)
    }
}

