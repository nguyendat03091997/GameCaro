//
//  AllRoomViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/6/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class AllRoomViewController: MasterViewController {
    
    @IBOutlet weak var tbView: UITableView!
    
    var listAllRoom: [Room_DTO] = [Room_DTO]()
    
    let cellIdentify: String = "cellAllRoom"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.dataRealTime()
        
        notifyInstance.add(self, #selector(handleNotify(_:)), .create_room)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadData()
    }
    
    func setupView() {
        self.setNavigationTitle("All Room")
        
        tbView.delegate = self
        tbView.dataSource = self
        tbView.register(UINib(nibName: "AllRoomCell", bundle: nil), forCellReuseIdentifier: cellIdentify)
        
    }
    
    func loadData() {
        
        self.view.showActivity()
        Service.getAllRoom(success: { (response) in
            self.view.hideActivity()
            self.listAllRoom = response
            self.tbView.reloadData()
        }) { (error) in
            self.view.hideActivity()
            self.dialogError(error)
        }
    }
    
    func dataRealTime() {
        webSocket.connect()
    }
    
    @objc func handleNotify(_ notify: Notification){
        let data = notify.userInfo! as! [String:Any]
        let dto = Room_DTO.init(dictionary: data as NSDictionary)
        listAllRoom.append(dto)
        tbView.reloadData()
    }
    
    func handelJoinRoom(idRoom: Int){
        
        let data: NSDictionary = [
            "token" : accountDataManager.tokenID,
            "room_id" : idRoom,
            "guest" : accountDataManager.userInfor.username,
            "guest_id" : accountDataManager.userInfor._id
        ]
        
        webSocket.emit(header: .join_room, data: data) {
            let viewController = PlayGameViewController()
            viewController.isHost = false
            viewController.myTurn = true
            self.push(viewController)
        }
        
    }
    
    @IBAction func create(sender: UIButton){
        let createView = PopupCreateRoomView()
        createView.view.frame = self.view.bounds
        self.view.addSubview(createView.view)
        createView.didMove(toParent: self)
        self.addChild(createView)
    }

}

extension AllRoomViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = AllRoomHeader()
        header.lbTitle.text = "List All Room"
        return header
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return listAllRoom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentify, for: indexPath) as! AllRoomCell
        cell.setData(listAllRoom[indexPath.row], indexPath.row + 1)
        cell.handleJoinRoom = self.handelJoinRoom(idRoom:)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

