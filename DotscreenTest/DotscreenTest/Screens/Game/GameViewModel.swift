//
//  GameViewModel.swift
//  DotscreenTest
//
//  Created by CHEN on 23/07/2022.
//

import Foundation

protocol GameViewModelProtocol {
    
    var gameTurn: Int { get set }
    
    var playerOneScore: Int { get set }
    
    var playerTwoScore: Int { get set }
    
    var gameMinuteLeft: String { get set }
    
    var gameSecondsLeft: String { get set }
    
    var gameEndDate: Date? { get set }
    
    var cellPlayedBy: [Int] { get set }
    
    func updateGameTimerString() -> Bool
    
    func checkIfPlayerHasWonInLine(playerValue: Int) -> Bool
    
    func checkIfPlayerHasWonInDiagonalLine(playerValue: Int) -> Bool
    
    func checkIfPlayerHasWonOneRound(completion: (() -> ()))
    
    func checkIfBoardIsFull() -> Bool
    
    func checkWinnerOfGame() -> String
    
}

class GameViewModel : GameViewModelProtocol {
    
    var gameTurn: Int = 0
    
    var playerOneScore: Int = 0
    
    var playerTwoScore: Int = 0
    
    var gameMinuteLeft: String = "00"
    
    var gameSecondsLeft: String = "00"
    
    var gameEndDate: Date?
    
    var cellPlayedBy: [Int] = []
    
    init() {
        let gameEndDateValue = Date().timeIntervalSince1970 + 180
        gameEndDate = Date(timeIntervalSince1970: gameEndDateValue)
        
        initCellPlayedBy()
    }
    
    func initCellPlayedBy() {
        cellPlayedBy = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
    func updateGameTimerString() -> Bool {
        if let gameEndDate = gameEndDate {
            let (minutes, seconds) = Date().getNumberOfMinutesAndSecondsFromDate(dateFrom: gameEndDate)
            if minutes == 0 && seconds == -1 {
                return false
            }
            if minutes < 10 {
                gameMinuteLeft = "0" + String(minutes)
            } else {
                gameMinuteLeft = String(minutes)
            }
            if seconds < 10 {
                gameSecondsLeft = "0" + String(seconds)
            } else {
                gameSecondsLeft = String(seconds)
            }
        }
        return true
    }
    
    func checkIfPlayerHasWonInLine(playerValue: Int) -> Bool {
        if (cellPlayedBy[0] == playerValue && cellPlayedBy[1] == playerValue && cellPlayedBy[2] == playerValue) || (cellPlayedBy[0] == playerValue && cellPlayedBy[3] == playerValue && cellPlayedBy[6] == playerValue) ||
            (cellPlayedBy[2] == playerValue && cellPlayedBy[5] == playerValue && cellPlayedBy[8] == playerValue) ||
            (cellPlayedBy[6] == playerValue && cellPlayedBy[7] == playerValue && cellPlayedBy[8] == playerValue) ||
            
            (cellPlayedBy[1] == playerValue && cellPlayedBy[4] == playerValue && cellPlayedBy[7] == playerValue) ||
            (cellPlayedBy[3] == playerValue && cellPlayedBy[4] == playerValue && cellPlayedBy[5] == playerValue)
        {
            if playerValue == 1 {
                playerOneScore += 1
            } else {
                playerTwoScore += 1
            }
            initCellPlayedBy()
            return true
        }
        return false
    }
    
    func checkIfPlayerHasWonInDiagonalLine(playerValue: Int) -> Bool {
        if (cellPlayedBy[0] == playerValue && cellPlayedBy[4] == playerValue && cellPlayedBy[8] == playerValue) || (cellPlayedBy[2] == playerValue && cellPlayedBy[4] == playerValue && cellPlayedBy[6] == playerValue) {
            if playerValue == 1 {
                playerOneScore += 1
            } else {
                playerTwoScore += 1
            }
            initCellPlayedBy()
            return true
        }
        return false
    }
    
    func checkIfPlayerHasWonOneRound(completion: (() -> ())) {
        if checkIfPlayerHasWonInLine(playerValue: 1) || checkIfPlayerHasWonInLine(playerValue: 2) || checkIfPlayerHasWonInDiagonalLine(playerValue: 1) || checkIfPlayerHasWonInDiagonalLine(playerValue: 2) {
            completion()
        }
        if checkIfBoardIsFull() {
            initCellPlayedBy()
        }
    }
    
    func checkIfBoardIsFull() -> Bool {
        for value in cellPlayedBy {
            if value == 0 {
                return false
            }
        }
        return true
    }
    
    func checkWinnerOfGame() -> String {
        if playerOneScore > playerTwoScore {
            return "The player One has won"
        } else if playerOneScore < playerTwoScore {
            return "The player Two has won"
        } else {
            return "Draw, no one has won"
        }
    }
    
}
