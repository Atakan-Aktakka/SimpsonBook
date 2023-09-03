//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Atakan Aktakka on 3.09.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        //objects
        let homer = Simpson(simpsonName: "Homer", simpsonJob: "Inspector", simpsonImage: UIImage(named: "homer")!)
        let marge = Simpson(simpsonName: "Marge", simpsonJob: "TV moms", simpsonImage: UIImage(named: "bart")!)
        let bart = Simpson(simpsonName: "Bart", simpsonJob: "Video Gamer", simpsonImage: UIImage(named: "chilf")!)
        let maggie = Simpson(simpsonName: "Maggie", simpsonJob: "baby", simpsonImage: UIImage(named: "maggie")!)
        let Lisa = Simpson(simpsonName: "Lisa", simpsonJob: "Student", simpsonImage: UIImage(named: "Lisa")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(maggie)
        mySimpsons.append(Lisa)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
}

