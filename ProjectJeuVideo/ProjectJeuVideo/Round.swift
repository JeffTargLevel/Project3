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
    
    private func fight(betweenTeam index: Int, andTeam opposingIndex: Int) {
        
        let character1 = selectCharacter(teamIndex: index, isAttacking: false, isTreated: false)
        
        if character1 is Magus {
            let characterToTreat = selectCharacter(teamIndex: index, isAttacking: false, isTreated: true)
            attackOrTreat(with: character1!, target: characterToTreat!)
            while characterToTreat!.isDead {
                print("Personnage mort ! Choisissez un personnage vivant à soigner !")
                attackOrTreat(with: character1!, target: characterToTreat!)
            }
        } else {
            let character2 = selectCharacter(teamIndex: opposingIndex, isAttacking: true, isTreated: false)
            attackOrTreat(with: character1!, target: character2!)
            while character2!.isDead {
                print("Personnage mort ! Choissisez un personnage vivant à attaquer !")
                attackOrTreat(with: character1!, target: character2!)
            }
        }
    }
    
    func startRoundBoss(for teamWinner: Int) {
        fight(betweenTeam: teamWinner, andTeam: 2)
        fightTheBoss(betweenTeamBoss: 2, andTeam: teamWinner)
    }
    
    func fightTheBoss(betweenTeamBoss index: Int, andTeam opposingIndex: Int) {
        
        // For the fight against the Boss who target a random character
        
        let boss = teams[index].characters[0]
        
        let charactersArray = [teams[opposingIndex].characters[0], teams[opposingIndex].characters[1], teams[opposingIndex].characters[2]]
        
        let randomCharacterIndex = Int(arc4random_uniform(UInt32(charactersArray.count)))
        print(charactersArray[randomCharacterIndex])
        
        let characterRandom = charactersArray[randomCharacterIndex]
        
        if characterRandom.isDead {
            print("Le Boss a raté sa cible !")
        }
        attackOrTreat(with: boss, target: characterRandom)
    }
    
    private func selectCharacter(teamIndex: Int, isAttacking: Bool, isTreated: Bool) -> Character? {
        var message = ""
        
        if isAttacking {
            message = "Sélectionne le personnage que tu veux attaquer :"
        } else if isTreated {
            message = "Sélectionne le personnage que tu veux soigner :"
        } else {
            message = "Sélectionne ton personnage"
        }
        
        print(message)
        for character in 0..<teams[teamIndex].characters.count {
            
            if teams[teamIndex].characters[character].isLife {
                print("\n \(character + 1). \(teams[teamIndex].characters[character].name) : \(teams[teamIndex].characters[character].description) qui a \(teams[teamIndex].characters[character].lifePoints) points de vie.")
            }
        }
        
        let choiceCharacter = Display.readNumber(valueMax: 3)
        switch choiceCharacter {
        case 1:
            return teams[teamIndex].characters[0]
        case 2:
            return teams[teamIndex].characters[1]
        case 3:
            return teams[teamIndex].characters[2]
        default:
            return nil
        }
    }
    
    private func attackOrTreat(with character: Character, target opposingCharacter: Character) {
        
        // Random weapon
        
        if !(character is Magus) && !(character is Boss) {
            let weapon = [Sword(), Fists(), Axe()]
            let randomIndexWeapon = Int(arc4random_uniform(UInt32(weapon.count)))
            print(weapon[randomIndexWeapon])
            character.weapon.points = weapon[randomIndexWeapon].points
            opposingCharacter.lifePoints += character.weapon.points
        } else {
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



