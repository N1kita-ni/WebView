//
//  Information.swift
//  WebViewExample
//
//  Created by Никита Ничепорук on 6/24/21.
//  Copyright © 2021 Никита Ничепорук. All rights reserved.
//

import UIKit

class Information: UIViewController {

    @IBOutlet weak var labelInformation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelInformation.text = "Это тестовый браузер ученика школы TeachMeSkills - Ничепорук Никиты"
    }

}
