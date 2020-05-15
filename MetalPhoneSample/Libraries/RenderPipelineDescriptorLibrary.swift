//
//  RenderPipelineDescriptorLibrary.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 5/15/20.
//  Copyright © 2020 vie. All rights reserved.
//

import MetalKit

enum RenderPipelineDescriptorTypes {
    case basic
}

class RenderPipelineDescriptorLibrary {
    public static var renderPipelineDescriptors: [RenderPipelineDescriptorTypes: RenderPipelineDescriptor] = [:]
    
    public static func initialize () {
        createDefaultRenderPipelineDescriptors()
    }
    
    private static func createDefaultRenderPipelineDescriptors () {
        renderPipelineDescriptors.updateValue(Basic_RenderPipelineDescriptor(), forKey: .basic)
    }
    
    public static func descriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorTypes) -> MTLRenderPipelineDescriptor {
        return renderPipelineDescriptors[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
}

protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor { get }
}

public struct Basic_RenderPipelineDescriptor: RenderPipelineDescriptor {
    var name: String = "Basic Render Pipeline Descriptor"
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor {
        let renderPipelineStateDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineStateDescriptor.colorAttachments[0].pixelFormat = Preferences.mainPixelFormat
        renderPipelineStateDescriptor.vertexFunction = ShaderLibrary.vertex(.basic)
        renderPipelineStateDescriptor.fragmentFunction = ShaderLibrary.fragment(.basic)
        renderPipelineStateDescriptor.vertexDescriptor = VertexDescriptorLibrary.descriptor(.basic)
        return renderPipelineStateDescriptor
    }
}

