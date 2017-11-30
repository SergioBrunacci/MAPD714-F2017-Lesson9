//
//  FontSizesViewController.swift
//  MAPD714-F2017-Lesson9
//
//  Created by Sergio de Almeida Brunacci on 2017-11-29.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import UIKit

class FontSizesViewController: UITableViewController {
    
    var font: UIFont!
    private static let pointSizes: [CGFloat] = [9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144]
    private static let cellIdentifier = "FontNameAndSize"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = FontSizesViewController.pointSizes[0]
    }
    
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont {
        let pointSize = FontSizesViewController.pointSizes[indexPath.row]
        return font.withSize(pointSize)
    }
    
    //MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FontSizesViewController.pointSizes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FontSizesViewController.cellIdentifier, for: indexPath)
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text = "\(FontSizesViewController.pointSizes[indexPath.row]) point"
        return cell
    }

       

}
