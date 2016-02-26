/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike-
4.0 International License, by Yong Bakos.

*/

//Jeremy Mednik
//2/25/2016
//To create a clock to tell time

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel! //The label on the story board
    let clock = Clock() //Sets up the clock
    var timer: NSTimer?
    
    override func viewDidLoad() { //When it loads
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, //Creates a timer that repeats after a certain amount of time.
            target: self,
            selector: "updateTimeLabel",
            userInfo: nil, //Shows nothing
            repeats: true) //Repeats
    }
    
    override func viewWillAppear(animated: Bool) { //Overides the other functions.
        super.viewWillAppear(animated)
        super.viewDidLoad()
        let formatter = NSDateFormatter()
        formatter.timeStyle =  .MediumStyle //Updates by second
        timeLabel.text = formatter.stringFromDate(clock.currentTime) //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateTimeLabel() { //Updates the clock by the seccond.
        let formatter = NSDateFormatter()
        formatter.timeStyle =  .MediumStyle
        timeLabel.text = formatter.stringFromDate(clock.currentTime) //Selects it to the current time
    }
    
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask { //These constants are mask bits for specifying a view controller’s supported interface orientations.
        return UIInterfaceOrientationMask.All
    }
    
    deinit {
        if let timer = self.timer { //Deinitializes the program
            timer.invalidate()
        }
    }
    
}

