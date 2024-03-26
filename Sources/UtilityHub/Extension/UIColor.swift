// 
// Beeda Driver
//
// Created by Rakibur Khan on 30/10/22.
// Copyright © 2022 Beeda Inc. All rights reserved.
//

import UIKit

public extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.currentIndex = .init(utf16Offset: 1, in: hexString)
        }
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

public extension UIColor {
    class var color163BDE: UIColor {
        .init(hexString: "163BDE")
    }
    
    class var colorF1F3FF: UIColor {
        .init(hexString: "F1F3FF")
    }
    
    class var color202020: UIColor {
        .init(hexString: "202020")
    }
    
    class var colorEEEEEE: UIColor {
        .init(hexString: "EEEEEE")
    }
    
    class var color2E3A59: UIColor {
        .init(hexString: "2E3A59")
    }
    
    class var colorD2FFD4: UIColor {
        .init(hexString: "D2FFD4")
    }
    
    class var colorE9DCFE: UIColor {
        .init(hexString: "E9DCFE")
    }
    
    class var color2C0270: UIColor {
        .init(hexString: "2C0270")
    }
    
    class var color0D9F16: UIColor {
        .init(hexString: "0D9F16")
    }
    
    class var color979797: UIColor {
        .init(hexString: "979797")
    }
    
    class var colorC4C4C4: UIColor {
        .init(hexString: "C4C4C4")
    }
    
    class var color4CE166: UIColor {
        .init(hexString: "4CE166")
    }
    
    class var colorFFE3B4: UIColor {
        .init(hexString: "FFE3B4")
    }
    
    class var colorFFA000: UIColor {
        .init(hexString: "FFA000")
    }
    
    class var colorC9D3FF: UIColor {
        .init(hexString: "C9D3FF")
    }
    
    class var colorFAD6E6: UIColor {
        .init(hexString: "FAD6E6")
    }
    
    class var colorC31162: UIColor {
        .init(hexString: "C31162")
    }
    
    class var color828588: UIColor {
        .init(hexString: "828588")
    }
    
    class var colorDFE5FF: UIColor {
        .init(hexString: "DFE5FF")
    }
    
    class var colorFFB800: UIColor {
        .init(hexString: "FFB800")
    }
    
    class var color0CBB71: UIColor {
        .init(hexString: "0CBB71")
    }
    
    class var colorDCE2FF: UIColor {
        .init(hexString: "DCE2FF")
    }
    
    class var colorFFEF04: UIColor {
        .init(hexString: "FFEF04")
    }
    
    class var color0DB02B: UIColor {
        .init(hexString: "0DB02B")
    }
    
    class var colorFEC600: UIColor {
        .init(hexString: "FEC600")
    }
    
    class var color7B94FF: UIColor {
        .init(hexString: "7B94FF")
    }
    
    class var colorC3CDFF: UIColor {
        .init(hexString: "C3CDFF")
    }
    
    class var colorE1E1E1: UIColor {
        .init(hexString: "E1E1E1")
    }
    
    class var colorFFD4D0: UIColor {
        .init(hexString: "FFD4D0")
    }
    
    class var color8AA0C0: UIColor {
        .init(hexString: "8AA0C0")
    }
    
    class var color769CFF: UIColor {
        .init(hexString: "769CFF")
    }
    
    class var color8DA1FF: UIColor {
        .init(hexString: "8DA1FF")
    }
    
    class var colorFFF0C2: UIColor {
        .init(hexString: "FFF0C2")
    }
    
    class var colorF82814: UIColor {
        .init(hexString: "F82814")
    }
    
    class var colorFF6800: UIColor {
        .init(hexString: "FF6800")
    }
    
    class var colorFFE2CF: UIColor {
        .init(hexString: "FFE2CF")
    }
    
    class var color666666: UIColor {
        .init(hexString: "666666")
    }
    
    class var color9DAFFF: UIColor {
        .init(hexString: "9DAFFF")
    }
    
    class var color03CD2B: UIColor {
        .init(hexString: "03CD2B")
    }
    
    class var colorF1F2FF: UIColor {
        .init(hexString: "F1F2FF")
    }
    
    class var color031E93: UIColor {
        .init(hexString: "031E93")
    }
    
    class var colorCACCCE: UIColor {
        .init(hexString: "CACCCE")
    }
    
    class var colorFFEDD3: UIColor {
        .init(hexString: "FFEDD3")
    }
    
    class var colorAEEFBB: UIColor {
        .init(hexString: "AEEFBB")
    }
    
    class var colorFE9B0B: UIColor {
        .init(hexString: "FE9B0B")
    }
    
    class var colorFF4D00: UIColor {
        .init(hexString: "FF4D00")
    }
    
    class var colorFDE3CD: UIColor {
        .init(hexString: "FDE3CD)")
    }
    
    class var colorFF0000: UIColor {
        .init(hexString: "FF0000")
    }
    
    class var colorFFCBCB: UIColor {
        .init(hexString: "FFCBCB")
    }
    
    class var colorEC1C24: UIColor {
        .init(hexString: "EC1C24")
    }
    
    class var colorD4DCFF: UIColor {
        .init(hexString: "D4DCFF")
    }
    
    class var color44C868: UIColor {
        .init(hexString: "44C868")
    }
    
    class var colorFFC107: UIColor {
        .init(hexString: "FFC107")
    }
    
    class var color22ABF3: UIColor {
        .init(hexString: "22ABF3")
    }
    
    class var colorBDBDBD: UIColor {
        .init(hexString: "BDBDBD")
    }
    
    class var color1F272D: UIColor {
        .init(hexString: "1F272D")
    }
    
    class var colorE0E0E7: UIColor {
        .init(hexString: "E0E0E7")
    }
    
    class var colorFFECDB: UIColor {
        .init(hexString: "FFECDB")
    }
    
    class var colorFFF2E0: UIColor {
        .init(hexString: "FFF2E0")
    }
    
    class var colorDAFFFD: UIColor {
        .init(hexString: "DAFFFD")
    }
    
    class var colorFFEBF4: UIColor {
        .init(hexString: "FFEBF4")
    }
    
    class var colorD8FFDA: UIColor {
        .init(hexString: "D8FFDA")
    }
    
    class var colorFF7A00: UIColor {
        .init(hexString: "FF7A00")
    }
    
    class var colorE9EDFF: UIColor {
        .init(hexString: "E9EDFF")
    }
    
    class var colorF5F5F5: UIColor {
        .init(hexString: "F5F5F5")
    }
    
    class var colorF8F9ff: UIColor {
        .init(hexString: "F8F9ff")
    }
    
    class var colorB3B3B3: UIColor {
        .init(hexString: "B3B3B3")
    }
    
    class var colorF5F8FF: UIColor {
        .init(hexString: "F5F8FF")
    }
    class var colorF8FAFC: UIColor {
        .init(hexString: "F8FAFC")
    }
    
    class var color1BC12E: UIColor {
        .init(hexString: "1BC12E")
    }
    
    class var color3C76CB: UIColor {
        .init(hexString: "3C76CB")
    }
    
    class var colorCA4830: UIColor {
        .init(hexString: "CA4830")
    }
    
    class var color0081FF: UIColor {
        .init(hexString: "0081FF")
    }
    
    class var colorF8F9FF: UIColor {
        .init(hexString: "F8F9FF")
    }
    
    class var colorB8BCBF: UIColor {
        .init(hexString: "B8BCBF")
    }
    
    class var colorFFE2DF: UIColor {
        .init(hexString: "FFE2DF")
    }
    
    class var colorDE0000: UIColor {
        .init(hexString: "DE0000")
    }
    
    class var colorDDEDFF: UIColor {
        .init(hexString: "DDEDFF")
    }
    
    class var colorCCFFFC: UIColor {
        .init(hexString: "CCFFFC")
    }
    
    class var colorF8E9FF: UIColor {
        .init(hexString: "F8E9FF")
    }
    
    class var colorE7FFDA: UIColor {
        .init(hexString: "E7FFDA")
    }
    
    class var colorDEFFF1: UIColor {
        .init(hexString: "DEFFF1")
    }
    
    class var color0C22A7: UIColor {
        .init(hexString: "0C22A7")
    }
    
    class var colorFE9711: UIColor {
        .init(hexString: "FE9711")
    }
    
    class var colorD7FFC1: UIColor {
        .init(hexString: "D7FFC1")
    }
    
    class var color003B72: UIColor {
        .init(hexString: "003B72")
    }
    
    class var colorA2CFFE: UIColor {
        .init(hexString: "A2CFFE")
    }
    
    class var color9C2CF3: UIColor {
        .init(hexString: "9C2CF3")
    }
    
    class var color3A49F9: UIColor {
        .init(hexString: "3A49F9")
    }
    
    class var colorF9C823: UIColor {
        .init(hexString: "F9C823")
    }
    
    class var colorFAA03C: UIColor {
        .init(hexString: "FAA03C")
    }
    
    class var colorFB7855: UIColor {
        .init(hexString: "FB7855")
    }
    
    class var colorFC506E: UIColor {
        .init(hexString: "FC506E")
    }
    
    class var color67126B: UIColor {
        .init(hexString: "67126B")
    }
    
    class var colorA92495: UIColor {
        .init(hexString: "A92495")
    }
    
    class var colorCF349E: UIColor {
        .init(hexString: "CF349E")
    }
    
    class var color0968E5: UIColor {
        .init(hexString: "0968E5")
    }
    
    class var color091970: UIColor {
        .init(hexString: "091970")
    }
    
    class var color0DA6C2: UIColor {
        .init(hexString: "0DA6C2")
    }
    
    class var color0E39C6: UIColor {
        .init(hexString: "0E39C6")
    }
    
    class var color780C67: UIColor {
        .init(hexString: "780C67")
    }
    
    class var color940967: UIColor {
        .init(hexString: "940967")
    }
    
    class var colorB10667: UIColor {
        .init(hexString: "B10667")
    }
    
    class var colorD90266: UIColor {
        .init(hexString: "D90266")
    }
    
    class var color354AA5: UIColor {
        .init(hexString: "354AA5")
    }
    
    class var colorFF8C02: UIColor {
        .init(hexString: "FF8C02")
    }
    
    class var color00A59B: UIColor {
        .init(hexString: "00A59B")
    }
    
    class var colorC0FFFB: UIColor {
        .init(hexString: "C0FFFB")
    }
    
    class var colorFFF5E7: UIColor {
        .init(hexString: "FFF5E7")
    }
    
    class var colorDAFFE0: UIColor {
        .init(hexString: "DAFFE0")
    }
    
    class var color282829: UIColor {
        .init(hexString: "282829")
    }
    
    class var color9A92FF: UIColor {
        .init(hexString: "9A92FF")
    }
    
    class var color47418B: UIColor {
        .init(hexString: "47418B")
    }
    
    class var colorD7D7FF: UIColor {
        .init(hexString: "D7D7FF")
    }
    
    class var color212121: UIColor {
        .init(hexString: "212121")
    }
    
    class var colorFFF3EA: UIColor {
        .init(hexString: "FFF3EA")
    }
    
    class var color00A88A: UIColor {
        .init(hexString: "00A88A")
    }
    
    class var colorEAFFFB: UIColor {
        .init(hexString: "EAFFFB")
    }
    
    class var colorD8FFFD: UIColor {
        .init(hexString: "D8FFFD")
    }
    
    static var colorB6B6B6: UIColor {
        .init(hexString: "B6B6B6")
    }
    
    static var colorF4F4F5: UIColor {
        .init(hexString: "F4F4F5")
    }
    
    static var color000000: UIColor {
        .init(hexString: "000000")
    }
    
    static var colorE7EBFE: UIColor {
        .init(hexString: "E7EBFE")
    }
}
