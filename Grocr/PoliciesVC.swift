/*
 * Copyright (c) 2015 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class PoliciesVC: UITableViewController {

//  // MARK: Constants
//  let listToUsers = "ListToUsers"

  // MARK: Properties
  var items: [Policies] = []
  let ref = FIRDatabase.database().reference(withPath: "result")
//  //  let usersRef = FIRDatabase.database().reference(withPath: "online")
//  var user: User!
//  var userCountBarButtonItem: UIBarButtonItem!

  // MARK: UIViewController Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

//    tableView.allowsMultipleSelectionDuringEditing = false
//
//    userCountBarButtonItem = UIBarButtonItem(title: "1", style: .plain, target: self, action: #selector(userCountButtonDidTouch))
//    userCountBarButtonItem.tintColor = UIColor.white
//    navigationItem.leftBarButtonItem = userCountBarButtonItem
//
//    //    usersRef.observe(.value, with: { snapshot in
//    //      if snapshot.exists() {
//    //        self.userCountBarButtonItem?.title = snapshot.childrenCount.description
//    //      } else {
//    //        self.userCountBarButtonItem?.title = "0"
//    //      }
//    //    })
//
    // 1
//    //    let userID = Auth.auth().currentUser?.uid
//    let firstRes = ref.child("result").child("0")
//    ref.child("result").child("0").observeSingleEvent(of: .value, with: { (snapshot) in
//      // Get user value
//      print(snapshot.value)
//      // 2
//      var newItems: [Policies] = []
//
//      // 3
//////      let item = snapshot.children
////      let groceryItem = Policies(snapshot: firstRes as! FIRDataSnapshot)
////      newItems.append(groceryItem)
////      let value = snapshot.value as? NSDictionary
////      let groceryItem = value //Policies(snapshot: item as! FIRDataSnapshot)
////      let username = value?["username"] as? String ?? ""
////      let user = User(username: username)
//
//    }) { (error) in
//      print(error.localizedDescription)
//    }
    
    ref.child("0").queryOrdered(byChild: "completed").observe(.value, with: { snapshot in
      print(snapshot.value)
      // 2
      var newItems: [Policies] = []
      // 3
      let item = snapshot
//      let item = snapshot.children
//      for item in snapshot.children {
        // 4
        let groceryItem = Policies(snapshot: item as! FIRDataSnapshot)
        newItems.append(groceryItem)
//      }

      // 5
      self.items = newItems
      self.tableView.reloadData()
    })
    
    
//
//    user = User(uid: "FakeId", email: "hungry@person.food")
//
//    //    FIRAuth.auth()!.addStateDidChangeListener { auth, user in
//    //      guard let user = user else { return }
//    //      self.user = User(authData: user)
//
//    //      let currentUserRef = self.usersRef.child(self.user.uid)
//    //      currentUserRef.setValue(self.user.email)
//    //      currentUserRef.onDisconnectRemoveValue()
//    //    }
  }

  // MARK: UITableView Delegate methods

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
    let groceryItem = items[indexPath.row]

    cell.textLabel?.text = groceryItem.repeatInterval
    cell.detailTextLabel?.text = "isAnyTime:\(groceryItem.isAnyTime) fromTime:\(groceryItem.fromTime) toTime:\(groceryItem.toTime) startDate:\(groceryItem.startDate) expirationDate:\(groceryItem.expirationDate) connectivityMethodIds:\(groceryItem.connectivityMethodIds) on:\(groceryItem.on)"
    //    toggleCellCheckbox(cell, isCompleted: groceryItem.completed)

    return cell
  }
//
//  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//    return true
//  }

  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      //      items.remove(at: indexPath.row)
      let groceryItem = items[indexPath.row]
      groceryItem.ref?.removeValue()
      //      tableView.reloadData()
    }
  }

//  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    //    guard let cell = tableView.cellForRow(at: indexPath) else { return }
//    //    let groceryItem = items[indexPath.row]
//    //    let toggledCompletion = !groceryItem.completed
//    //    toggleCellCheckbox(cell, isCompleted: toggledCompletion)
//    //    groceryItem.ref?.updateChildValues([
//    //      "completed": toggledCompletion
//    //    ])
//    //    //    tableView.reloadData()
//  }
//
//  //  func toggleCellCheckbox(_ cell: UITableViewCell, isCompleted: Bool) {
//  //    if !isCompleted {
//  //      cell.accessoryType = .none
//  //      cell.textLabel?.textColor = UIColor.black
//  //      cell.detailTextLabel?.textColor = UIColor.black
//  //    } else {
//  //      cell.accessoryType = .checkmark
//  //      cell.textLabel?.textColor = UIColor.gray
//  //      cell.detailTextLabel?.textColor = UIColor.gray
//  //    }
//  //  }
//
  // MARK: Add Item

//  @IBAction func addButtonDidTouch(_ sender: AnyObject) {
//        let alert = UIAlertController(title: "Policy Item",
//                                      message: "Add an Item",
//                                      preferredStyle: .alert)
//    
//        let saveAction = UIAlertAction(title: "Save",
//                                       style: .default) { _ in
//            // 1
//            guard let textField = alert.textFields?.first,
//              let text = textField.text else { return }
//            // 2
//            let groceryItem = Policies(accessId: text,
//              isAnyTime: false, range: 0, repeatInterval: "everyDay",
//              on: [""], fromTime: "01:00:00", toTime: "16:00:00",
//              startDate: "2018-03-01T12:44:01.251Z", expirationDate: "2018-03-08T13:44:07.649Z",
//              connectivityMethodIds: [1,2,4])
//                    self.items.append(groceryItem)
//            //        self.tableView.reloadData()
//            // 3
//            let groceryItemRef = self.ref.child(text.lowercased())
//            // 4
//            groceryItemRef.setValue(groceryItem.toAnyObject())
//        }
//    
//        let cancelAction = UIAlertAction(title: "Cancel",
//                                         style: .default)
//    
//        alert.addTextField()
//    
//        alert.addAction(saveAction)
//        alert.addAction(cancelAction)
//    
//        present(alert, animated: true, completion: nil)
//  }
//
//  func userCountButtonDidTouch() {
//    performSegue(withIdentifier: listToUsers, sender: nil)
//  }

}
