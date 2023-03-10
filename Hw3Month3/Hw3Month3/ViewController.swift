//
//  ViewController.swift
//  HW3MONTH3
//
//  Created by Mac on 30/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var adress1 = Street(name: "Донецкая", cost: 100)
        var adress2 = Street(name: "Ибраимова", cost: 200)
        var adress3 = Street(name: "Советская", cost: 300)
    var adress4 = Street(name: "Ала - Арча", cost: 400)
    var adrees5 = Street(name: "Байтик", cost: 700)
        var addButton = UIButton()
    
    
    @IBOutlet weak var StreetstableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
               StreetstableView.dataSource = self
                StreetstableView.register(UITableViewCell.self, forCellReuseIdentifier: "name")
                view.addSubview(addButton)
                addButton.layer.cornerRadius = 10
                        addButton.setTitle("Заказы", for: .normal)
                        addButton.backgroundColor = .blue
                        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
                        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
                        addButton.translatesAutoresizingMaskIntoConstraints = false
                        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
                addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
                        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
                        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        addButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    @objc func addButtonTap() {
        let adresses = [adress1,adress2,adress3,adress4,adrees5]
                    let secondVc = storyboard?.instantiateViewController(withIdentifier: "second_vc") as! ViewController2
        secondVc.info = "общая цена всех заказов - \((adresses[0].cost) + (adresses[1].cost) + (adresses[2].cost) + (adresses[3].cost) + (adresses[4].cost))"
                    self.navigationController?.pushViewController(secondVc, animated: true)
                    StreetstableView.reloadData()
    
                }
            }
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let adresses = [adress1, adress2, adress3,adress4,adrees5]
        return adresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let adresses = [adress1,adress2,adress3, adress4, adrees5]
        let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath)
        cell.textLabel?.text = "адрес \(adresses[indexPath.row].name) цена -  \(adresses[indexPath.row].cost)"
        return cell
    }
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}








class Street{
    var name:String
    var cost:Int
    init(name: String, cost: Int) {
        self.name = name
        self.cost = cost
    }
}
//var adress1 = Adress(name: "вывы", cost: 200)
//    var adress2 = Adress(name: "ba", cost: 300)
//    var adress3 = Adress(name: "ds", cost: 500)
//    var addButton = UIButton()
//    @IBOutlet weak var tableView: UITableView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "name")
//        view.addSubview(addButton)
//        addButton.layer.cornerRadius = 10
//                addButton.setTitle("Заказать", for: .normal)
//                addButton.backgroundColor = .blue
//                addButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
//                addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
//                addButton.translatesAutoresizingMaskIntoConstraints = false
//                addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
//        addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
//                addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
//                addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//                addButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
//            }
//
//
//
//
//            @objc func addButtonTap() {
//                var adresses = [adress1,adress2,adress3]
//                let secondVc = storyboard?.instantiateViewController(withIdentifier: "second_vc") as! _ViewController
//                secondVc.info = "\((adresses[0].cost) + (adresses[1].cost) + (adresses[2].cost))"
//                self.navigationController?.pushViewController(secondVc, animated: true)
//                tableView.reloadData()
//
//            }
//        }
