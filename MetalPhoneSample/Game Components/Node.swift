//
//  Node.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 5/17/20.
//  Copyright © 2020 vie. All rights reserved.
//

import MetalKit

class Node {
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
    }
}
