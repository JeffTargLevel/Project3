//
//  Weapon.swift
//  ProjectJeuVideo
//
//  Created by Jean François Santolaria on 13/04/2018.
//

import Foundation

// Create class Weapon

class Weapon {
    var points = 0
    
    init(points: Int) {
        self.points = points
        
    }
}

// Create class Sword who inherits class Weapon

class Sword: Weapon {
    
    init() {
        super.init(points: -10)
        
    }
}

// Create class MageBaton who inherits class Weapon

class MageBaton: Weapon {
    
    init() {
        super.init(points: 10)
    }
}

// Create class Fists who inherits class Weapon

class Fists: Weapon {
    
    init() {
        super.init(points: -5)
    }
}

// Create class Axe who inherits class Weapon

class Axe: Weapon {
    
    init() {
        super.init(points: -20)
    }
}

// Create class Lucille, weapon of Boss who inherits class Weapon

class Lucille: Weapon {
    
    init() {
        super.init(points: -30)
    }
}

