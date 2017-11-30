//
//  FontInfoViewController.swift
//  MAPD714-F2017-Lesson9
//
//  Created by Sergio de Almeida Brunacci on 2017-11-29.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

class FontInfoViewController: UIViewController {
    
    var font: UIFont!
    var favourite: Bool = false
    @IBOutlet weak var fontSampleLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var favouriteSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fontSampleLabel.font = font
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVv" + "WwXxYyZz 0123456789"
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favouriteSwitch.isOn = favourite
        
    }
    
    @IBAction func slideFontSize(slider: UISlider){
        let newSize = roundf(slider.value)
        fontSampleLabel.font = font.withSize(CGFloat(newSize))
        fontSizeLabel.text = "\(Int(newSize))"
    }
    
    @IBAction func toggleFavourite(sender: UISwitch){
        let favouritesList = FavouritesList.sharedFavouritesList
        if sender.isOn{
            favouritesList.addFavourites(fontName: font.fontName)
        }else{
            favouritesList.removeFavourite(fontName: font.fontName)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
