//
//  Colors.swift
//  NewOPGG
//
//  Created by Jiyoun Moon on 2018. 7. 17..
//  Copyright © 2018년 Genetory. All rights reserved.
//

import UIKit

// MARK: - Device

let kDEVICE_WIDTH: CGFloat =                        UIScreen.main.bounds.size.width
let kDEVICE_HEIGHT: CGFloat =                       UIScreen.main.bounds.size.height

// MARK: - Navigation

let kNAVIGATION_BIG_HEIGHT: CGFloat =               100.0
let kNAVIGATION_SMALL_HEIGHT: CGFloat =             44.0

// MARK: - Radians

extension CGFloat {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
    var radiansToDegrees: CGFloat { return CGFloat(self) * 180 / .pi }
}

// MARK: - Color

let kNEON_GREEN =                       UIColor.init(red: 48/255, green: 255/255, blue: 150/255, alpha: 1.0)
let kNEON_GREEN_HIGHLIGHT =             UIColor.init(red: 38/255, green: 245/255, blue: 140/255, alpha: 1.0)

let kNAVY =                             UIColor.init(red: 76/255, green: 94/255, blue: 255/255, alpha: 1.0)
let kNAVY_HIGHLIGHT =                   UIColor.init(red: 66/255, green: 84/255, blue: 245/255, alpha: 1.0)
let kNAVY_DEEP =                        UIColor.init(red: 56/255, green: 74/255, blue: 235/255, alpha: 1.0)

let kBADGE =                            UIColor.init(red: 255/255, green: 19/255, blue: 61/255, alpha: 1.0)
let kBADGE_HIGHLIGHT =                  UIColor.init(red: 246/255, green: 9/255, blue: 51/255, alpha: 1.0)

let kCLEAR =                            UIColor.clear
let kCLEAR_HIGHLIGHT =                  UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.05)

let kBLACK =                            UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
let kBLACK_HIGHLIGHT =                  UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)

let kWHITE =                            UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
let kWHITE_HIGHLIGHT =                  UIColor.init(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)

let kGRAY_100 =                         UIColor.init(red: 247/255, green: 247/255, blue: 249/255, alpha: 1.0)
let kGRAY_100_HIGHLIGHT =               UIColor.init(red: 237/255, green: 237/255, blue: 239/255, alpha: 1.0)

let kGRAY_200 =                         UIColor.init(red: 235/255, green: 238/255, blue: 241/255, alpha: 1.0)
let kGRAY_200_HIGHLIGHT =               UIColor.init(red: 225/255, green: 228/255, blue: 231/255, alpha: 1.0)

let kGRAY_250 =                         UIColor.init(red: 216/255, green: 219/255, blue: 224/255, alpha: 1.0)
let kGRAY_250_HIGHLIGHT =               UIColor.init(red: 206/255, green: 209/255, blue: 214/255, alpha: 1.0)

let kGRAY_300 =                         UIColor.init(red: 197/255, green: 203/255, blue: 208/255, alpha: 1.0)
let kGRAY_300_HIGHLIGHT =               UIColor.init(red: 187/255, green: 193/255, blue: 198/255, alpha: 1.0)

let kGRAY_400 =                         UIColor.init(red: 152/255, green: 160/255, blue: 167/255, alpha: 1.0)
let kGRAY_400_HIGHLIGHT =               UIColor.init(red: 142/255, green: 150/255, blue: 157/255, alpha: 1.0)

let kGRAY_500 =                         UIColor.init(red: 123/255, green: 133/255, blue: 142/255, alpha: 1.0)
let kGRAY_500_HIGHLIGHT =               UIColor.init(red: 113/255, green: 123/255, blue: 132/255, alpha: 1.0)

let kGRAY_600 =                         UIColor.init(red: 82/255, green: 89/255, blue: 95/255, alpha: 1.0)
let kGRAY_600_HIGHLIGHT =               UIColor.init(red: 72/255, green: 79/255, blue: 85/255, alpha: 1.0)

let kGRAY_700 =                         UIColor.init(red: 51/255, green: 56/255, blue: 60/255, alpha: 1.0)
let kGRAY_700_HIGHLIGHT =               UIColor.init(red: 41/255, green: 46/255, blue: 50/255, alpha: 1.0)

let kGRAY_800 =                         UIColor.init(red: 30/255, green: 32/255, blue: 34/255, alpha: 1.0)
let kGRAY_800_HIGHLIGHT =               UIColor.init(red: 20/255, green: 22/255, blue: 24/255, alpha: 1.0)

let kGRAY_900 =                         UIColor.init(red: 19/255, green: 22/255, blue: 27/255, alpha: 1.0)
let kGRAY_900_HIGHLIGHT =               UIColor.init(red: 9/255, green: 12/255, blue: 17/255, alpha: 1.0)

let kMAIN_100 =                         UIColor.init(red: 236/255, green: 242/255, blue: 255/255, alpha: 1.0)
let kMAIN_100_HIGHLIGHT =               UIColor.init(red: 226/255, green: 232/255, blue: 245/255, alpha: 1.0)

let kMAIN_300 =                         UIColor.init(red: 171/255, green: 198/255, blue: 255/255, alpha: 1.0)
let kMAIN_300_HIGHLIGHT =               UIColor.init(red: 161/255, green: 188/255, blue: 245/255, alpha: 1.0)

let kMAIN_500 =                         UIColor.init(red: 83/255, green: 131/255, blue: 232/255, alpha: 1.0)
let kMAIN_500_HIGHLIGHT =               UIColor.init(red: 73/255, green: 121/255, blue: 222/255, alpha: 1.0)

let kMAIN_600 =                         UIColor.init(red: 65/255, green: 113/255, blue: 214/255, alpha: 1.0)
let kMAIN_600_HIGHLIGHT =               UIColor.init(red: 55/255, green: 103/255, blue: 204/255, alpha: 1.0)


let kRED_100 =                          UIColor.init(red: 255/255, green: 241/255, blue: 243/255, alpha: 1.0)
let kRED_100_HIGHLIGHT =                UIColor.init(red: 245/255, green: 231/255, blue: 233/255, alpha: 1.0)

let kRED_300 =                          UIColor.init(red: 255/255, green: 186/255, blue: 195/255, alpha: 1.0)
let kRED_300_HIGHLIGHT =                UIColor.init(red: 245/255, green: 176/255, blue: 185/255, alpha: 1.0)

let kRED_400 =                          UIColor.init(red: 255/255, green: 108/255, blue: 129/255, alpha: 1.0)
let kRED_400_HIGHLIGHT =                UIColor.init(red: 245/255, green: 98/255, blue: 119/255, alpha: 1.0)

let kRED_500 =                          UIColor.init(red: 232/255, green: 64/255, blue: 87/255, alpha: 1.0)
let kRED_500_HIGHLIGHT =                UIColor.init(red: 222/255, green: 54/255, blue: 77/255, alpha: 1.0)

let kRED_600 =                          UIColor.init(red: 203/255, green: 49/255, blue: 70/255, alpha: 1.0)
let kRED_600_HIGHLIGHT =                UIColor.init(red: 193/255, green: 39/255, blue: 60/255, alpha: 1.0)

let kRED_ALPHA =                        UIColor.init(red: 211/255, green: 26/255, blue: 69/255, alpha: 0.6)
let kRED_ALPHA_HIGHLIGHT =              UIColor.init(red: 201/255, green: 16/255, blue: 59/255, alpha: 0.6)

let kORANGE_100 =                       UIColor.init(red: 255/255, green: 236/255, blue: 220/255, alpha: 1.0)
let kORANGE_100_HIGHLIGHT =             UIColor.init(red: 245/255, green: 226/255, blue: 210/255, alpha: 1.0)

let kORANGE_500 =                       UIColor.init(red: 255/255, green: 121/255, blue: 5/255, alpha: 1.0)
let kORANGE_500_HIGHLIGHT =             UIColor.init(red: 245/255, green: 111/255, blue: 5/255, alpha: 1.0)

let kYELLOW_ALPHA =                     UIColor.init(red: 255/255, green: 169/255, blue: 5/255, alpha: 0.1)
let kYELLOW_ALPHA_HIGHLIGHT =           UIColor.init(red: 245/255, green: 159/255, blue: 5/255, alpha: 0.1)

let kYELLOW_500 =                       UIColor.init(red: 255/255, green: 169/255, blue: 5/255, alpha: 1.0)
let kYELLOW_500_HIGHLIGHT =             UIColor.init(red: 245/255, green: 159/255, blue: 5/255, alpha: 1.0)

let kGREEN_100 =                        UIColor.init(red: 233/255, green: 252/255, blue: 246/255, alpha: 1.0)
let kGREEN_100_HIGHLIGHT =              UIColor.init(red: 223/255, green: 242/255, blue: 236/255, alpha: 1.0)

let kGREEN_500 =                        UIColor.init(red: 10/255, green: 197/255, blue: 142/255, alpha: 1.0)
let kGREEN_500_HIGHLIGHT =              UIColor.init(red: 0/255, green: 187/255, blue: 132/255, alpha: 1.0)

let kGREEN_500_ALPHA =                  UIColor.init(red: 10/255, green: 197/255, blue: 142/255, alpha: 0.1)
let kGREEN_500_ALPHA_HIGHLIGHT =        UIColor.init(red: 0/255, green: 187/255, blue: 132/255, alpha: 0.1)

let kBLUE_100 =                         UIColor.init(red: 229/255, green: 245/255, blue: 255/255, alpha: 1.0)
let kBLUE_100_HIGHLIGHT =               UIColor.init(red: 219/255, green: 235/255, blue: 245/255, alpha: 1.0)

let kBLUE_500 =                         UIColor.init(red: 30/255, green: 161/255, blue: 247/255, alpha: 1.0)
let kBLUE_500_HIGHLIGHT =               UIColor.init(red: 20/255, green: 151/255, blue: 237/255, alpha: 1.0)

let kBLUE_ALPHA =                       UIColor.init(red: 76/255, green: 94/255, blue: 255/255, alpha: 0.6)
let kBLUE_ALPHA_HIGHLIGHT =             UIColor.init(red: 66/255, green: 84/255, blue: 245/255, alpha: 0.6)

let kBRONZE_500 =                       UIColor.init(red: 172/255, green: 157/255, blue: 133/255, alpha: 1.0)
let kBRONZE_500_HIGHLIGHT =             UIColor.init(red: 162/255, green: 147/255, blue: 123/255, alpha: 1.0)

let kSOLO_500 =                         UIColor.init(red: 207/255, green: 98/255, blue: 17/255, alpha: 1.0)
let kSOLO_500_HIGHLIGHT =               UIColor.init(red: 197/255, green: 88/255, blue: 7/255, alpha: 1.0)

let kSOLO_600 =                         UIColor.init(red: 172/255, green: 157/255, blue: 133/255, alpha: 1.0)
let kSOLO_600_HIGHLIGHT =               UIColor.init(red: 172/255, green: 157/255, blue: 133/255, alpha: 1.0)

let kDUO_500 =                          UIColor.init(red: 67/255, green: 165/255, blue: 160/255, alpha: 1.0)
let kDUO_500_HIGHLIGHT =                UIColor.init(red: 57/255, green: 155/255, blue: 150/255, alpha: 1.0)

let kDUO_600 =                          UIColor.init(red: 172/255, green: 157/255, blue: 133/255, alpha: 1.0)
let kDUO_600_HIGHLIGHT =                UIColor.init(red: 172/255, green: 157/255, blue: 133/255, alpha: 1.0)

let kSQUAD_500 =                        UIColor.init(red: 109/255, green: 104/255, blue: 172/255, alpha: 1.0)
let kSQUAD_500_HIGHLIGHT =              UIColor.init(red: 99/255, green: 94/255, blue: 162/255, alpha: 1.0)

let kSQUAD_600 =                        UIColor.init(red: 172/255, green: 157/255, blue: 133/255, alpha: 1.0)
let kSQUAD_600_HIGHLIGHT =              UIColor.init(red: 172/255, green: 157/255, blue: 133/255, alpha: 1.0)

let kTOP10 =                            UIColor.init(red: 82/255, green: 133/255, blue: 22/255, alpha: 1.0)
let kTOP10_HIGHLIGHT =                  UIColor.init(red: 72/255, green: 123/255, blue: 11/255, alpha: 1.0)

let kPURPLE_100 =                       UIColor.init(red: 243/255, green: 238/255, blue: 255/255, alpha: 1.0)
let kPURPLE_100_HIGHLIGHT =             UIColor.init(red: 233/255, green: 228/255, blue: 245/255, alpha: 1.0)

let kPURPLE_500 =                       UIColor.init(red: 139/255, green: 104/255, blue: 255/255, alpha: 1.0)
let kPURPLE_500_HIGHLIGHT =             UIColor.init(red: 129/255, green: 94/255, blue: 245/255, alpha: 1.0)

let kPINK_500 =                         UIColor.init(red: 255/255, green: 86/255, blue: 93/255, alpha: 1.0)
let kPINK_500_HIGHLIGHT =               UIColor.init(red: 245/255, green: 76/255, blue: 83/255, alpha: 1.0)
let kPINK_500_ALPHA =                   UIColor.init(red: 255/255, green: 86/255, blue: 93/255, alpha: 0.8)

let kTEAL_400 =                         UIColor.init(red: 0/255, green: 215/255, blue: 176/255, alpha: 1.0)
let kTEAL_400_HIGHLIGHT =               UIColor.init(red: 0/255, green: 205/255, blue: 166/255, alpha: 1.0)

let kTEAL_500 =                         UIColor.init(red: 0/255, green: 187/255, blue: 163/255, alpha: 1.0)
let kTEAL_500_HIGHLIGHT =               UIColor.init(red: 0/255, green: 177/255, blue: 153/255, alpha: 1.0)

let kLEVEL_1 =                          UIColor.init(red: 175/255, green: 175/255, blue: 175/255, alpha: 1.0)
let kLEVEL_1_HIGHLIGHT =                UIColor.init(red: 165/255, green: 165/255, blue: 165/255, alpha: 1.0)

let kLEVEL_2 =                          UIColor.init(red: 154/255, green: 182/255, blue: 215/255, alpha: 1.0)
let kLEVEL_2_HIGHLIGHT =                UIColor.init(red: 144/255, green: 172/255, blue: 205/255, alpha: 1.0)

let kLEVEL_3 =                          UIColor.init(red: 60/255, green: 81/255, blue: 174/255, alpha: 1.0)
let kLEVEL_3_HIGHLIGHT =                UIColor.init(red: 50/255, green: 71/255, blue: 164/255, alpha: 1.0)

let kLEVEL_4 =                          UIColor.init(red: 170/255, green: 64/255, blue: 167/255, alpha: 1.0)
let kLEVEL_4_HIGHLIGHT =                UIColor.init(red: 160/255, green: 54/255, blue: 157/255, alpha: 1.0)

let kLEVEL_5 =                          UIColor.init(red: 207/255, green: 143/255, blue: 75/255, alpha: 1.0)
let kLEVEL_5_HIGHLIGHT =                UIColor.init(red: 197/255, green: 133/255, blue: 65/255, alpha: 1.0)

let kGRAY =                             UIColor.init(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
let kGRAY_LIGHT =                       UIColor.init(red: 198/255, green: 198/255, blue: 198/255, alpha: 1.0)
