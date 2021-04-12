//
//  SimulatorUseCase.swift
//  Simulator
//
//  Created by Moises Almeyda on 10/04/21.
//

import Foundation

class SimulatorUseCase {
    
    private let simulatorRepositoryImp: SimulatorRepositoryImpl?
    
    init() {
        self.simulatorRepositoryImp = SimulatorRepositoryImpl()
    }
    
    func getDataFromSimulation() {
        
        self.simulatorRepositoryImp?.getDataForSimulate()
    }
    
}
