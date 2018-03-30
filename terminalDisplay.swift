

import Foundation


//=========================
// MARK/ - Parameters
//=========================

// Create class character


class Character {
    var name: String
    var description: String
    var lifePoints: Int
    var weapon: Weapon
    var isDead: Bool {
        return lifePoints <= 0
    }
    
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
    var name: String
    var characters = [Character]()
    
    private init(name: String) {
        self.name = name
    }
    
    static func addTeam() -> Team? {
        print("Entre le nom de ton équipe")
        if let name = readLine() {
            let teamWithCharacters = Team(name: name)
            teamWithCharacters.createThreeCharacters()
            return teamWithCharacters
        } else {
            return nil
        }
    }
    
    private func createCharacters() {
        print("Sélectionne ton personnage et son nom"
            + "\n1. Combattant"
            + "\n2. Mage"
            + "\n3. Colosse"
            + "\n4. Nain")
        
        if let choiceCharacter = readLine() {
            
            var character: Character!
            
            switch choiceCharacter {
            case "1":
                character = addFighter()
            case "2":
                character = addMagus()
            case "3":
                character = addColossus()
            case "4":
                character = addDwarf()
            default:
                print("Personnage non valide")
            }
            characters.append(character)
            
        }
    }
    
    private func createThreeCharacters() {
        while characters.count != 3 {
            createCharacters()
        }
    }
    
    private func addFighter() -> Fighter? {
        if let name = readLine() {
            return Fighter(name: name)
        } else {
            return nil
        }
    }
    
    private func addMagus() -> Magus? {
        if let name = readLine() {
            return Magus(name: name)
        } else {
            return nil
        }
    }
    
    private func addColossus() -> Colossus? {
        if let name = readLine() {
            return Colossus(name: name)
        } else {
            return nil
        }
    }
    
    private func addDwarf() -> Dwarf? {
        if let name = readLine() {
            return Dwarf(name: name)
        } else {
            return nil
        }
    }
}


//======================
//MARK: - Activities
//======================

//Create class Game

class Game {
    var teams = [Team]()
    
    // Step 1 : choice of the player's team and opposing team
    
    func myTeam(_ team: Team) {
        
        // Display characters limit
        
        if team.characters.count > 3 {
            print("Nombre limite de personnages dépassé pour l'équipe \(team.name) !")
            
        } else if team.characters.count < 3 {
            print("Encore un personnage à créer")
        }
    }
    
    // Display status of opposing characters
    
    func statusOf(opposing team: Team) {
        
        for status in team.characters {
            print("Statut de l'adversaire \(status.name) qui est un \(status.description) avec \(status.lifePoints) points de vie. Son action génére \(status.weapon.points) points de vie. ")
        }
    }
    
    // Step 2 : action of player's character against opposing character with random weapon
    
    func myCharacter(_ character: Character, actOn opposingCharacter: Character) {
        opposingCharacter.lifePoints += character.weapon.points
        
        if character.description != "Mage" {
            let weapon = [Sword(), Fists(), Axe()]
            let randomIndexWeapon = Int(arc4random_uniform(UInt32(weapon.count)))
            print(weapon[randomIndexWeapon])
            character.weapon.points = weapon[randomIndexWeapon].points
            opposingCharacter.lifePoints += character.weapon.points
        }
        
        if character.weapon.points < 0 {
            print("\(character.name) combat contre \(opposingCharacter.name) !")
            
            print("\(opposingCharacter.name) perd \(character.weapon.points) points de vie et il lui en reste \(opposingCharacter.lifePoints) !")
            
        } else {
            print("\(character.name) soigne \(opposingCharacter.name) et il remonte à \(opposingCharacter.lifePoints) de points de vie !")
        }
        
        if opposingCharacter.isDead {
            print("\(opposingCharacter.name) est mort !")
            
            
        }
    }
}






//========================
//MARK: - Conversation
//========================














































































































