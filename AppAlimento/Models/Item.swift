//
//  Item.swift
//  AppAlimento
//
//  Created by Yan Alejandro on 10/03/22.
//

import UIKit

class Item: NSObject, NSCoding{
    
    // MARK: - Atributos
    
    let nome: String
    let calorias: Double

    // MARK: - Init (Construtor)
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
    // MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        calorias = coder.decodeDouble(forKey: "calorias")
    }
}
