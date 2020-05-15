//
//  Preferences.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 5/15/20.
//  Copyright © 2020 vie. All rights reserved.
//

import MetalKit

enum ClearColors {
    case white
    case teal
    case grey
    case black
    case turquoise
    
    var value: MTLClearColor {
        switch self {
        case .white: return MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .teal: return MTLClearColor(red: 0.0, green: 0.4, blue: 0.4, alpha: 1.0)
        case .grey: return MTLClearColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        case .black: return MTLClearColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        case .turquoise: return MTLClearColor(red: 0, green: 0.3, blue: 0.4, alpha: 1.0)
        }
    }
}

class Preferences {
    public static var clearColor: MTLClearColor = ClearColors.turquoise.value
    public static var mainPixelFormat: MTLPixelFormat = .bgra8Unorm
}
