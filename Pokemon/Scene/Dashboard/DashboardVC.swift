//
//  DashboardVC.swift
//  QuestionTest
//
//  Created by Ricardo Gonzalez on 28/08/23.
//
import UIKit
import Foundation


class DashboardVC: UIViewController {
    
    var items = [itemDashboard(title: "Camara", checkbox: false),
                 itemDashboard(title: "Foto", checkbox: false),
                 itemDashboard(title: "Nombre Completo", checkbox: false),
                 itemDashboard(title: "Numero Telefonico", checkbox: false),
                 itemDashboard(title: "Fecha de nacimiento", checkbox: false),
                 itemDashboard(title: "Sexo", checkbox: false),
                 itemDashboard(title: "Color Favorito", checkbox: false)]
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Lifecycle Methods

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Second Call the services
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCellWith(identifier: DashboardViewCell.identifier)
    }
    
    @IBAction func continueAction(_ sender: Any) {
        if items.firstIndex(where: {$0.checkbox == true}) != nil {
            var a = [itemDashboard]()
            for i in items {
                if i.checkbox == true {
                    a.append(i)
                }
            }

            presenter?.nextView(a)
        }else{
            let dialogMessage = UIAlertController(title: "Alerta", message: "Selecciona al menos un item para continuar", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    public static func initWithNibName() -> DashboardVC {
        let bundle = Bundle(for: DashboardVC.self)
        let newView = DashboardVC(nibName: "DashboardViewController", bundle: bundle)
        return newView
    }

    // MARK: - Properties
    var presenter: ViewToPresenterDashboardProtocol?
}

extension DashboardVC: PresenterToViewDashboardProtocol{
    // TODO: Implement View Output Methods
}

extension DashboardVC: ItemSelectDelegate {
    func onSelectedItem(item: itemDashboard) {
        if let row = self.items.firstIndex(where: {$0.title == item.title}) {
               items[row] = item
        }
    }
}
