//
//  Item.swift
//  AppAlimento
//
//  Created by Yan Alejandro on 10/03/22.
//

import UIKit

    // MARK: - Atributos

class Item: NSObject {
    let nome: String
    let calorias: Double

    // MARK: - Init (Construtor)
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
