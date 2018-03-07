

import Foundation

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
    
    func actOn(character: Character) {
        character.lifePoints += weapon.points
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
        let axe = Axe()
        super.init(name: name, description: "Nain", lifePoints: 70, weapon: axe)
    }
}

// Create class weapon

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

// Create class Team

class Team {
    var player: String
    var characters = [Character]()
    
    init(player: String) {
        self.player = player
        
    }
}

// Create class Game

class Game {
    
    
}


let rouge = Team(player: "Leon")
rouge.characters.append(Dwarf(name: "Naim"))

let bleu = Team(player: "Mathilda")
bleu.characters.append(Magus(name: "Gandalf"))

rouge.characters[0].actOn(character: bleu.characters[0])

print(rouge.characters[0].lifePoints)
print(bleu.characters[0].lifePoints)

bleu.characters[0].actOn(character: rouge.characters[0])

print(rouge.characters[0].lifePoints)






















