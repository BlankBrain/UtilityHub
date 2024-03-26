// 
// 
//
// Created by Rakibur Khan on 17/5/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import SwiftUI

public extension Color {
    init(hexString: String, alpha: Double = 1.0) {
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
        let red   = Double(r) / 255.0
        let green = Double(g) / 255.0
        let blue  = Double(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

public extension Color {
    static var color163BDE: Color {
        .init(hexString: "163BDE")
    }
    
    static var colorF1F3FF: Color {
        .init(hexString: "F1F3FF")
    }
    
    static var color202020: Color {
        .init(hexString: "202020")
    }
    
    static var colorEEEEEE: Color {
        .init(hexString: "EEEEEE")
    }
    
    static var color2E3A59: Color {
        .init(hexString: "2E3A59")
    }
    
    static var colorD2FFD4: Color {
        .init(hexString: "D2FFD4")
    }
    
    static var colorE9DCFE: Color {
        .init(hexString: "E9DCFE")
    }
    
    static var color2C0270: Color {
        .init(hexString: "2C0270")
    }
    
    static var color0D9F16: Color {
        .init(hexString: "0D9F16")
    }
    
    static var color979797: Color {
        .init(hexString: "979797")
    }
    
    static var colorC4C4C4: Color {
        .init(hexString: "C4C4C4")
    }
    
    static var color4CE166: Color {
        .init(hexString: "4CE166")
    }
    
    static var colorFFE3B4: Color {
        .init(hexString: "FFE3B4")
    }
    
    static var colorFFA000: Color {
        .init(hexString: "FFA000")
    }
    
    static var colorC9D3FF: Color {
        .init(hexString: "C9D3FF")
    }
    
    static var colorFAD6E6: Color {
        .init(hexString: "FAD6E6")
    }
    
    static var colorC31162: Color {
        .init(hexString: "C31162")
    }
    
    static var color828588: Color {
        .init(hexString: "828588")
    }
    
    static var colorDFE5FF: Color {
        .init(hexString: "DFE5FF")
    }
    
    static var colorFFB800: Color {
        .init(hexString: "FFB800")
    }
    
    static var color0CBB71: Color {
        .init(hexString: "0CBB71")
    }
    
    static var colorDCE2FF: Color {
        .init(hexString: "DCE2FF")
    }
    
    static var colorFFEF04: Color {
        .init(hexString: "FFEF04")
    }
    
    static var color0DB02B: Color {
        .init(hexString: "0DB02B")
    }
    
    static var colorFEC600: Color {
        .init(hexString: "FEC600")
    }
    
    static var color7B94FF: Color {
        .init(hexString: "7B94FF")
    }
    
    static var colorC3CDFF: Color {
        .init(hexString: "C3CDFF")
    }
    
    static var colorE1E1E1: Color {
        .init(hexString: "E1E1E1")
    }
    
    static var colorFFD4D0: Color {
        .init(hexString: "FFD4D0")
    }
    
    static var color8AA0C0: Color {
        .init(hexString: "8AA0C0")
    }
    
    static var color769CFF: Color {
        .init(hexString: "769CFF")
    }
    
    static var color8DA1FF: Color {
        .init(hexString: "8DA1FF")
    }
    
    static var colorFFF0C2: Color {
        .init(hexString: "FFF0C2")
    }
    
    static var colorF82814: Color {
        .init(hexString: "F82814")
    }
    
    static var colorFF6800: Color {
        .init(hexString: "FF6800")
    }
    
    static var colorFFE2CF: Color {
        .init(hexString: "FFE2CF")
    }
    
    static var color666666: Color {
        .init(hexString: "666666")
    }
    
    static var color9DAFFF: Color {
        .init(hexString: "9DAFFF")
    }
    
    static var color03CD2B: Color {
        .init(hexString: "03CD2B")
    }
    
    static var colorF1F2FF: Color {
        .init(hexString: "F1F2FF")
    }
    
    static var color031E93: Color {
        .init(hexString: "031E93")
    }
    
    static var colorCACCCE: Color {
        .init(hexString: "CACCCE")
    }
    
    static var colorFFEDD3: Color {
        .init(hexString: "FFEDD3")
    }
    
    static var colorAEEFBB: Color {
        .init(hexString: "AEEFBB")
    }
    
    static var colorFE9B0B: Color {
        .init(hexString: "FE9B0B")
    }
    
    static var colorFF4D00: Color {
        .init(hexString: "FF4D00")
    }
    
    static var colorFDE3CD: Color {
        .init(hexString: "FDE3CD)")
    }
    
    static var colorFF0000: Color {
        .init(hexString: "FF0000")
    }
    
    static var colorFFCBCB: Color {
        .init(hexString: "FFCBCB")
    }
    
    static var colorEC1C24: Color {
        .init(hexString: "EC1C24")
    }
    
    static var colorD4DCFF: Color {
        .init(hexString: "D4DCFF")
    }
    
    static var color44C868: Color {
        .init(hexString: "44C868")
    }
    
    static var colorFFC107: Color {
        .init(hexString: "FFC107")
    }
    
    static var color22ABF3: Color {
        .init(hexString: "22ABF3")
    }
    
    static var colorBDBDBD: Color {
        .init(hexString: "BDBDBD")
    }
    
    static var color1F272D: Color {
        .init(hexString: "1F272D")
    }
    
    static var colorE0E0E7: Color {
        .init(hexString: "E0E0E7")
    }
    
    static var colorFFECDB: Color {
        .init(hexString: "FFECDB")
    }
    
    static var colorFFF2E0: Color {
        .init(hexString: "FFF2E0")
    }
    
    static var colorDAFFFD: Color {
        .init(hexString: "DAFFFD")
    }
    
    static var colorFFEBF4: Color {
        .init(hexString: "FFEBF4")
    }
    
    static var colorD8FFDA: Color {
        .init(hexString: "D8FFDA")
    }
    
    static var colorFF7A00: Color {
        .init(hexString: "FF7A00")
    }
    
    static var colorE9EDFF: Color {
        .init(hexString: "E9EDFF")
    }
    
    static var colorF5F5F5: Color {
        .init(hexString: "F5F5F5")
    }
    static var colorF8F9ff: Color {
        .init(hexString: "F8F9ff")
    }
    
    static var colorF8FAFC: Color {
        .init(hexString: "F8FAFC")
    }
    
    static var color1BC12E: Color {
        .init(hexString: "1BC12E")
    }
    
    static var color3C76CB: Color {
        .init(hexString: "3C76CB")
    }
    
    static var colorCA4830: Color {
        .init(hexString: "CA4830")
    }
    
    static var color0081FF: Color {
        .init(hexString: "0081FF")
    }
    
    static var colorF8F9FF: Color {
        .init(hexString: "F8F9FF")
    }
    
    static var colorB8BCBF: Color {
        .init(hexString: "B8BCBF")
    }
    
    static var colorFFE2DF: Color {
        .init(hexString: "FFE2DF")
    }
    
    static var colorDE0000: Color {
        .init(hexString: "DE0000")
    }
    
    static var colorDDEDFF: Color {
        .init(hexString: "DDEDFF")
    }
    
    static var colorCCFFFC: Color {
        .init(hexString: "CCFFFC")
    }
    
    static var colorF8E9FF: Color {
        .init(hexString: "F8E9FF")
    }
    
    static var colorE7FFDA: Color {
        .init(hexString: "E7FFDA")
    }
    
    static var colorDEFFF1: Color {
        .init(hexString: "DEFFF1")
    }
    
    static var color0C22A7: Color {
        .init(hexString: "0C22A7")
    }
    
    static var colorFE9711: Color {
        .init(hexString: "FE9711")
    }
    
    static var colorD7FFC1: Color {
        .init(hexString: "D7FFC1")
    }
    
    static var color003B72: Color {
        .init(hexString: "003B72")
    }
    
    static var colorA2CFFE: Color {
        .init(hexString: "A2CFFE")
    }
    
    static var color9C2CF3: Color {
        .init(hexString: "9C2CF3")
    }
    
    static var color3A49F9: Color {
        .init(hexString: "3A49F9")
    }
    
    static var colorF9C823: Color {
        .init(hexString: "F9C823")
    }
    
    static var colorFAA03C: Color {
        .init(hexString: "FAA03C")
    }
    
    static var colorFB7855: Color {
        .init(hexString: "FB7855")
    }
    
    static var colorFC506E: Color {
        .init(hexString: "FC506E")
    }
    
    static var color67126B: Color {
        .init(hexString: "67126B")
    }
    
    static var colorA92495: Color {
        .init(hexString: "A92495")
    }
    
    static var colorCF349E: Color {
        .init(hexString: "CF349E")
    }
    
    static var color0968E5: Color {
        .init(hexString: "0968E5")
    }
    
    static var color091970: Color {
        .init(hexString: "091970")
    }
    
    static var color0DA6C2: Color {
        .init(hexString: "0DA6C2")
    }
    
    static var color0E39C6: Color {
        .init(hexString: "0E39C6")
    }
    
    static var color780C67: Color {
        .init(hexString: "780C67")
    }
    
    static var color940967: Color {
        .init(hexString: "940967")
    }
    
    static var colorB10667: Color {
        .init(hexString: "B10667")
    }
    
    static var colorD90266: Color {
        .init(hexString: "D90266")
    }
    
    static var color354AA5: Color {
        .init(hexString: "354AA5")
    }
    
    static var colorFF8C02: Color {
        .init(hexString: "FF8C02")
    }
    
    static var color00A59B: Color {
        .init(hexString: "00A59B")
    }
    
    static var colorC0FFFB: Color {
        .init(hexString: "C0FFFB")
    }
    
    static var colorFFF5E7: Color {
        .init(hexString: "FFF5E7")
    }
    
    static var colorDAFFE0: Color {
        .init(hexString: "DAFFE0")
    }
    
    static var color282829: Color {
        .init(hexString: "282829")
    }
    
    static var color9A92FF: Color {
        .init(hexString: "9A92FF")
    }
    
    static var color47418B: Color {
        .init(hexString: "47418B")
    }
    
    static var colorD7D7FF: Color {
        .init(hexString: "D7D7FF")
    }
    
    static var color212121: Color {
        .init(hexString: "212121")
    }
    
    static var colorFFF3EA: Color {
        .init(hexString: "FFF3EA")
    }
    
    static var color00A88A: Color {
        .init(hexString: "00A88A")
    }
    
    static var colorEAFFFB: Color {
        .init(hexString: "EAFFFB")
    }
    
    static var colorFF9700: Color {
        .init(hexString: "FF9700")
    }
    
    static var colorD8FFFD: Color {
        .init(hexString: "D8FFFD")
    }
    
    static var colorB6B6B6: Color {
        .init(hexString: "B6B6B6")
    }
    
    static var colorF4F4F5: Color {
        .init(hexString: "F4F4F5")
    }
    
    static var color000000: Color {
        .init(hexString: "000000")
    }
    
    static var colorE7EBFE: Color {
        .init(hexString: "E7EBFE")
    }
}
