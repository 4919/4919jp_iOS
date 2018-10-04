//
//  Config.swift
//  jp4919
//
//  Created by shogo-ka on 2018/08/29.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

struct Config{
    
    enum urlStr : String{
        case areas = "https://api.github.com/repos/4919/opendata/contents/identifiers/areas.csv"
        case distribuors = "https://api.github.com/repos/4919/opendata/contents/identifiers/distributors.csv"
        case menusPath = "https://api.github.com/repos/4919/opendata/contents/menus/"
    }
}

enum Nutritions{
    case energy
    case protein
    case fat
    case iron
    case calcium
    case vitaminA
    case vitaminB1
    case vitaminB2
    case vitaminC
    case dietary_fiber
    case salt_equivalent
}
