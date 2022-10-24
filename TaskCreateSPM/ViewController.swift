//
//  ViewController.swift
//  TaskCreateSPM
//
//  Created by Ruslan Ismailov on 24/10/22.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {
    
    var model: [Model] = []
    
    let tableView: UITableView = {
        var tb = UITableView()
        tb = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tb.backgroundColor = .green
        
        return tb
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.rowHeight = 80
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        
        tableView.separatorStyle = .none
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.model = [
                Model(image: "slim", mainLabel: "First label", underLabel: "First under label"),
                Model(image: "slim", mainLabel: "Second label", underLabel: "Second under label"),
                Model(image: "slim", mainLabel: "Third label", underLabel: "Third under label"),
                Model(image: "slim", mainLabel: "Fourth label", underLabel: "Fourth under label"),
                Model(image: "slim", mainLabel: "Fivth label", underLabel: "Fivth under label"),
                Model(image: "slim", mainLabel: "Sixth label", underLabel: "Sixth under label"),
            ]
            // Данные пришли. Останавливаем анимацию скелетона
            self.tableView.stopSkeletonAnimation()
            // Скрываем скелетон
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            // Перезагружаем таблицу
            self.tableView.reloadData()
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Должен ли быть скелетон у таблицы
        tableView.isSkeletonable = true
        // Показать скелетон с анимацией градиента
        tableView.showAnimatedGradientSkeleton()
    }

    override func viewDidLayoutSubviews() {
        let safeArea = view.layoutMarginsGuide
        
        tableView.widthAnchor.constraint(equalToConstant: view.bounds.width - 20).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: view.bounds.height).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.image.image = UIImage(named: model[indexPath.row].image)
        cell.mainLabel.text = model[indexPath.row].mainLabel
        cell.underLabel.text = model[indexPath.row].underLabel

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
        
    

}

extension ViewController: SkeletonTableViewDataSource{
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "Cell"
    }
}
