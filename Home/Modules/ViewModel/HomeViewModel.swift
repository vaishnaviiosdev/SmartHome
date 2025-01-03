//
//  HomeViewModel.swift
//  Home
//
//  Created by Vaishnavi on 02/01/25.
//

import Foundation

class HomeViewModel {
    private var data: [CellData]
    
    init() {
        self.data = [
            CellData(type: .profile),
            CellData(type: .menu),
            CellData(type: .airCondition),
            CellData(type: .appliances)
        ]
    }
    
    func numberOfRows() -> Int {
        return data.count
    }
    
    func dataForRow(at index: Int) -> CellData {
        return data[index]
    }
    
    func fetchHomeDetails(){
        do {
            guard let bundlePath = Bundle.main.path(forResource: "HomeResponse", ofType: "json") else {
                print("JSON file not found in the bundle.")
                return
            }
            let url = URL(fileURLWithPath: bundlePath)
            let jsonData = try Data(contentsOf: url)
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([String: DataModel].self, from: jsonData)
                if let dataModel = decodedResponse["data"] {
                    self.data = [
                        CellData(type: .profile, profile: dataModel.profile),
                        CellData(type: .menu, menu: dataModel.menu),
                        CellData(type: .airCondition, gadgets: dataModel.gadgets),
                        CellData(type: .appliances, gadgets: dataModel.gadgets)
                    ]
                    
                } 
                else {
                    print("Missing 'data' in JSON response.")
                }
            } 
            catch {
                print("Error parsing JSON: \(error.localizedDescription)")
            }
        } 
        catch {
            print("Error reading file: \(error.localizedDescription)")
        }
    }
}
