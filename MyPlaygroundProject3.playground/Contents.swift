

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
        
// Characters limit
        
        if characters.count > 3 {
            print("Nombre limite de personnages dépassé !")
        } else {
            print("Encore un personnage a créer")
        }
    }
}

//Create class Play

class Play {
    
    // Step 1 : choice of the player's team
    
    func myTeam(_ team: Team) {
        print("L'équipe \(team.player) entre en jeu !")
    }
    
    // Step 2 : action of player's character against opposing character
    
    func myCharacter(_ character: Character, act opposingCharacter: Character) {
        opposingCharacter.lifePoints += character.weapon.points
        
        if character.weapon.points < 0 {
        print("\(character.name) combat contre \(opposingCharacter.name) !")
        
        print("\(opposingCharacter.name) perd \(character.weapon.points) points de vie et il lui en reste \(opposingCharacter.lifePoints) !")
            
        } else {
            print("\(character.name) soigne \(opposingCharacter.name) et il remonte à \(opposingCharacter.lifePoints) de points de vie !")
        }
        
        if opposingCharacter.lifePoints <= 0 {
            print("\(opposingCharacter.name) est mort !")
            
            
        }
    }

}
    
    
    
















let leon = Team(player: "Leon")
leon.characters.append(Dwarf(name: "Gimli"))
leon.characters.append(Fighter(name: "Link"))
leon.characters.append(Magus(name: "Merlin"))
leon.characters.append(Colossus(name: "Big"))


let mathilda = Team(player: "Mathilda")
mathilda.characters.append(Magus(name: "Gandalf"))
mathilda.characters.append(Colossus(name: "Shadow"))
mathilda.characters.append(Fighter(name: "Geralt"))


Play().myTeam(leon)

Play().myCharacter(leon.characters[0], act: mathilda.characters[0])



Play().myCharacter(leon.characters[0], act: mathilda.characters[0])

Play().myCharacter(leon.characters[0], act: mathilda.characters[0])





































