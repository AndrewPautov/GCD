//
//  MainViewController.swift
//  GCD
//
//  Created by Андрей Паутов on 18.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    private let tableView = UITableView()
    private let id = "cell"
    private var arrayOfControllers = [MyViewController(), MySecondViewController(), MyThirdViewController(), MyFourthViewController(), MyFifthViewController(), MySixthViewController(), MySeventhViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GCD Lessons"
        view.backgroundColor = .white
        createTableView()
    }
    
    func createTableView() {
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
        view.addSubview(tableView)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(arrayOfControllers[indexPath.row], animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1) + " Lesson"
        return cell
    }
    
    
}
