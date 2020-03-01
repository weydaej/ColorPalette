//
//  ColorViewController.swift
//  WeydaEmily_ColorPaletteApp
//
//  Created by Emily Weyda on 6/1/16.
//  Copyright © 2016 University of Cincinnati. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    var color : UIColor!
    var imageCanvas : UIImageView!
    var path : UIBezierPath = UIBezierPath()
    var brushSize : Float!
    
    @IBAction func undo() {
        path.removeAllPoints()
        imageCanvas.image = nil
    }
    
    @IBAction func save(sender: AnyObject) {
        UIImageWriteToSavedPhotosAlbum(imageCanvas.image!, nil, nil, nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = color
        view.addSubview(imageCanvas)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 1. capture user touch
        let userTouch = touches.first!
        // 2. capture the location point
        let startingPoint = userTouch.locationInView(imageCanvas)
        // 3. start the path with the location point
        path.moveToPoint(startingPoint)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 1. capture the user touch
        let userTouch = touches.first!
        // 2. capture the user location
        let currentPoint = userTouch.locationInView(imageCanvas)
        // 3. add the point to path
        path.addLineToPoint(currentPoint)
        // 4. draw a line between the points
        UIGraphicsBeginImageContext(imageCanvas.frame.size)
        imageCanvas.image?.drawInRect(imageCanvas.frame)
        color.setStroke()
        path.lineWidth = CGFloat(brushSize)
        path.stroke()
        imageCanvas.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
