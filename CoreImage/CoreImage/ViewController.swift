//
//  ViewController.swift
//  CoreImage
//
//  Created by Chris Eidhof on 07/01/15.
//  Copyright (c) 2015 Chris Eidhof. All rights reserved.
//

import Cocoa
import Quartz

extension NSImage {
    public convenience init(image: CIImage) {
        let rep = NSBitmapImageRep(CIImage: image)
        self.init(size: rep.size)
        self.addRepresentation(rep)
    }
}

// func blur(radius: Double, image: CIImage) -> CIImage
// func overlay(color: NSColor: image: CIImage) -> CIImage


class ViewController: NSViewController {

    @IBOutlet var imageView: NSImageView?
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string:"http://static.q42.nl/images/q42hq.jpg")!
        let inputImage = CIImage(contentsOfURL: url)

        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter.setDefaults()
        blurFilter.setValue(inputImage, forKey: kCIInputImageKey)
        blurFilter.setValue(5.0, forKey: kCIInputRadiusKey)
        let blurredImage = blurFilter.valueForKey(kCIOutputImageKey) as CIImage

        let colorGenerator = CIFilter(name: "CIConstantColorGenerator")
        colorGenerator.setDefaults()
        colorGenerator.setValue(NSColor.redColor().colorWithAlphaComponent(0.2), forKey: kCIInputColorKey)
        let colorImage = colorGenerator.valueForKey(kCIOutputImageKey) as CIImage

        let sourceOver = CIFilter(name: "CISourceOverCompositing")
        sourceOver.setDefaults()
        sourceOver.setValue(colorImage, forKey: kCIInputImageKey)
        sourceOver.setValue(blurredImage, forKey: kCIInputBackgroundImageKey)
        let composited = sourceOver.valueForKey(kCIOutputImageKey) as CIImage

        let resultImage = composited.imageByCroppingToRect(inputImage.extent())


        self.imageView?.image = NSImage(image: inputImage)

        // TODO change `inputImage` to `blurredImage`, and later to `result`
        // TODO: write a top-level function blur (type is defined above)
        // TODO: write a top-level function colorOverlay

        // BONUS: find your favorite filter from http://tinyurl.com/o3uudu4 and wrap it in a function
    }

}

