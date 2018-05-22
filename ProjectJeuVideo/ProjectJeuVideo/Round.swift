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
        fight(withTeam: 0, againstTeam: 1)
        
        if teams[1].isAlive {
        fight(withTeam: 1, againstTeam: 0)
        }
    }
    
    private func fight(withTeam index: Int, againstTeam opposingIndex: Int) {
        var character1 = selectCharacter(teamIndex: index, isAttacking: false, isTreated: false)
        while character1!.isDead {
            print("\n⚠️ Personnage mort 💀! Choissisez un personnage vivant !")
            character1 = selectCharacter(teamIndex: index, isAttacking: false, isTreated: false)
        }
        
        if character1 is Magus {
            var characterToTreat = selectCharacter(teamIndex: index, isAttacking: false, isTreated: true)
            while characterToTreat!.isDead {
                print("\n⚠️ Personnage mort 💀! Choisissez un personnage vivant à soigner 💉")
                characterToTreat = selectCharacter(teamIndex: index, isAttacking: false, isTreated: true)
            }
            attackOrTreat(with: character1!, target: characterToTreat!)
        } else if opposingIndex != 2 {
            var character2 = selectCharacter(teamIndex: opposingIndex, isAttacking: true, isTreated: false)
            while character2!.isDead {
                print("\n⚠️ Personnage mort 💀! Choissisez un personnage vivant à attaquer 💪")
                character2 = selectCharacter(teamIndex: opposingIndex, isAttacking: true, isTreated: false)
            }
            attackOrTreat(with: character1!, target: character2!)
        } else {
            let characterBoss = teams[2].characters[0]
            attackOrTreat(with: character1!, target: characterBoss)
        }
    }
    
    func startRoundBoss(for teamWinner: Int) {
        fight(withTeam: teamWinner, againstTeam: 2)
        
        if teams[2].isAlive {
        bossAttack(withTeamBoss: 2, againstTeam: teamWinner)
        }
    }
    
    func bossAttack(withTeamBoss index: Int, againstTeam opposingIndex: Int) {
        
        // For the fight against the Boss who target a random character
        
        let boss = teams[index].characters[0]
        
        let charactersArray = [teams[opposingIndex].characters[0], teams[opposingIndex].characters[1], teams[opposingIndex].characters[2]]
        
        let randomCharacterIndex = Int(arc4random_uniform(UInt32(charactersArray.count)))
       
        let characterRandom = charactersArray[randomCharacterIndex]
        
        if characterRandom.isDead {
            print("\n❌ Le Boss a raté sa cible ❌")
        } else {
        attackOrTreat(with: boss, target: characterRandom)
        }
    }
    
    private func selectCharacter(teamIndex: Int, isAttacking: Bool, isTreated: Bool) -> Character? {
        var message = ""
        
        if isAttacking {
            message = "\n➡️ Sélectionne le personnage que tu veux attaquer ⚔️ "
        } else if isTreated {
            message = "\n➡️ Sélectionne le personnage que tu veux soigner 💉 "
        } else {
            message = "\n➡️ Sélectionne ton personnage 😎"
        }
        
        print(message)
        for character in 0..<teams[teamIndex].characters.count {
            
            if teams[teamIndex].characters[character].isAlive {
                print("\n🚩 \(character + 1). \(teams[teamIndex].characters[character].name) : \(teams[teamIndex].characters[character].description) qui a \(teams[teamIndex].characters[character].lifePoints) points de vie ❤️")
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
            print("\n🎰 Le coffre s'ouvre : \(weapon[randomIndexWeapon].name) pour \(character.name) ‼️")
            character.weapon.points = weapon[randomIndexWeapon].points
            opposingCharacter.lifePoints += character.weapon.points
        } else {
            opposingCharacter.lifePoints += character.weapon.points
        }
        
        if character.weapon.points < 0 {
            print("\n➡️ \(character.name) combat contre ⚔️ \(opposingCharacter.name) ⚔️ ")
            print("\n⚠️ \(opposingCharacter.name) perd 💔 \(character.weapon.points) 💔 points de vie et il lui en reste \(opposingCharacter.lifePoints) !")
        } else {
            print("\n➡️ \(character.name) soigne 🏥 \(opposingCharacter.name) 🏥 et il remonte à \(opposingCharacter.lifePoints) de points de vie !")
        }
        
        if opposingCharacter.isDead {
            print("\n➡️ \(opposingCharacter.name) est mort 💀")
        }
    }
}





