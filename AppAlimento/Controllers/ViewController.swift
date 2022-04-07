//
//  ViewController.swift
//  AppAlimento
//
//  Created by Yan Alejandro on 20/01/22.
//

import UIKit

protocol AddRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate{
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: -  Atributos
    
    var delegate: AddRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Carne", calorias: 280.0),
                         Item(nome: "Frango", calorias: 230.0),
                         Item(nome: "Peixe", calorias: 150.0),
                         Item(nome: "Ovo", calorias: 120.0)]
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        let botaoAdicionarItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionarItem
    }
    
    @objc func adicionarItens() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
        
    func add(_ item: Item) {
        itens.append(item)
        if let tableview = itensTableView {
            tableview.reloadData()
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao atualizar tabela")
        }
    }
        
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        }else{
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    func recuperaRefeicaoDoFormulario() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return nil
        }
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return nil
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        return refeicao
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
        if let refeicao = recuperaRefeicaoDoFormulario() {
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true)
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler dados do formulário")
        }
    }
}


