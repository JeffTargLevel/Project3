//
//  Display.swift
//  ProjectJeuVideo
//
//  Created by Jean François Santolaria on 26/04/2018.
//

import Foundation


class Display {
    static var listNames = [String]()
    
    static func readText() -> String {
        
        if let line = readLine()?.localizedCapitalized, line.count > 0, line != "Negan", line != "Boss", listNames.contains(line) == false {
            listNames.append(line)
            return line
        }
        print("\n⛔️ Ecrire un nom valide ⛔️")
        return readText()
    }
    
    static func readNumber(valueMax: Int) -> Int {
        if let line = readLine(), let number = Int(line), number <= valueMax && number > 0 {
            return number
        }
        print("\n⛔️ Choix erroné ⛔️")
        return readNumber(valueMax: valueMax)
    }
}









