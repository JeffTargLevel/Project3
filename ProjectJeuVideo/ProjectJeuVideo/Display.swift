//
//  Display.swift
//  ProjectJeuVideo
//
//  Created by Jean François Santolaria on 26/04/2018.
//

import Foundation


class Display {
    
    static func readText() -> String {
        if let line = readLine(), line.count > 0 {
                return line
            }
        print("Vous n'avez rien écrit.")
        return readText()
    }
    
    static func readNumber(valueMax: Int) -> Int {
        if let line = readLine(), let number = Int(line), number <= valueMax && number > 0 {
                return number
            }
        print("Choix erroné.")
        return readNumber(valueMax: valueMax)
    }
}



