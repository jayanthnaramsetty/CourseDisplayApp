//
//  ViewController.swift
//  CourseDisplayApp
//
//  Created by Naramsetty,Jayanth on 2/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ImageViewOutlet: UIImageView!
    @IBOutlet weak var crsnum: UILabel!
    @IBOutlet weak var crsTitle: UILabel!
    @IBOutlet weak var crsSemester: UILabel!
    @IBOutlet weak var PreviousButton: UIButton!
    @IBOutlet weak var NextButton: UIButton!
  
    let courses = [["img01","44555","Network Security","Fall 2022"],
                   ["img02","44643","ios","Spring 2022"],
                   ["img03","44656","Streaming Data","Summer 2022"]]
    
    var imageNumber  = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Load the details(image, num, title and sem) of the first(0th element) course
        
        updateUI(imageNumber);
        
        // Previous button is disabled
        PreviousButton.isEnabled = false;
    
    }

    @IBAction func PreviousButtonClicked(_ sender: UIButton) {
        //nextbutton should be enabled
        NextButton.isEnabled = true
        //update the UI
        imageNumber -= 1
        updateUI(imageNumber)
        //if the course is at the 0th position, previous button should be disabled
        if(imageNumber == 0){
            PreviousButton.isEnabled = false
        }
    }
    
    @IBAction func NextButtonClicked(_ sender: UIButton) {
        //UI should be updated with the next course details
        imageNumber+=1
        updateUI(imageNumber)
        //previous button should be enabled
        PreviousButton.isEnabled = true
        
        //Once reaching the end of courses array the next button should be disabled
        if(imageNumber == courses.count-1){
            NextButton.isEnabled = false
        }
        
    }
    
    func updateUI(_ imageNumber:Int){
        ImageViewOutlet.image = UIImage(named: courses[imageNumber][0])
        crsnum.text = courses[imageNumber][1]
        crsTitle.text = courses[imageNumber][2]
        crsSemester.text = courses[imageNumber][3]
    }
    
}

