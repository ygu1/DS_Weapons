//
//  ViewController.swift
//  DS Weapons
//
//  Created by Yanliang Gu on 5/10/16.
//  Copyright © 2016 Yanliang Gu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
//    let weaponNames: [String] = ["battle_axe","caestus","carthus_curved_greatsword","clerics_sacred_chime","dagger","estoc","great_scythe","greataxe","greatsword","halberd","hollowslayer_greatsword","knights_crossbow","longbow","longsword","mace","onislayer_greatbow","pyromancy_flame","scimitar","sorcerers_staff","spear","talisman","uchigatana","vordts_great_hammer","whip"]

    @IBOutlet weak var weaponCollectionTable: UICollectionView!

    private let reuseIdentifier = "WeaponTableCell"
    private let segueIdentifier = "ShowWeaponsSegue"
    
    var weaponKeys = [String]()
    
    var weapons = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        
        weaponCollectionTable.registerNib(UINib(nibName: "WeaponTableCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        weaponCollectionTable.delegate = self
        weaponCollectionTable.dataSource = self
        weaponCollectionTable.backgroundColor = UIColor.clearColor()
        
        if let path = NSBundle.mainBundle().pathForResource("WeaponTable", ofType: "plist") {
            weapons = NSDictionary(contentsOfFile: path)!
            weaponKeys = weapons.allKeys as! Array<String>
        }
        //print(weaponKeys)
        
        self.weaponCollectionTable.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func saveGameData() {
//        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
//        let documentsDirectory = paths.objectAtIndex(0) as! NSString
//        let path = documentsDirectory.stringByAppendingPathComponent("WeaponTable.plist")
//        var dict: NSMutableDictionary = NSMutableDictionary()
//        //saving values
//        for w in weaponNames {
//            dict.setObject(w+"-icon", forKey: w)
//        }
//        //...
//        //writing to GameData.plist
//        dict.writeToFile(path, atomically: false)
//        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
//        print("Saved GameData.plist file is --> \(resultDictionary?.description)")
//    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weaponKeys.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: WeaponTableCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! WeaponTableCollectionViewCell
        //cell.backgroundColor = UIColor.blueColor()
        let key = weaponKeys[indexPath.row] 
        cell.weaponImage.image = UIImage(named:(weapons.valueForKey(key) as! String))
        cell.weaponName.text = key as String
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        performSegueWithIdentifier(segueIdentifier, sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

}

