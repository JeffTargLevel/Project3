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
        playRound(betweenTeam: 0, andTeam: 1)
        playRound(betweenTeam: 1, andTeam: 0)
        
    }
    
    private func playRound(betweenTeam index: Int, andTeam opposingIndex: Int) {
        let round = Round()
        rounds.append(round)
        round.teams = teams
        round.startRound()
        
        while true {
            var characterLife: Character!
            
            for character in teams[index].characters {
                characterLife = character
                
            }
            
            if characterLife.isLife {
                startGame()
                
            }
            
            if characterLife.isDead {
                print("L'équipe \(teams[opposingIndex].name) a gagné !")
                print("Affrontez le Boss !")
                fightTheFinalBoss(with: opposingIndex)
                
            }
        }
    }
    
    private func fightTheFinalBoss(with teamWinner: Int) {
        let roundBoss = Round()
        rounds.append(roundBoss)
        roundBoss.teams = teams
        roundBoss.startRoundBoss(for: teamWinner)
        
        
        while true {
            var characterTeamWinner: Character!
            
            for character in teams[teamWinner].characters {
                characterTeamWinner = character
                
            }
            
            if characterTeamWinner.isLife {
                fightTheFinalBoss(with: teamWinner)
            }
                
            else if characterTeamWinner.isDead {
                print("Le boss t'a vaincu !")
                print("Tu t'es bien battu !")
                replay()
                
            } else {
                print("Félicitations tu as remporté la coupe des champions !!")
                replay()
                
            }
        }
    }
    
    private func replay() {
        print("Rejouer ?")
        Game().startGame()
    }
}









