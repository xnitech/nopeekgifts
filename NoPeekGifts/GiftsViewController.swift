//
//  FirstViewController.swift
//  NoPeekGifts
//
//  Created by Mark Gruetzner on 10/31/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import UIKit

class GiftsViewController: UITableViewController {

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 1
   }
   
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return giftMgr.gifts.count
   }
   
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
      -> UITableViewCell {
         let cell = tableView.dequeueReusableCellWithIdentifier("GiftCell", forIndexPath: indexPath)
         
         let gift = giftMgr.gifts[indexPath.row] as Gift
         cell.textLabel?.text = gift.name
         cell.detailTextLabel?.text = gift.desc
         return cell
   }
   
   override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
   {
      if editingStyle == UITableViewCellEditingStyle.Delete {
         giftMgr.gifts.removeAtIndex(indexPath.row)
         tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
      }
   }
   
   @IBAction func cancelToGiftsViewController(segue:UIStoryboardSegue) {
   }
   
   @IBAction func saveGiftDetail(segue:UIStoryboardSegue)
   {
      if let giftDetailsViewController = segue.sourceViewController as? GiftDetailsViewController {
         
         if let gift = giftDetailsViewController.giftDetails
         {
            // Add gift
            giftMgr.addGift(gift)
            
            // Update the tableView
            let indexPath = NSIndexPath(forRow: giftMgr.gifts.count-1, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
         }
      }
   }

}

