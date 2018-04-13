//
//  Round.swift
//  ProjectJeuVideo
//
//  Created by Jean François Santolaria on 13/04/2018.
//

import Foundation

// Create Round class

class Round {
    var teams = [Team]()
    
    func startRound() {
        fight(betweenTeam: 0, andTeam: 1)
        fight(betweenTeam: 1, andTeam: 0)
    }
    
    func fight(betweenTeam index: Int, andTeam opposingIndex: Int) {
        for status in teams[index].characters {
            print("Statut du personnage \(status.name) qui est un \(status.description) avec \(status.lifePoints) points de vie. Son action génére \(status.weapon.points) points de vie.")
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
            print("Statut du personnage \(status.name) qui est un \(status.description) avec \(status.lifePoints) points de vie. Son action génére \(status.weapon.points) points de vie.")
            
        }
        if opposingIndex == 2 { // Index of Boss
            let characterBoss = teams[2].characters[0]
            selectTarget(with: character1!, target: characterBoss)
        }
        
        
        if character1?.description == "Mage" {
            let characterMagus = selectCharacter(teamIndex: index, isAttacking: false, isTreated: true)
            selectTarget(with: character1!, target: characterMagus!)
            
        } else {
            let character2 = selectCharacter(teamIndex: opposingIndex, isAttacking: true, isTreated: false)
            selectTarget(with: character1!, target: character2!)
        }
        
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
        for numberOfCharacters in 0..<teams[teamIndex].characters.count {
            
            print(message
                + "\n \(numberOfCharacters + 1). \(teams[teamIndex].characters[0 + numberOfCharacters].name)")
        }
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
