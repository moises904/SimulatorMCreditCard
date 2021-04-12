//
//  HomeViewModel.swift
//  Simulator
//
//  Created by Moises Almeyda on 10/04/21.
//

import Foundation

final class HomeViewModel {
    
    private let simulatorUseCase: SimulatorUseCase?
    init() {
        simulatorUseCase = SimulatorUseCase()
    }
    
    @objc func getDataForLoadSimulator() {
        simulatorUseCase?.getDataFromSimulation()
    }

    
  
    
}
