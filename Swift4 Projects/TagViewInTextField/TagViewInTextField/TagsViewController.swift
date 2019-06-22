//
//  TLTagsControl.swift
//  TagViewInTextField
//
//  Created by Rahul Chopra on 07/03/18.
//  Copyright © 2018 Clicks Bazaar. All rights reserved.
//

import UIKit



class TagsViewController: UIViewController, TLTagsControlDelegate {
    
    @IBOutlet weak var tagView: TLTagsControl!
    
    var demoTagControl = TLTagsControl()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let blueBackgroundColor = UIColor(red: 75.0/255.0, green: 186.0/255.0, blue: 251.0/255.0, alpha: 1.0)
        let textColor = UIColor.white
        
        
        let tags = ["A", "Tag", "One", "More", "Tag"]
        tagView.tags.addObjects(from: tags)
        tagView.tagPlaceholder = "Placeholder"
        tagView.reloadTagSubviews()
        
        tagView.tagsBackgroundColor = blueBackgroundColor
        tagView.tagsTextColor = textColor
        
        
        
        demoTagControl = TLTagsControl(frame: CGRect(x: 8, y: 340, width: self.view.frame.size.width - 16, height: 36), andTags: ["These", "Tags", "Are", "Tapable"], with: TLTagsControlMode.list)
        demoTagControl.reloadTagSubviews()
        demoTagControl.tapDelegate = self
        self.view.addSubview(demoTagControl)
        
        
        
    }
    
    
    
    func tagsControl(_ tagsControl: TLTagsControl!, tappedAt index: Int)
    {
        print("Tag \(tagsControl.tags[index]) was tapped")
    }
    
    func tagsControl(_ tagsControl: TLTagsControl!, removedAt index: Int) {
        
    }
    
    @IBAction func btnSave(_ sender: Any)
    {
        let arr = ["a","b","c"]
        let x = NSKeyedArchiver.archivedData(withRootObject: arr)
        print(x)
        
        CoreData.saveData(arrNumber: x)
        
    }
    
    @IBAction func btnFetch(_ sender: Any)
    {
        CoreData.fetchData()
        
        let indexPath = IndexPath()
        var arrayObject = [String]()
        
        for i in 0..<3
        {
            let tsk = task[i]
            // Convert it to an array
            let data = tsk.numbersArray
            let unarchiveObject = NSKeyedUnarchiver.unarchiveObject(with: data!)
            arrayObject = unarchiveObject as! [String]
        }
        
        
        
        print(arrayObject)
    }
    
}
