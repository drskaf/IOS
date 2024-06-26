//
//  TableViewController.swift
//  Meme 1.0
//
//  Created by Ebraham Alskaf on 25/03/2024.
//

import UIKit

class tableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Model
    
    var memes: [Meme] {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View LIfe Cycle
    
    override func viewDidLoad() {
         super.viewDidLoad()
     }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }

    // MARK: Table View Data Source Methods
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return memes.count
    }

    // cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
        
        let meme = memes[indexPath.row]
        
        cell.imageView?.image = meme.memedImage
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController =
        self.storyboard!
            .instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        
        detailController.meme = self.memes[indexPath.row]
        present(detailController, animated: true, completion: nil)
        // Deselect the selected row after presenting the detail view controller
            tableView.deselectRow(at: indexPath, animated: true)

    }

}
