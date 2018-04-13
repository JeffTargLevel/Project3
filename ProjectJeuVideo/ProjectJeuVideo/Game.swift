//
//  Game.swift
//  ProjectJeuVideo
//
//  Created by Jean François Santolaria on 13/04/2018.
//

import Foundation

//Create class Game

class Game {
    var teams = [Team]()
    var rounds = [Round]()
    
    init() {
        print("Bienvenue au tournoi des guerriers de Namek !")
        let team1 = Team.addTeam()!
        let team2 = Team.addTeam()!
        let teamBoss = Team(name: "Boss") // Bonus of game
        teamBoss.characters.append(Boss())
        self.teams = [team1, team2, teamBoss]
        
    }
    
    func startGame() {
        let round = Round()
        rounds.append(round)
        round.teams = teams
        round.startRound()
        gameRound()
    }
    
    func gameRound() {
        
        for numberOfCharacters in 0..<teams[0].characters.count {
            
            while teams[0].characters[numberOfCharacters].isLife {
                startGame()
            }
            if teams[0].characters[numberOfCharacters].isDead {
                print("L'équipe \(teams[1].name) a gagné !")
                print("Affrontez le Boss !")
                teamThatWillFightTheBoss(teamWinner: 1)
            }
        }
        
        for numberOfCharacters in 0..<teams[1].characters.count {
            
            while teams[1].characters[numberOfCharacters].isLife {
                startGame()
            }
            if teams[1].characters[numberOfCharacters].isDead {
                print("L'équipe \(teams[0].name) a gagné !")
                print("Affrontez le Boss !")
                teamThatWillFightTheBoss(teamWinner: 0)
                
            }
        }
    }
    
    func teamThatWillFightTheBoss(teamWinner: Int) {
        let roundBoss = Round()
        rounds.append(roundBoss)
        roundBoss.teams = teams
        
        roundBoss.startRoundBoss(for: teamWinner)
        
        for numberOfCharacters in 0..<teams[teamWinner].characters.count {
            while teams[teamWinner].characters[0 + numberOfCharacters].isLife {
                roundBoss.startRoundBoss(for: teamWinner)
                
            }
            
            if teams[teamWinner].characters[0 + numberOfCharacters].isDead {
                print("Le boss t'a vaincu !")
                print("Tu t'es bien battu !")
                gameLose()
                
            } else if teams[2].characters[0].isDead {
                print("Félicitations tu as remporté la coupe des champions !!")
                gameWin()
            }
        }
    }
    
    func gameLose() {
        print("👎👎👎👎👎")
    }
    
    func gameWin() {
        print("👍👍👍👍👍")
    }
    
}
