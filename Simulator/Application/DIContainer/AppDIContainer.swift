//
//  AppDIContainer.swift
//  Simulator
//
//  Created by Moises Almeyda on 10/04/21.
//

import Foundation


final class AppDIContainer {
 
    
    
    // MARK: - Home
    func makeHomeViewController() -> HomeViewController {
        return HomeViewController.create(with: makeHomeViewModel())
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel()
    }
}
