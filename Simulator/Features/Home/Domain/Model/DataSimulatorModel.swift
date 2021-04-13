//
//  DataSimulatorModel.swift
//  Simulator
//
//  Created by Moises Almeyda on 13/04/21.
//

import Foundation


class DataSimulatorModel {
    
    var nameCrediTsCards: Cards
    
    init(cards: Cards) {
        self.nameCrediTsCards = cards
    }
    
    func getCards() -> Cards {
        return nameCrediTsCards
    }
    
    
}


class Cards {
    
    var nameCardClassic: String
    var nameCardGold: String
    var nameCardBlack: String
    
    init(classic: String, gold: String, black: String) {
        self.nameCardClassic = classic
        self.nameCardBlack = black
        self.nameCardGold = gold
    }
    
    func setNameCardClassic(classic: String) {
        self.nameCardClassic = classic
    }
    
    func  getNameCardClasic() -> String {
        return nameCardClassic
    }
    
    func setNameCardGold(gold: String) {
        self.nameCardGold = gold
    }
    
    func  getNameCardGold() -> String {
        return nameCardGold
    }
    
    func setNameCardBlack(black: String) {
        self.nameCardBlack = black
    }
    
    func  getNameCardBlack() -> String {
        return nameCardBlack
    }
}
