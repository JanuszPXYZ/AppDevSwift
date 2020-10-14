//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Janusz Polowczyk on 13/10/2020.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    var athlete: Athlete?
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var leagueTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    
    func updateView() {
        if let correctAthlete = athlete {
            nameTextField.text = correctAthlete.name
            ageTextField.text = correctAthlete.age
            leagueTextField.text = correctAthlete.league
            teamTextField.text = correctAthlete.team
        }
        
    }
    
    @IBAction func saveAthleteButton(_ sender: Any) {
        guard let name = nameTextField.text,
            let age = ageTextField.text,
            let league = leagueTextField.text,
            let team = teamTextField.text else { return }
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: "AthleteList", sender: self)
    }

    
}
