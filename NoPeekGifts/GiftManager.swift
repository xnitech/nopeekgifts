//
//  GiftManager.swift
//  NoPeekGifts
//
//  Created by Mark Gruetzner on 11/7/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import UIKit

var giftMgr: GiftManager = GiftManager()

struct Gift {
   var name: String?
   var desc: String?
   
   init(name: String?, desc: String?) {
      self.name = name
      self.desc = desc
   }
}

class GiftManager: NSObject {

   var gifts:[Gift] = giftData
   
   func addGift(name: String, desc: String)
   {
      gifts.append(Gift(name: name, desc: desc))
   }
   
   func addGift(gift: Gift)
   {
      gifts.append(gift)
   }
   
}
