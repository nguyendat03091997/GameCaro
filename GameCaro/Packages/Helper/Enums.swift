//
//  Enums.swift
//  GameCaro
//
//  Created by Mojave on 10/2/19.
//  Copyright © 2019 DatNguyen. All rights reserved.
//

import Foundation

enum APIFunc: String {
    case login          = "/login"
    case register       = "/register"
    case allroom        = "/allroom"
    case rank           = "/user"
    case create_room    = "/create-room"
}

enum Header: String{
    case authenticated  = "authenticated"
    case create_room    = "create_room"
    case join_room      = "join_room"
    case play_game      = "play_game"
    case chat           = "chat"
    case game_result    = "game_result"
    case rank           = "rank"
}
