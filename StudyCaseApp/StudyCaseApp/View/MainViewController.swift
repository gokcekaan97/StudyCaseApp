//
//  ViewController.swift
//  StudyCaseApp
//
//  Created by kaan gokcek 

import UIKit

class MainViewController: UIViewController {
  public let personListTable = UITableView()
  public let viewModel = MainViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    DispatchQueue.main.async{
      self.personListTable.reloadData()
      self.setupTableView()
    }
  }
  
  func setupTableView() {
    personListTable.delegate = self
    personListTable.dataSource = self
    personListTable.translatesAutoresizingMaskIntoConstraints = false
    personListTable.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    
    view.addSubview(personListTable)
    
    NSLayoutConstraint.activate([
      personListTable.topAnchor.constraint(equalTo: self.view.topAnchor),
      personListTable.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      personListTable.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      personListTable.leftAnchor.constraint(equalTo: self.view.leftAnchor)
    ])
  }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 14
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
    cell.textLabel?.text = viewModel.personList.first?.fullName
    return cell
  }
}
