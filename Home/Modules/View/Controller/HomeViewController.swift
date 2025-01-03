//
//  HomeViewController.swift
//  Home
//
//  Created by Vaishnavi on 02/01/25.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.fetchHomeDetails()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = viewModel.dataForRow(at: indexPath.row)
        switch cellData.type {
            case .profile:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
                if let profile = cellData.profile {
                    cell.configureCell(profile: profile)
                }
                return cell
            case .menu:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
                cell.delegate = self
                if let menu = cellData.menu {
                    cell.configureCell(with: menu)
                }
                return cell
            case .airCondition:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AirConditionerTableViewCell", for: indexPath) as! AirConditionerTableViewCell
                return cell
            case .appliances:
                let cell = tableView.dequeueReusableCell(withIdentifier: "AppliancesTableViewCell", for: indexPath) as! AppliancesTableViewCell
                if let appliance = cellData.gadgets{
                    cell.configureCell(with: appliance)
                }
                return cell
        }
    }
}

//MARK: - Delegate Methods
extension HomeViewController :MenuTableViewCellDelegate {
    func didTapOnMenu(selectedData: MenuItem) {
        print("selectedMenu",selectedData.name)
    }
}
