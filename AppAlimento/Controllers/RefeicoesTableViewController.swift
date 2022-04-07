//
//  RefeicoesTableViewController.swift
//  AppAlimento
//
//  Created by Yan Alejandro on 15/03/22.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AddRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Churrasco", felicidade: 5),
                     Refeicao(nome: "Omelete", felicidade: 5),
                     Refeicao(nome: "Lasanha", felicidade: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            func removeRefeicao(alerta: UIAlertAction) {
                print("remover refeição: \(refeicao.nome)")
            }
            
            let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
            let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            alerta.addAction(botaoCancelar)
            
            let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: removeRefeicao(alerta:))
            alerta.addAction(botaoRemover)
            
            present(alerta, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        } 
    }
}