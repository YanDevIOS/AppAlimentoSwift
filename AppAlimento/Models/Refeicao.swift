//
//  Refeicao.swift
//  AppAlimento
//
//  Created by Yan Alejandro on 10/03/22.
//

import UIKit

class Refeicao: NSObject {
    
    // MARK: - Atributos
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []

    // MARK: - Init (Construtor)
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }

    // MARK: - Metodos
    
    func totalDeCalorias() -> Double {
        var total = 0.0

        for item in itens {
            total += item.calorias
        }

        return total
    }
    
    func detalhes() -> String {
        var mensagem = "Qualidade: \(felicidade)"
        
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return mensagem
    }
}
