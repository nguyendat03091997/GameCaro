//
//  PlayGameViewController.swift
//  GameCaro
//
//  Created by Mojave on 10/16/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import UIKit

class PlayGameViewController: UIViewController {

    @IBOutlet weak var collectView: UICollectionView!
    @IBOutlet weak var avatarSelf: UIImageView!
    @IBOutlet weak var avatarCompetitor: UIImageView!
    
    @IBOutlet weak var weaponSelf: UIImageView!
    @IBOutlet weak var weaponCompetitor: UIImageView!
    
    @IBOutlet weak var lbNameSelf: UILabel!
    @IBOutlet weak var lbNameCompetitor: UILabel!
    
    @IBOutlet weak var viewChatCompetior: UIView!
    @IBOutlet weak var viewChatSelf: UIView!
    
    var textMessage: UITextView!
    
    var collectViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentify = "PlayGameCell"
    
    var marix = Array(repeating: Array(repeating: 0, count: 10), count: 10)
    var Idroom: Int = 0
    
    var isHost: Bool = false
    var playGame: Bool = false
    var myTurn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyInstance.add(self, #selector(handleJoinRoom(_:)), .join_room)
        notifyInstance.add(self, #selector(handlePlayGame(_:)), .play_game)
        notifyInstance.add(self, #selector(handleGameResutlt(_:)), .game_result)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notifyInstance.remove(self, .join_room)
        notifyInstance.remove(self, .play_game)
        notifyInstance.remove(self, .game_result)
    }
    
    override func viewWillLayoutSubviews() {
        self.setupView()
        self.setupUI()
    }
    
    func setupView(){
        collectView.delegate = self
        collectView.dataSource = self
        collectView.register(UINib.init(nibName: "PlayGameCell", bundle: nil), forCellWithReuseIdentifier: cellIdentify)
        
        let widthCell = collectView.frame.width * 0.0999
        let heightCell = widthCell
        
        collectViewFlowLayout = UICollectionViewFlowLayout()
        collectViewFlowLayout.sectionInset = UIEdgeInsets.zero
        collectViewFlowLayout.minimumLineSpacing = 0
        collectViewFlowLayout.minimumInteritemSpacing = 0
        collectViewFlowLayout.itemSize = CGSize(width: widthCell ,height: heightCell)
        
        collectView.setCollectionViewLayout(collectViewFlowLayout, animated: true)
        
    }
    
    @objc func handleJoinRoom(_ notify: Notification){
        let data = notify.userInfo as! [String:Any]
        let id: String = data["id"] as! String
        self.Idroom = Int(id)!
        self.playGame = true
        
        updateUI(data["host"] as! String, data["guest"] as! String)
    }
    
    @objc func handlePlayGame(_ notify: Notification){
        let data = notify.userInfo as! [String:Any]
        let x = data["x"] as! Int
        let y = data["y"] as! Int
        let value = data["value"] as! Int
        
        if(value == 2 && self.isHost){ // receive data from guest
            let cell = collectView.cellForItem(at: IndexPath.init(row: y, section: x)) as! PlayGameCell
            cell.setData("flower")
            self.marix[x][y] = 2
            self.myTurn = true
        }
        
        if(value == 1 && !self.isHost){ // receive data from host
            let cell = collectView.cellForItem(at: IndexPath.init(row: y, section: x)) as! PlayGameCell
            cell.setData("leaf")
            self.marix[x][y] = 2
            self.myTurn = true
        }
        
    }
    
    @objc func handleGameResutlt(_ notify: Notification) {
        //let data = notify.userInfo as! [String:Any]
        self.dialogInfor("you lost !") {
            self.pop()
        }
    }
    
    func updateUI(_ hostName: String,_ guestName: String) {
        lbNameCompetitor.textColor = template.primaryColor
        if(self.isHost){
            lbNameCompetitor.text = guestName
            avatarCompetitor.image = UIImage(named: "avatarGuest")
            weaponCompetitor.image = UIImage(named: "flower")
        }else{
            lbNameCompetitor.text = hostName
            avatarCompetitor.image = UIImage(named: "avatarHost")
            weaponCompetitor.image = UIImage(named: "leaf")
        }
    }
    
    func setupUI(){
        lbNameSelf.text = accountDataManager.userInfor.username
        lbNameSelf.textColor = template.primaryColor
        if(self.isHost){
            avatarSelf.image = UIImage(named: "avatarHost")
            weaponSelf.image = UIImage(named: "leaf")
        }else{
            avatarSelf.image = UIImage(named: "avatarGuest")
            weaponSelf.image = UIImage(named: "flower")
        }
    }
    
    @objc func handleMessage(){
        
    }
    
    @IBAction func sendMessage(sender: UIButton){
        let viewMessage = MessageView()
        viewMessage.frame = viewChatSelf.frame
        viewMessage.center = viewChatSelf.center
        
        viewMessage.content = "co bao gio em nhow den anh nguoi oi !"
        
        viewChatSelf.addSubview(viewMessage)
        
        UIView.animate(withDuration: 6.0, delay: 0.1, options: .curveEaseOut, animations: {
            viewMessage.alpha = 0.5
        }) { (iscomplete) in
            viewMessage.removeFromSuperview()
        }
        
    }

}

extension PlayGameViewController: UICollectionViewDelegate, UICollectionViewDataSource{
     
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectView.dequeueReusableCell(withReuseIdentifier: cellIdentify, for: indexPath) as! PlayGameCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = indexPath.section
        let y = indexPath.row
        
        if(!self.playGame){ // host
            self.dialogError("waitting for competitor !")
            return
        }
        
        if(!self.myTurn){
            self.dialogError("It's not your turn !")
            return
        }
        
        if(self.marix[x][y] == 1 || self.marix[x][y] == 2){ // clicked
            return
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as! PlayGameCell
        if(self.isHost){
            cell.setData("leaf")
        }else{
            cell.setData("flower")
            
        }
        self.marix[x][y] = 1
        self.send(x, y)
        checkResult(x, y)

    }
    
    func checkResult(_ x: Int, _ y: Int) {
        if(Utils.checkResult(self.marix, x, y)){
            
            let data: NSDictionary = [
                "token" : accountDataManager.tokenID,
                "room_id" : self.Idroom,
                "sender" : accountDataManager.userInfor.username,
                "result" : " "
            ]
            webSocket.emit(header: .game_result, data: data)
            
            self.dialogInfor("you win!") {
                self.pop()
            }
            
        }
    }
    
    func send(_ x: Int,_ y: Int) {
        let data: NSDictionary = [
            "token" : accountDataManager.tokenID,
            "user_id" : accountDataManager.userInfor._id,
            "room_id" : self.Idroom,
            "x" : x,
            "y" : y
        ]
        
        webSocket.emit(header: .play_game, data: data) {
            self.myTurn = false
        }
    
    }
    
    
}
