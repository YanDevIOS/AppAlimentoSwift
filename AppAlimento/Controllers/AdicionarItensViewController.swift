//
//  AdicionarItensViewController.swift
//  AppAlimento
//
//  Created by Yan Alejandro on 22/03/22.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeItem: UITextField!
    @IBOutlet weak var caloriasItem: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nome = nomeItem.text, let calorias = caloriasItem.text else {
            return
        }
        
        if let numeroDeCalorias = Double(calorias) {
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
    }
}
