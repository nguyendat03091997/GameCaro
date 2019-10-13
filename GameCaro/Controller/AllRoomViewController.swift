//
//  AllRoomViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/6/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit
import SocketIO

class AllRoomViewController: MasterViewController {

    @IBOutlet weak var colecView: UICollectionView!
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var listAllRoom: [AllRoom_DTO] = [AllRoom_DTO]()
    
    let cellIdentify: String = "cellAllRoom"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.loadData()
        self.dataRealTime()
    }
    
    func setupView() {
        self.setNavigationTitle("All Room")
        
        colecView.delegate = self
        colecView.dataSource = self
        colecView.register(UINib(nibName: "AllRoomCell", bundle: nil), forCellWithReuseIdentifier: cellIdentify)
        
        collectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width * 0.8
        let height = width
        collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
        collectionViewFlowLayout.minimumLineSpacing = 20
        collectionViewFlowLayout.minimumInteritemSpacing = 20
        collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
        
        colecView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        
    }
    
    func loadData() {
        
        self.view.showActivity()
        Service.getAllRoom(success: { (response) in
            self.view.hideActivity()
            self.listAllRoom = response
            self.colecView.reloadData()
        }) { (error) in
            self.view.hideActivity()
            self.dialogError(error)
        }
    }
    
    func demo() {
        
    }
    
    func dataRealTime() {
        webSocket.connect()
    }
    
    @IBAction func create(sender: UIButton){
        let data : [String:Any] = [
            "token": accountDataManager.tokenID,
            "host": accountDataManager.userInfor.username,
            "host_id": accountDataManager.userInfor._id,
            "bet_point": "10"
        ]
        
        webSocket.emit(header: "create-room", data: [
            "token": accountDataManager.tokenID,
            "host": accountDataManager.userInfor.username,
            "host_id": accountDataManager.userInfor._id,
            "bet_point": "10"
        ]) {
            print("success")
        }
    }

}

extension AllRoomViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listAllRoom.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentify, for: indexPath) as! AllRoomCell
        cell.setData(listAllRoom[indexPath.row])
        
        return cell
    }
    
    
    
    
}
