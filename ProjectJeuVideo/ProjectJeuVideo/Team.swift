//
//  Team.swift
//  ProjectJeuVideo
//
//  Created by Jean François Santolaria on 13/04/2018.
//

import Foundation

// Create class Team

class Team {
    var name: String
    var characters = [Character]()
    
    init(name: String) {
        self.name = name
    }
    
    func isLive() -> Bool {
        var isLive = true
        var count = 0
        
        for character in characters {
            if character.isLife {
                count += 1
            }
        }
        
        if count == 0 {
            isLive = false
        }
        return isLive
    }
    
    static func addTeam() -> Team? {
        print("Entre le nom de ton équipe")
        let name = Display.readText()
        let teamWithCharacters = Team(name: name)
        teamWithCharacters.createThreeCharacters()
        return teamWithCharacters
    }
    
    private func createCharacters() {
        print("Sélectionne ton personnage :"
            + "\n1. Combattant"
            + "\n2. Mage"
            + "\n3. Colosse"
            + "\n4. Nain")
        
        let characterToCreate = Display.readNumber(valueMax: 4)
        switch characterToCreate {
        case 1:
            characters.append(addFighter()!)
        case 2:
            characters.append(addMagus()!)
        case 3:
            characters.append(addColossus()!)
        case 4:
            characters.append(addDwarf()!)
        default:
            print("Personnage non valide !")
        }
    }
    
    private func createThreeCharacters() {
        while characters.count != 3 {
            createCharacters()
        }
    }
    
    private func addFighter() -> Fighter? {
        print("Entre son nom :")
        let name = Display.readText()
        return Fighter(name: name)
    }
    
    private func addMagus() -> Magus? {
        print("Entre son nom :")
        let name = Display.readText()
        return Magus(name: name)
    }
    
    private func addColossus() -> Colossus? {
        print("Entre son nom :")
        let name = Display.readText()
        return Colossus(name: name)
    }
    
    private func addDwarf() -> Dwarf? {
        print("Entre son nom :")
        let name = Display.readText()
        return Dwarf(name: name)
    }
}






