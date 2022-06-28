//
//  ViewController.swift
//  20220624-SiddhantGupta-NYCSchools
//
//  Created by Siddhant Gupta on 6/22/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var schoolsTableView: UITableView!
    var spinner = UIActivityIndicatorView(style: .large)
    var isShowingSpinner : Bool = false
    
    //MARK: SETUP
    override func viewDidLoad() {
        super.viewDidLoad()
        self.schoolsTableView.delegate = self
        self.schoolsTableView.dataSource = self
        self.schoolsTableView.separatorStyle = .none
        self.schoolsTableView.estimatedRowHeight = 120
        self.schoolsTableView.register(UINib(nibName: "SchoolInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "SchoolInfoTableViewCell")
        
        //Get Schools info
        showAndHideSpinner(showSpinner: true)
        SchoolsListManager.sharedManager.reloadSchoolsList { success in
            if(success){
                self.schoolsTableView.reloadData()
                self.showAndHideSpinner(showSpinner: false)
            }else{
                self.showAndHideSpinner(showSpinner: false)
                let alert = UIAlertController(title: "Sorry!", message: "Something went wrong :(", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                //TODO Should add some reload logic based on reason for error. For example loading timeouts
            }
        }
       
        //Get SAT info
        self.schoolsTableView.allowsSelection = false
        SATManager.sharedManager.reloadSATList { success in
            if(success){
                self.schoolsTableView.allowsSelection = true
                
            }else{
                
                let alert = UIAlertController(title: "Sorry!", message: "Something went wrong :(", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                //TODO Should add some reload logic based on reason for error. For example loading timeouts
            }
        }
        
    }

    //MARK: Table View methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SchoolsListManager.sharedManager.getSchoolsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolInfoTableViewCell", for: indexPath) as! SchoolInfoTableViewCell
        cell.setupCellWithSchool(school: SchoolsListManager.sharedManager.getSchoolAtIndex(schoolIndex: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schoolDetailViewController = SchoolDetailViewController(nibName: "SchoolDetailViewController", bundle: Bundle.main)
        let currentSchool = SchoolsListManager.sharedManager.getSchoolAtIndex(schoolIndex: indexPath.row)
        let SATScore = SATManager.sharedManager.getSATForDBN(dbn: currentSchool.DBN)
        self.present(schoolDetailViewController, animated: true, completion: nil)
        schoolDetailViewController.setupView(with: currentSchool, satScores: SATScore)
        
    }

    //MARK: LOADING
    func showAndHideSpinner (showSpinner : Bool){           //Loading indicator for network call
        if(showSpinner){
            self.view.addSubview(spinner)
            spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            spinner.translatesAutoresizingMaskIntoConstraints = false
            spinner.startAnimating()
        }else{
            spinner.removeFromSuperview()
        }
           
    }
}

