//
//  ViewController.swift
//  WeydaEmily_ColorPaletteApp
//
//  Created by Emily Weyda on 5/25/16.
//  Copyright © 2016 University of Cincinnati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userColor : UIColor = UIColor.whiteColor()
    var canvas : UIImageView!
    var brushSize : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //initialize the canvas object to the size of the screen
        canvas = UIImageView(frame: view.frame)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var whiteSlider: UISlider!
    @IBOutlet weak var whiteLabel: UILabel!
    
    @IBOutlet weak var brushSizeSlider: UISlider!
    @IBOutlet weak var sizeLabel: UILabel!

    
    @IBAction func changeColor() {
        // 1. read slider value
        let redValue = redSlider.value
        let greenValue = greenSlider.value
        let blueValue = blueSlider.value
        let alphaValue = alphaSlider.value
        let whiteValue = whiteSlider.value
        brushSize = brushSizeSlider.value
        
        // 2. construct new color object
        let newColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaValue))
        
        // 2.3. retrieve hue/sat/bright
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha : CGFloat = 0
        
        newColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        let newColor2 = UIColor(hue: hue, saturation: saturation, brightness: CGFloat(whiteValue), alpha: alpha)
        
        // 2.5 assign color object to userColor property
        userColor = newColor2
        
        // 3. set the background of the view object
        colorView.backgroundColor = newColor2
        
        // 4. convert color component to text
        let redString = String.localizedStringWithFormat("%.0f", redValue * 255)
        let greenString = String.localizedStringWithFormat("%.0f", greenValue * 255)
        let blueString = String.localizedStringWithFormat("%.0f", blueValue * 255)
        let alphaString = String.localizedStringWithFormat("%.0f %%", alphaValue * 100)
        let whiteString = String.localizedStringWithFormat("%.0f", whiteValue * 255)
        let sizeString = String.localizedStringWithFormat("%.0f", brushSize)
        
        
        // 5. assign the color component to text property of label
        redLabel.text = redString
        greenLabel.text = greenString
        blueLabel.text = blueString
        alphaLabel.text = alphaString
        whiteLabel.text = whiteString
        sizeLabel.text = sizeString
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! ColorViewController
        destination.color = userColor
        destination.imageCanvas = canvas
        destination.brushSize = brushSize
    }

}

