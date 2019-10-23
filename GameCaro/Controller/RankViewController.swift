
//
//  RankViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/6/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class RankViewController: MasterViewController {

    @IBOutlet weak var tbView: UITableView!
    
    var listRank = [Rank_DTO]()
    
    let cellRank = "cellRank"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.loadData()
    }
    
    func setupView() {
        self.setNavigationTitle("Top Rank")
        
        tbView.delegate = self
        tbView.dataSource = self
        tbView.register(UINib(nibName: "RankCell", bundle: nil), forCellReuseIdentifier: cellRank)
        tbView.rowHeight = 75
    }
    
    func loadData() {
        
        self.view.showActivity()
        Service.getRank(success: { (response) in
            self.view.hideActivity()
            self.listRank = response
            self.tbView.reloadData()
        }) { (error) in
            self.view.hideActivity()
        }
    }

}

extension RankViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listRank.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellRank, for: indexPath) as! RankCell
        cell.setData(listRank[indexPath.row],indexPath.row)
        
        return cell
        
    }
    
    
}
