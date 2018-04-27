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
        let round = Round()
        rounds.append(round)
        round.teams = teams
        round.startRound()
        
        while true {
            
            if teams[0].isLive() && teams[1].isLive() {
                round.startRound()
            } else if teams[0].isLive() == false {
                fightTheFinalBoss(with: 1)
            } else if teams[1].isLive() == false {
                fightTheFinalBoss(with: 0)
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
            
            if teams[teamWinner].isLive() {
                roundBoss.startRoundBoss(for: teamWinner)
            } else if teams[teamWinner].isLive() == false {
                print("Le boss t'a vaincu !")
                print("Tu t'es bien battu !")
                replay()
            } else if teams[2].isLive() == false {
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










