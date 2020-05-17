//
//  ShaderLibrary.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 5/15/20.
//  Copyright © 2020 vie. All rights reserved.
//

import MetalKit

enum VertexShaderTypes {
    case basic
}

enum FragmentShaderTypes {
    case basic
}

class ShaderLibrary {
    public static var defaultLibrary: MTLLibrary!
    private static var vertexShaders: [VertexShaderTypes: Shader] = [:]
    private static var fragmentShaders: [FragmentShaderTypes: Shader] = [:]
    
    public static func initialize() {
        defaultLibrary = Engine.device.makeDefaultLibrary()
        createDefaultShaders()
    }
    
    public static func createDefaultShaders() {
        //Vertex Shaders
        vertexShaders.updateValue(Basic_VertexShader(), forKey: .basic)
        
        //Fragment Shaders
        fragmentShaders.updateValue(Basic_FragmentShader(), forKey: .basic)
    }
    
    public static func vertex(_ vertexShaderType: VertexShaderTypes) -> MTLFunction {
        return vertexShaders[vertexShaderType]!.function
    }
    
    public static func fragment(_ fragmentShaderType: FragmentShaderTypes) -> MTLFunction {
        return fragmentShaders[fragmentShaderType]!.function
    }
}

protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction { get }
}

public struct Basic_VertexShader: Shader {
    var name: String = "Basic Vertex Shader"
    var functionName: String = "basic_vertex_shader"
    var function: MTLFunction {
        let function = ShaderLibrary.defaultLibrary.makeFunction(name: functionName)
//        function?.label = name
        return function!
    }
}

public struct Basic_FragmentShader: Shader {
    var name: String = "Basic Fragment Shader"
    var functionName: String = "basic_fragment_shader"
    var function: MTLFunction {
        let function = ShaderLibrary.defaultLibrary.makeFunction(name: functionName)
//        function?.label = name
        return function!
    }
}
