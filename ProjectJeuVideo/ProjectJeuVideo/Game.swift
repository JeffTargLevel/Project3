//
//  Game.swift
//  ProjectJeuVideo
//
//  Created by Jean François Santolaria on 13/04/2018.
//

import Foundation

//Create class Game

class Game {
    private var teams = [Team]()
    private var rounds = [Round]()
    
    init() {
        print("Bienvenue au tournoi des guerriers de Namek !")
        let team1 = Team.addTeam()!
        let team2 = Team.addTeam()!
        let teamBoss = Team(name: "Boss") // Bonus of game
        teamBoss.characters.append(Boss())
        self.teams = [team1, team2, teamBoss]
        
    }
    
    func startGame() {
        gameRound(betweenTeam: 0, andTeam: 1)
        gameRound(betweenTeam: 1, andTeam: 0)
    }
    
    private func gameRound(betweenTeam index: Int, andTeam opposingIndex: Int) {
        let round = Round()
        rounds.append(round)
        round.teams = teams
        
        for numberOfCharacters in 0..<teams[index].characters.count {
            
            while teams[index].characters[0 + numberOfCharacters].isLife {
                round.startRound()
            }
            
        if teams[index].characters[0 + numberOfCharacters].isDead {
                print("L'équipe \(teams[opposingIndex].name) a gagné !")
                print("Affrontez le Boss !")
                teamThatWillFightTheBoss(teamWinner: opposingIndex)
            }
        }
    }
    
    private func teamThatWillFightTheBoss(teamWinner: Int) {
        let roundBoss = Round()
        rounds.append(roundBoss)
        roundBoss.teams = teams
        
        roundBoss.startRoundBoss(for: teamWinner)
        
        for numberOfCharacters in 0..<teams[teamWinner].characters.count {
            while teams[teamWinner].characters[0 + numberOfCharacters].isLife {
                teamThatWillFightTheBoss(teamWinner: teamWinner)
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
    
    private func gameLose() {
        print("👎👎👎👎👎")
        print("Rejouer ?")
        Game().startGame()
    }
    
    private func gameWin() {
        print("👍👍👍👍👍")
        print("Rejouer ?")
        Game().startGame()
    }
    
}

