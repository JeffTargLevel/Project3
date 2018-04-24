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
            
            switch choiceCharacter {
            case "1":
                characters.append(addFighter()!)
            case "2":
                characters.append(addMagus()!)
            case "3":
                characters.append(addColossus()!)
            case "4":
                characters.append(addDwarf()!)
            default:
                print("Personnage non valide")
                createCharacters()
            }
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

