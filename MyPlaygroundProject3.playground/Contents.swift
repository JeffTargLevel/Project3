//: Playground - noun: a place where people can play

import UIKit

// Create class character


class Character {
    var name: String
    var description: String
    var lifePoints: Int
    var weapon: Weapon
    
    init(name: String, description: String, lifePoints: Int, weapon: Weapon) {
        self.name = name
        self.description = description
        self.lifePoints = lifePoints
        self.weapon = weapon
     }
    
    func action(character: Character) {
        character.lifePoints -= weapon.damages
        character.lifePoints += weapon.treat
    }
    
}

// Create class fighter who inherits class character

class Fighter: Character {

    init(name: String) {
        let sword = Sword()
        super.init(name: name, description: "Combattant", lifePoints: 100, weapon: sword)
    }
   
    
}


// Create class magus who inherits class character

class Magus: Character {
    
    init(name: String) {
        let mageBaton = MageBaton()
        super.init(name: name, description: "Mage", lifePoints: 50, weapon: mageBaton)
    }
}

// Create class colossus who inherits class character

class Colossus: Character {
    
    init(name: String) {
        let fists = Fists()
        super.init(name: name, description: "Colosse", lifePoints: 150, weapon: fists)
    }
}
// Create class dwarf who inherits class character

class Dwarf: Character {

    init(name: String) {
        let sword = Sword()
        super.init(name: name, description: "Nain", lifePoints: 70, weapon: sword)
    }
}

// Create class weapon

class Weapon {
    var damages = 0
    var treat = 0
    
    init(damage: Int, treat: Int) {
        self.damages = damage
        self.treat = treat
    }
    
}

// Create class Sword who inherits class Weapon

class Sword: Weapon {
    
    init() {
        super.init(damage: 10, treat: 0)
        
    }
    

    
}

// Create class MageBaton who inherits class Weapon

class MageBaton: Weapon {
    
    init() {
        super.init(damage: 0, treat: 10)
    }
    
}

// Create class Fists who inherits class Weapon

class Fists: Weapon {
    
    init() {
        super.init(damage: 5, treat: 0)
    }
    
}

// Create class Axe who inherits class Weapon

class Axe: Weapon {
    
    init() {
        super.init(damage: 20, treat: 0)
    }
}





