//
//  Engine.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 5/15/20.
//  Copyright © 2020 vie. All rights reserved.
//

import MetalKit

class Engine {
    public static var device: MTLDevice!
    public static var commandQueue: MTLCommandQueue!
    
    public static func ignite (device: MTLDevice) {
        self.device = device
        self.commandQueue = device.makeCommandQueue()
        ShaderLibrary.initialize()
        VertexDescriptorLibrary.initialize()
        RenderPipelineDescriptorLibrary.initialize()
        RenderPipelineStateLibrary.initialize()
    }
}
