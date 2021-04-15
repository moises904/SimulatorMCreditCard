//
//  ValidationUseCase.swift
//  Simulator
//
//  Created by Moises Almeyda on 14/04/21.
//

import Foundation

class ValidationUseCase {
    
    private let INVALID_DOCUMENT_NUMBER: String  = "Es inválido el numero de documento."
    private let INVALID_AMOUNT: String           = "Es inválido el monto."
    
    init() {
    }
    
    public func validateParametersSimulator(numberDni: String?, amount: String?) -> String {
        
        var message:String = ""
        
        if(numberDni == nil ||  numberDni!.isEmpty ) {
            message = INVALID_DOCUMENT_NUMBER
            
        }
        
        if( amount == nil || amount!.isEmpty ) {
            message = message + "\n \(INVALID_AMOUNT)"
        }
        
        return message
    }
    
}
