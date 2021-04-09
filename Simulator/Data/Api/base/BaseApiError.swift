//
//  BaseApiError.swift
//  Simulator
//
//  Created by Moises Almeyda on 8/04/21.
//

import Foundation

protocol ApiError: LocalizedError {
    var statusCode: String? { get }
}
