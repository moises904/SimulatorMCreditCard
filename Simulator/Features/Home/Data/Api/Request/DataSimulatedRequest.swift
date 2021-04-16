//
//  ResultSimulatorRequest.swift
//  Simulator
//
//  Created by Moises Almeyda on 13/04/21.
//

import Foundation

struct DataSimulatedRequest : BaseRequest, Codable{

    let dni: String?
    let tarjeta: String?
    let monto: String?
    let cuotas: String?
    let tea: String?
    let dia_pago: String?
    
    init(dni: String?, tarjeta: String?, monto: String?, cuotas:String?, tea: String?, dia_pago: String?) {
        self.dni = dni
        self.tarjeta = tarjeta
        self.monto = monto
        self.cuotas = cuotas
        self.tea = tea
        self.dia_pago = dia_pago
    }
    
 
}
