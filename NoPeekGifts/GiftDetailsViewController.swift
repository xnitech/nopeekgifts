//
//  GiftDetailsViewControllerTableViewController.swift
//  NoPeekGifts
//
//  Created by Mark Gruetzner on 11/7/15.
//  Copyright © 2015 XNI Technologies, LLC. All rights reserved.
//

import UIKit

class GiftDetailsViewController: UITableViewController {
   @IBOutlet weak var nameTextField: UITextField!
   @IBOutlet weak var descTextField: UITextField!

   var giftDetails: Gift?
   
   required init?(coder aDecoder: NSCoder) {
      print("init GiftDetailsViewController")
      super.init(coder: aDecoder)
   }
   
   deinit {
      print("deinit GiftDetailsViewController")
   }
   
   override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
   {
      if indexPath.section == 0  && indexPath.row == 0 {
         nameTextField.becomeFirstResponder()
      }
      else if indexPath.section == 1  && indexPath.row == 0 {
         descTextField.becomeFirstResponder()
      }
   }
   
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      if segue.identifier == "SaveGiftDetail" {
         giftDetails = Gift(name: nameTextField.text!, desc: descTextField.text!)
      }
   }

}
