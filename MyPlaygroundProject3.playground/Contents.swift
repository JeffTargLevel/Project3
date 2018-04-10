

import Foundation


//=========================
// MARK/ - Parameters
//=========================

// Create class Character


class Character {
    var name: String
    var description: String
    var lifePoints: Int
    var weapon: Weapon
    var isLife: Bool {
        return lifePoints >= 0
    }
    var isDead: Bool {
        return lifePoints <= 0
    }
    
    init(name: String, description: String, lifePoints: Int, weapon: Weapon) {
        self.name = name
        self.description = description
        self.lifePoints = lifePoints
        self.weapon = weapon
    }
}

// Create class Fighter who inherits class Character

class Fighter: Character {
    
    init(name: String) {
        let sword = Sword()
        super.init(name: name, description: "Combattant", lifePoints: 100, weapon: sword)
    }
}

// Create class Magus who inherits class Character

class Magus: Character {
    
    init(name: String) {
        let mageBaton = MageBaton()
        super.init(name: name, description: "Mage", lifePoints: 50, weapon: mageBaton)
    }
}

// Create class Colossus who inherits class Character

class Colossus: Character {
    
    init(name: String) {
        let fists = Fists()
        super.init(name: name, description: "Colosse", lifePoints: 150, weapon: fists)
    }
}

// Create class Dwarf who inherits class Character

class Dwarf: Character {
    
    init(name: String) {
        let axe = Axe()
        super.init(name: name, description: "Nain", lifePoints: 70, weapon: axe)
    }
}

// Create class Boss who inherits class Character

class Boss: Character {
    
    init() {
        let lucille = Lucille()
        super.init(name: "Negan", description: "Boss", lifePoints: 200, weapon: lucille)
    }
}

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

// Create class Team

class Team {
    var name: String
    var characters = [Character]()
    
    init(name: String) {
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
        print("Sélectionne ton personnage :"
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
        print("Entre son nom :")
        if let name = readLine() {
            return Fighter(name: name)
        } else {
            return nil
        }
    }
    
    private func addMagus() -> Magus? {
        print("Entre son nom :")
        if let name = readLine() {
            return Magus(name: name)
        } else {
            return nil
        }
    }
    
    private func addColossus() -> Colossus? {
        print("Entre son nom :")
        if let name = readLine() {
            return Colossus(name: name)
        } else {
            return nil
        }
    }
    
    private func addDwarf() -> Dwarf? {
        print("Entre son nom :")
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
    var rounds = [Round]()
    
    init() {
        print("Bienvenue au tournoi des guerriers de Namek !")
        let team1 = Team.addTeam()!
        let team2 = Team.addTeam()!
        let teamBoss = Team(name: "Boss")
        teamBoss.characters.append(Boss())
        self.teams = [team1, team2, teamBoss]
        
    }
    
    func startGame() {
        let round = rounds[0]
        rounds.append(round)
        round.teams = teams
        round.startRound()
        gameRound()
    }
    
    func gameRound() {
          
        for characters in teams[0].characters {
            
            while characters.isLife {
                startGame()
            }
            if characters.isDead {
                print("L'équipe \(teams[1].name) a gagné !")
                print("Affrontez le Boss !")
                teamThatWillFightTheBoss(teamWinner: 1)
            }
        }
        
        for characters in teams[1].characters {
            
            while characters.isLife {
                startGame()
            }
            if characters.isDead {
                print("L'équipe \(teams[0].name) a gagné !")
                print("Affrontez le Boss !")
                teamThatWillFightTheBoss(teamWinner: 0)
                
            }
        }
    }
    
    func teamThatWillFightTheBoss(teamWinner: Int) {
        let roundBoss = rounds[1]
        rounds.append(roundBoss)
        roundBoss.teams = teams
        
        roundBoss.startRoundBoss(for: teamWinner)
        
        for characters in teams[teamWinner].characters {
            while characters.isLife {
                roundBoss.startRoundBoss(for: teamWinner)
                
            }
            
            if characters.isDead {
                print("Le boss t'a vaincu !")
                print("Tu t'es bien battu !")
                
            } else if teams[2].characters[0].isDead {
                print("Félicitations tu as remporté la coupe des champions !!")
            }
        }
    }
}

// Create Round class

class Round {
    var teams = [Team]()
    
   func startRound() {
        fight(betweenTeam: 0, andTeam: 1)
        fight(betweenTeam: 1, andTeam: 0)
    }
    
    func fight(betweenTeam index: Int, andTeam opposingIndex: Int) {
        for status in teams[index].characters {
            print("Statut de l'équipe \(status.name) qui est un \(status.description) avec \(status.lifePoints) points de vie. Son action génére \(status.weapon.points) points de vie.")
            
        }
        
        var character1 = selectCharacter(teamIndex: index, isAttacking: false, isTreated: false)
        
// If for the fight against the Boss who target a random character
        
        if index == 2 { // Index of Boss
            character1 = teams[2].characters[0]
            
            let charactersArray = [teams[opposingIndex].characters[0], teams[opposingIndex].characters[1], teams[opposingIndex].characters[2]]
            
            let randomCharacterIndex = Int(arc4random_uniform(UInt32(charactersArray.count)))
            print(charactersArray[randomCharacterIndex])
            
            let characterRandom = charactersArray[randomCharacterIndex]
            
            selectTarget(with: character1!, target: characterRandom)
        }
        
        for status in teams[opposingIndex].characters {
            print("Statut de l'équipe \(status.name) qui est un \(status.description) avec \(status.lifePoints) points de vie. Son action génére \(status.weapon.points) points de vie.")
            
        }
        
        var character2 = selectCharacter(teamIndex: opposingIndex, isAttacking: true, isTreated: false)
        
        if character1?.description == "Mage" {
            character2 = selectCharacter(teamIndex: index, isAttacking: false, isTreated: true)
        }
        
        if opposingIndex == 2 { // Index of Boss
            character2 = teams[2].characters[0]
        }
        
        selectTarget(with: character1!, target: character2!)
        
    }
    
    func startRoundBoss(for teamWinner: Int) {
        fight(betweenTeam: teamWinner, andTeam: 2)
        fight(betweenTeam: 2, andTeam: teamWinner)
        
    }
    
    func selectCharacter(teamIndex: Int, isAttacking: Bool, isTreated: Bool) -> Character? {
        var message = ""
        
        if isAttacking {
            message = "Sélectionne le personnage que tu veux attaquer :"
            
        } else if isTreated {
            message = "Sélectionne le personnage que tu veux soigner :"
            
        } else {
            message = "Sélectionne ton personnage"
        }
        
        print(message
        + "\n1. \(teams[teamIndex].characters[0].name)"
        + "\n2. \(teams[teamIndex].characters[1].name)"
        + "\n3. \(teams[teamIndex].characters[2].name)")
        
        if let choiceCharacterTeam = readLine() {
            
            var character: Character!
            switch choiceCharacterTeam {
            case "1":
                character = teams[teamIndex].characters[0]
            case "2":
                character = teams[teamIndex].characters[1]
            case "3":
                character = teams[teamIndex].characters[2]
            default:
                print("Personnage non valide !")
            }
        return character
            
        } else {
            return nil
    }
}
    
    func selectTarget(with character: Character, target opposingCharacter: Character) {
        opposingCharacter.lifePoints += character.weapon.points
        
// Random weapon
        
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












































































































