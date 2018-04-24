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
        
    }
    
    private func playRound(betweenTeam index: Int, andTeam opposingIndex: Int) {
        let round = Round()
        rounds.append(round)
        round.teams = teams
        round.startRound()
        
        while true {
            var characterTeam1: Character!
            var characterTeam2: Character!
            
            for characterOfTeam1 in teams[index].characters {
                print("\(characterOfTeam1.name)")
                characterTeam1 = characterOfTeam1
            }
            for characterOfTeam2 in teams[opposingIndex].characters {
                print("\(characterOfTeam2.name)")
                characterTeam2 = characterOfTeam2
            }
            
            if characterTeam1.isLife && characterTeam2.isLife {
                startGame()
                
            }
                
            else if characterTeam1.isDead {
                fightTheFinalBoss(with: opposingIndex)
                
            }
                
            else if characterTeam2.isDead {
                fightTheFinalBoss(with: index)
            }
        }
    }
    
    private func fightTheFinalBoss(with teamWinner: Int) {
        print("L'équipe \(teams[teamWinner].name) a gagné !")
        print("Affrontez le Boss !")
        
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










