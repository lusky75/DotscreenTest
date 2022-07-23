//
//  ViewController.swift
//  DotscreenTest
//
//  Created by CHEN on 23/07/2022.
//

import UIKit

class GameVC: UIViewController {
    
    var coordinator: MainCoordinator?
    
    var gameView: GameView?
    
    var gameViewModel: GameViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupGameView()
        
        setupGameViewModel()
    }

    func setupGameView() {
        gameView = GameView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(gameView!)
        
        setupGameBoardCollectionView()
    }
    
    func setupGameBoardCollectionView() {
        gameView?.gameBoardCollectionView.delegate = self
        gameView?.gameBoardCollectionView.dataSource = self
        gameView?.gameBoardCollectionView.register(GameBoardCollectionViewCell.self, forCellWithReuseIdentifier: GameBoardCollectionViewCell.cellIdentifier)
        
        gameView?.gameBoardCollectionView.reloadData()
    }
    
    func setupGameViewModel() {
        gameViewModel = GameViewModel()
        TimerQuery.shared.registerTimer(id: "StartGameTimer", interval: 1, repeats: true, block: updateGameTimer)
    }
    
    func updateGameTimer() {
        /*
         When the timer of the game is out, it gets the message of checkWinnerOfGame. An alert is displayed and it navigate to previous page
         */
        if gameViewModel!.updateGameTimerString() == false {
            gameView?.gameMinutesLeftLabel.text = gameViewModel?.gameMinuteLeft
            gameView?.gameSecondsLeftLabel.text = gameViewModel?.gameSecondsLeft
            TimerQuery.shared.removeTimer(withId: "StartGameTimer")
            let checkWinnerOfGameMessage: String = gameViewModel!.checkWinnerOfGame()
            let alertPopupMessage = UIAlertController(title: "Game Over", message: checkWinnerOfGameMessage, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.coordinator?.previousPage()
            })
            alertPopupMessage.addAction(okAction)
            
            self.present(alertPopupMessage, animated: true, completion: nil)
            return
        }
        
        gameView?.gameMinutesLeftLabel.text = gameViewModel?.gameMinuteLeft
        gameView?.gameSecondsLeftLabel.text = gameViewModel?.gameSecondsLeft
    }

}

extension GameVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    /*
     If cellPlayedBy index values 1, display a circle
     If cellPlayedBy index values 2, display a cross
     Else nothing
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameBoardCollectionViewCell.cellIdentifier, for: indexPath) as! GameBoardCollectionViewCell
        let cellPlayedBy = gameViewModel!.cellPlayedBy[indexPath.row]
        if cellPlayedBy == 1 {
            cell.contentImageView.image = UIImage(named: "circle_icon")
        } else if cellPlayedBy == 2 {
            cell.contentImageView.image = UIImage(named: "cross_icon")
        } else {
            cell.contentImageView.image = UIImage(named: "")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthPerItem = (collectionView.frame.width * 0.3)
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    /*
     For each game's turn, it checks if the cell is already played, if it's not, it increases the value of gameTurn, and update value of cellPlayedBy
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if gameViewModel!.cellPlayedBy[indexPath.row] == 0 {
            gameViewModel!.gameTurn += 1
            if gameViewModel!.gameTurn % 2 == 1 {
                gameViewModel!.cellPlayedBy[indexPath.row] = 1
            } else {
                gameViewModel!.cellPlayedBy[indexPath.row] = 2
            }
            gameViewModel!.checkIfPlayerHasWonOneRound(completion: {
                gameView?.playerOneScoreLabel.text = String(gameViewModel!.playerOneScore)
                gameView?.playerTwoScoreLabel.text = String(gameViewModel!.playerTwoScore)
            })
        }
        collectionView.reloadData()
    }
    
}

