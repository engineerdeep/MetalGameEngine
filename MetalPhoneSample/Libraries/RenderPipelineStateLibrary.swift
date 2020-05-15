//
//  RenderPipelineStateLibrary.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 5/15/20.
//  Copyright © 2020 vie. All rights reserved.
//

import MetalKit

enum RenderPipelineStateTypes {
    case basic
}

class RenderPipelineStateLibrary {
    private static var renderPipelineState: [RenderPipelineStateTypes: RenderPipelineState] = [:]
    
    public static func initialize() {
        createDefaultRenderPipelineState()
    }
    
    private static func createDefaultRenderPipelineState() {
        renderPipelineState.updateValue(Basic_RenderPipelineState(), forKey: .basic)
    }
    
    public static func pipelineState(_ renderPipelineStateType: RenderPipelineStateTypes) -> MTLRenderPipelineState {
        return renderPipelineState[renderPipelineStateType]!.renderPipelineState
    }
}

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState { get }
}

public struct Basic_RenderPipelineState: RenderPipelineState {
    var name = "Basic Render Pipeline State"
    var renderPipelineState: MTLRenderPipelineState {
        var renderPipelineState: MTLRenderPipelineState!
        do {
            renderPipelineState = try Engine.device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.descriptor(.basic))
        } catch let error as NSError {
            print(error)
        }
        return renderPipelineState
    }
}
