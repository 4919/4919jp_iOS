//
//  Illustration.swift
//  jp4919
//
//  Created by shogo-ka on 2018/10/03.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import Foundation
import UIKit

//
// メニュー名とイラストを対応づけるためのクラス
//

class Illustration:NSObject{
    func getIllustImage(menuName:String) -> UIImage{
        var illust:UIImage = UIImage()
        illust = UIImage(named: matchIllust(menuName: menuName))!
        return illust
    }
    
    // MEMO: 未対応イラストはThingsへ
    
    fileprivate func matchIllust(menuName:String) -> String{
        var illustName:String = "kobachi"
        
        if menuName.contains("ぎゅうにゅう"){
            illustName = "gyunyu"
        }else if menuName.contains("ごはん") {
            illustName = "gohan"
        }else if menuName.contains("パン") {
            illustName = "koppepan"
        }else if menuName == "ナン" {
            illustName = "nan"
        }else if menuName.contains("なっとう") {
            illustName = "nattou"
        }else if menuName.contains("カレー") {
            illustName = "curry"
        }else if menuName.contains("マーボー"){
            illustName = "mabodoufu"
        }else if menuName.contains("ハンバーグ"){
            illustName = "hamburg_steak"
        }else if (menuName.contains("からあげ") || menuName.contains("ナゲット")){
            illustName = "karaage"
        }else if (menuName.contains("サラダ") || menuName.contains("ほうれんそう") || menuName.contains("にびたし") || menuName.contains("アスパラ") || menuName.contains("ほうれんそう") || menuName.contains("ピーマン") || menuName.contains("こまつな") ){
            illustName = "kobachi"
        }else if (menuName.contains("ポトフ") || menuName.contains("スープ") || menuName.contains("シチュー") || menuName.contains("ミネストローネ")){
            illustName = "soup"
        }else if (menuName.contains("てんぷら") || menuName.contains("フライ") || menuName.contains("あげ")){
            illustName = "sakana_fly"
        }else if (menuName.contains("うどん") || menuName.contains("にゅうめん")  ){
            illustName = "udon"
        }else if (menuName.contains("みそしる") || menuName.contains("あかだし") || menuName.contains("じる")){
            illustName = "misoshiru"
        }else if menuName.contains("いため"){
            illustName = "yasaiitame"
        }else if menuName.contains("にくじゃが"){
            illustName = "nikujaga"
        }else if menuName.contains("しょうがやき"){
            illustName = "nikuitame"
        }else if (menuName.contains("さいきょうやき") || menuName.contains("しおやき")){
            illustName = "yakisakana"
        }else if menuName.contains("ドレッシング") {
            illustName = "dressing"
        }else if menuName.contains("ゼリー"){
            illustName = "jelly"
        }else if menuName.contains("フルーツ"){
            illustName = "fruit_punch"
        }else if menuName.contains("プリン"){
            illustName = "purin"
        }else if (menuName.contains("ナッツ") || menuName.contains(" アーモンド")){
            illustName = "nuts"
        }
        
        illustName = illustName + ".png"
        
        print(illustName)
        
        return illustName
    }
}
