

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
    var player: String
    var characters = [Character]()
    
    
    init(player: String) {
        self.player = player
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
            print("Nombre limite de personnages dépassé pour l'équipe \(team.player) !")
            
        } else if team.characters.count < 3 {
            print("Encore un personnage à créer")
        }
    }
    
    // Display status of opposing characters
    
    func statusOf(opposing team: Team) {
        
        for status in team.characters {
            print("Status de l'adeversaire \(status.name) qui est un \(status.description) avec \(status.lifePoints) points de vie. Son action génére \(status.weapon.points) points de vie. ")
        }
    }
    
    
    // Step 2 : action of player's character against opposing character
    
    func myCharacter(_ character: Character, actOn opposingCharacter: Character) {
        opposingCharacter.lifePoints += character.weapon.points
        
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




let leon = Team(player: "Leon")
leon.characters.append(Dwarf(name: "Gimli"))
leon.characters.append(Fighter(name: "Link"))
leon.characters.append(Magus(name: "Merlin"))


let mathilda = Team(player: "Mathilda")
mathilda.characters.append(Magus(name: "Gandalf"))
mathilda.characters.append(Colossus(name: "Shadow"))
mathilda.characters.append(Fighter(name: "Geralt"))


let game = Game()

game.teams.append(leon)
game.teams.append(mathilda)





//========================
//MARK: - Conversation
//========================

class Display {
    
    func choiceTeam() {
        print("Sélectionne ton équipe"
            + "\n1. \(leon.player)"
            + "\n2. \(mathilda.player)")
        
        if let choice = readLine() {
            switch choice {
            case "1": // Equipe Leon
                game.myTeam(game.teams[0])
                game.statusOf(opposing: game.teams[1])
                choiceCharactersLeon()
            case "2": // Equipe Mathilda
                game.myTeam(game.teams[1])
                game.statusOf(opposing: game.teams[0])
                choiceCharactersMathilda()
            default:
                print("Equipe non valide")
            }
        }
    }
    
    func choiceCharactersLeon() {
        print("Sélectionne ton personnage"
            + "\n1. \(leon.characters[0].name) qui est un \(leon.characters[0].description)"
            + "\n2. \(leon.characters[1].name) qui est un \(leon.characters[1].description)"
            + "\n3. \(leon.characters[2].name) qui est un \(leon.characters[2].description)")
        
        if let choice = readLine() {
            switch choice {
            case "1": // Nain
                choiceCharacterDwarfLeon()
            case "2": // Combattant
                choiceCharacterFighterLeon()
            case "3": // Mage
                choiceCharacterMagusLeon()
            default:
                print("Personnage non valide")
            }
        }
    }
    
    func choiceCharacterDwarfLeon() {
        print("Selectionne le personnage que tu veux combattre"
            + "\n1. \(mathilda.characters[0].name)"
            + "\n2. \(mathilda.characters[1].name)"
            + "\n3. \(mathilda.characters[2].name)")
        
        // Player's response
        
        if let choice = readLine() {
            switch choice {
            case "1": // Nain contre mage
                game.myCharacter(game.teams[0].characters[0], actOn: game.teams[1].characters[0])
                
            case "2": // Nain contre colosse
                game.myCharacter(game.teams[0].characters[0], actOn: game.teams[1].characters[1])
                
            case "3": // Nain contre Combattant
                game.myCharacter(game.teams[0].characters[0], actOn: game.teams[1].characters[2])
                
            default:
                print("Personnage non valide")
            }
        }
    }
    
    func choiceCharacterFighterLeon() {
        print("Selectionne le personnage que tu veux combattre"
            + "\n1. \(mathilda.characters[0].name)"
            + "\n2. \(mathilda.characters[1].name)"
            + "\n3. \(mathilda.characters[2].name)")
        
        // Player's response
        
        if let choice = readLine() {
            switch choice {
            case "1": // Combattant contre mage
                game.myCharacter(game.teams[0].characters[1], actOn: game.teams[1].characters[0])
                
            case "2": // Combattant contre colosse
                game.myCharacter(game.teams[0].characters[1], actOn: game.teams[1].characters[1])
                
            case "3": // Combattant contre Combattant
                game.myCharacter(game.teams[0].characters[1], actOn: game.teams[1].characters[2])
                
            default:
                print("Personnage non valide")
            }
        }
    }
    
    func choiceCharacterMagusLeon() {
        print("Selectionne le personnage que tu veux soigner"
            + "\n1. \(leon.characters[0].name) qui a \(leon.characters[0].lifePoints) de points de vie"
            + "\n2. \(leon.characters[1].name) qui a \(leon.characters[1].lifePoints) de points de vie")
        
        
        // Player's response
        
        if let choice = readLine() {
            switch choice {
            case "1": // Mage soigne nain
                game.myCharacter(game.teams[0].characters[2], actOn: game.teams[0].characters[0])
                
            case "2": // Mage soigne combattant
                game.myCharacter(game.teams[0].characters[2], actOn: game.teams[0].characters[1])
                
            default:
                print("Personnage non valide")
            }
        }
    }
    
    func choiceCharactersMathilda() {
        print("Sélectionne ton personnage"
            + "\n1. \(mathilda.characters[0].name) qui est un \(mathilda.characters[0].description)"
            + "\n2. \(mathilda.characters[1].name) qui est un \(mathilda.characters[1].description)"
            + "\n3. \(mathilda.characters[2].name) qui est un \(mathilda.characters[2].description)")
        
        if let choice = readLine() {
            switch choice {
            case "1": // Mage
                choiceCharacterMagusMathilda()
            case "2": // Colosse
                choiceCharacterColossusMathilda()
            case "3": // Combattant
                choiceCharacterFighterMathilda()
            default:
                print("Personnage non valide")
            }
        }
    }
    
    func choiceCharacterMagusMathilda() {
        print("Selectionne le personnage que tu veux soigner"
            + "\n1. \(mathilda.characters[1].name) qui a \(mathilda.characters[1].lifePoints) points de vie"
            + "\n2. \(mathilda.characters[2].name) qui a \(mathilda.characters[2].lifePoints) points de vie")
        
        // Player's response
        
        if let choice = readLine() {
            switch choice {
            case "1": // Mage soigne colosse
                game.myCharacter(game.teams[1].characters[0], actOn: game.teams[1].characters[1])
                
            case "2": // Mage soigne combattant
                game.myCharacter(game.teams[1].characters[0], actOn: game.teams[1].characters[2])
                
            default:
                print("Personnage non valide")
            }
        }
    }
    
    func choiceCharacterColossusMathilda() {
        print("Selectionne le personnage que tu veux combattre"
            + "\n1. \(leon.characters[0].name)"
            + "\n2. \(leon.characters[1].name)"
            + "\n3. \(leon.characters[2].name)")
        
        // Player's response
        
        if let choice = readLine() {
            switch choice {
            case "1": // Colosse contre nain
                game.myCharacter(game.teams[1].characters[1], actOn: game.teams[0].characters[0])
                
            case "2": // Colosse contre combattant
                game.myCharacter(game.teams[1].characters[1], actOn: game.teams[0].characters[1])
                
            case "3": // Colosse contre mage
                game.myCharacter(game.teams[1].characters[1], actOn: game.teams[0].characters[2])
                
            default:
                print("Personnage non valide")
            }
        }
    }
    
    func choiceCharacterFighterMathilda() {
        print("Selectionne le personnage que tu veux combattre"
            + "\n1. \(leon.characters[0].name)"
            + "\n2. \(leon.characters[1].name)"
            + "\n3. \(leon.characters[2].name)")
        
        // Player's response
        
        if let choice = readLine() {
            switch choice {
            case "1": // Combattant contre nain
                game.myCharacter(game.teams[1].characters[2], actOn: game.teams[0].characters[0])
                
            case "2": // Combattant contre combattant
                game.myCharacter(game.teams[1].characters[2], actOn: game.teams[0].characters[1])
                
            case "3": // Combattant contre mage
                game.myCharacter(game.teams[1].characters[2], actOn: game.teams[0].characters[2])
                
            default:
                print("Personnage non valide")
            }
        }
    }
}

while true {
 Display().choiceTeam()
 }


















































































































