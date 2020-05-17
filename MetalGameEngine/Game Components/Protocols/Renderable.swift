//
//  Renderable.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 5/17/20.
//  Copyright © 2020 vie. All rights reserved.
//

import MetalKit

protocol Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder)
}
