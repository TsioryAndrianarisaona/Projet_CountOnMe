//
//  Node.swift
//  CountOnMe
//
//  Created by user214073 on 16/02/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation;
class Node
{
    var Info : String = "";
    var LSon : Node? = nil;
    var RSon : Node? = nil;
    init(_ i : String)
    {
        self.Info = i;
    }
    init(_ i : String, _ l : Node?, _ r : Node?)
    {
        self.Info = i;
        self.LSon = l;
        self.RSon = r;
    }
    func setInfo(_ i : String)
    {
        self.Info = i;
    }
    func setLSon(_ l : Node?)
    {
        self.LSon = l;
    }
    func setRSon(_ r : Node?)
    {
        self.RSon = r;
    }
    func getInfo() -> String?
    {
        return self.Info;
    }
    func getLSon() -> Node?
    {
        return self.LSon;
    }
    func getRSon() -> Node?
    {
        return self.RSon;
    }
    func hasSon() -> Bool
    {
        return (self.LSon != nil || self.RSon != nil);
    }
    func hasSons() -> Bool
    {
        return (self.LSon != nil && self.RSon != nil);
    }
    func hasLSon() -> Bool
    {
        return self.LSon != nil;
    }
    func hasRSon() -> Bool
    {
        return self.RSon != nil;
    }
    func isLeaf() -> Bool
    {
        return !self.hasSon();
    }
    func getSons() -> [Node?]
    {
        if (self.hasSons())
        {
            var node:
            [Node?]            node.append(self.RSon)
            node.append(self.LSon)
            return [Node?]
        }
        if (self.hasLSon())
        {
            return nil
            [self.LSon];
        }
        if (self.hasRSon())
        {
            return nil
            [self.RSon];
        }
        return Array(repeating: nil, count: 0);
    }
    func isOperation() -> Bool
    {
        return (self.Info== "+" || self.Info== "-" || self.Info== "*" || self.Info== "/" || self.Info== "^");
    }
    func isNumber() -> Bool
    {
        return !(self.Info.contains("+") || self.Info.contains("-") || self.Info.contains("*") || self.Info.contains("/") || self.Info.contains("(") || self.Info.contains(")") || self.Info.contains("[") || self.Info.contains("]"));
    }
    func isAnExpression() -> Bool
    {
        return (self.Info.hasPrefix("(") && self.Info.hasSuffix(")"));
    }
    func toString() -> String?
    {
        return self.Info;
    }
}
