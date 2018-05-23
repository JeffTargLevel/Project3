//
//  Character.swift
//  ProjectJeuVideo
//
//  Created by Jean François Santolaria on 13/04/2018.
//

import Foundation

// Create class Character


class Character {
    let name: String
    let description: String
    var lifePoints: Int
    var weapon: Weapon
    var isAlive: Bool {
        return lifePoints > 0
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
    
    static func displayMessageEnterHisName() {
        print("\n⌨️ Entre son nom  ⌨️")
    }
}

// Create class Fighter who inherits class Character

class Fighter: Character {
    
    init(name: String) {
        let sword = Sword()
        super.init(name: name, description: "🗡 Combattant 🗡", lifePoints: 100, weapon: sword)
    }
}

// Create class Magus who inherits class Character

class Magus: Character {
    
    init(name: String) {
        let mageBaton = MageBaton()
        super.init(name: name, description: "☄️ Mage ☄️", lifePoints: 50, weapon: mageBaton)
    }
}

// Create class Colossus who inherits class Character

class Colossus: Character {
    
    init(name: String) {
        let fists = Fists()
        super.init(name: name, description: "🤛 Colosse 🤜", lifePoints: 150, weapon: fists)
    }
}

// Create class Dwarf who inherits class Character

class Dwarf: Character {
    
    init(name: String) {
        let axe = Axe()
        super.init(name: name, description: "⛏ Nain ⛏", lifePoints: 70, weapon: axe)
    }
}

// Create class Boss who inherits class Character

class Boss: Character {
    
    init() {
        let lucille = Lucille()
        super.init(name: " 💥 Negan 💥", description: "🧛🏻‍♂️ Boss 🧛🏻‍♂️", lifePoints: 200, weapon: lucille)
    }
}

