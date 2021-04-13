//
//  DataSimulatorModel.swift
//  Simulator
//
//  Created by Moises Almeyda on 13/04/21.
//

import Foundation


class DataSimulatorModel {
    
    var nameCrediTsCards: Cards?
    
    init(cards: Cards) {
        self.nameCrediTsCards = cards
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
    
}
