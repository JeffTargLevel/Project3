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
        print("🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡"
        + "\n🛡 Bienvenue aux guerriers de Namek !🛡"
        + "\n🛡         ⚔️⚔️⚔️⚔️⚔️⚔️             🛡"
        + "\n🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡🛡")
        let team1 = Team.addTeam()!
        let team2 = Team.addTeam()!
        let teamBoss = Team(name: "🧛🏻‍♂️ Boss 🧛🏻‍♂️") // Bonus of game
        teamBoss.characters.append(Boss())
        self.teams = [team1, team2, teamBoss]
    }
    
    func startGame() {
        let round = Round()
        rounds.append(round)
        round.teams = teams
        round.startRound()
        
        while true {
            
            if teams[0].isAlive && teams[1].isAlive {
                round.startRound()
            } else if teams[0].isAlive == false {
                fightTheFinalBoss(with: 1)
            } else if teams[1].isAlive == false {
                fightTheFinalBoss(with: 0)
            }
        }
    }
    
    private func fightTheFinalBoss(with teamWinner: Int) {
        print("\n💥 L'équipe \(teams[teamWinner].name) a gagné 💥")
        print("\n🧛🏻‍♂️ Affrontez le Boss 🧛🏻‍♂️")
        
        let roundBoss = Round()
        rounds.append(roundBoss)
        roundBoss.teams = teams
        roundBoss.startRoundBoss(for: teamWinner)
        
        while true {
            
            if teams[teamWinner].isAlive {
                roundBoss.startRoundBoss(for: teamWinner)
            } else if teams[teamWinner].isAlive == false {
                print("\nLe boss t'a vaincu 👎")
                print("\nTu t'es bien battu 👏")
                replay()
            } else if teams[2].isAlive == false {
                print("\n🏆 Félicitations tu as remporté la coupe des champions 🏆")
                replay()
            }
        }
    }
    
    private func replay() {
        print("\n🔄 Rejouer ❓")
        Game().startGame()
    }
}










