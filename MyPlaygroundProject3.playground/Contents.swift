//: Playground - noun: a place where people can play

import UIKit

// Create class character

class Character {
    var name: String
    var description = ""
    var lifePoints = 0
    
    init(name: String) {
        self.name = name
        
     }
}

// Create class fighter who inherits class character

class Fighter: Character {

    override var description: String {
        get {
            return super.description + "Combattant"
        }
        set {
            super.description = newValue
        }
        
    }
    
    override var lifePoints: Int {
        get {
            return super.lifePoints + 100
        }
        set {
            super.lifePoints = newValue
        }
    }
}


// Create class magus who inherits class character

class Magus: Character {
    
    override var description: String {
        get {
            return super.description + "Mage"
        }
        set {
            super.description = newValue
        }
    }
    
    override var lifePoints: Int {
        get {
            return super.lifePoints + 50
    }
        set {
            super.lifePoints = newValue
        }
    }
}

// Create class colossus who inherits class character

class Colossus: Character {
    
    override var description: String {
        get {
        return super.description + "Colosse"
    }
        set {
        super.description = newValue
        }
        
    }
    
    override var lifePoints: Int {
        get {
            return super.lifePoints + 150
        }
        set {
            super.lifePoints = newValue
        }
    }
}
// Create class dwarf who inherits class character

class Dwarf: Character {
    
    override var description: String {
        get {
            return super.description + "Nain"
        }
        set {
            super.description = newValue
        }
    }
    
    override var lifePoints: Int {
        get {
            return super.lifePoints + 70
        }
        set {
            super.lifePoints = newValue
        }
    }
    
}

var gandalf = Magus.init(name: "gandalf")
gandalf.lifePoints
