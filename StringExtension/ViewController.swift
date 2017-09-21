//
//  ViewController.swift
//  StringExtension
//
//  Created by Marcelo Sampaio on 9/20/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let cpf: String = "12312312311"
        let ret: Bool
        
        ret = isValidCpf(cpf)
        print ("\n\nret is '\(ret)' and cpf if '\(cpf)'")
        if (!ret) {
            print ("CPF é inválido")
        } else {
            print ("CPF é válido!! :-)")
        }
        
        
//        if isValidCpf("42820898147") {
//            print("CPF OK")
//        }else{
//            print("CPF INVÁLIDO")
//        }
        
    }

    private func isValidCpf(_ input: String) -> Bool
    {
        if (input.isEmpty) {
            return false
        }
        
        let cpf = input.characters.filter{"0123456789".characters.contains($0)}
        if cpf.count == 11 {
            let digitTen = (Int(String(cpf[9])) ?? 0)
            let digitEleven = (Int(String(cpf[10])) ?? 0)
            
            var resultModuleOne: Int = 0, resultModuleTwo: Int = 0, realValue: Int = 0
            var i: Int = 0, j: Int = 11
            for index in 0..<cpf.count-1 {
                realValue = (Int(String(cpf[index])) ?? 0)
                resultModuleTwo += (realValue * j)
                
                if (i > 0) {
                    realValue = (Int(String(cpf[index-1])) ?? 0)
                    resultModuleOne += (realValue * j)
                }
                
                i += 1; j -= 1;
            }
            
            resultModuleOne %= 11
            resultModuleOne = resultModuleOne < 2 ? 0 : resultModuleOne-11
            
            resultModuleTwo %= 11
            resultModuleTwo = resultModuleTwo < 2 ? 0 : resultModuleTwo-11
            
            
            if resultModuleOne < 0 {
                resultModuleOne = resultModuleOne * -1
            }
            if resultModuleTwo < 0 {
                resultModuleTwo = resultModuleTwo * -1
            }
            
            
            if (resultModuleOne == digitTen && resultModuleTwo == digitEleven) {
                return true
            }
        }
        
        return false
    }
    /*
    let cpf: String = "fdasfdfsdf352353"
    let ret: Bool
    
    ret = checkIfCPFisValid(cpf)
    print ("\n\nret is '\(ret)' and cpf if '\(cpf)'")
    if (!ret) {
    print ("CPF é inválido")
    } else {
    print ("CPF é válido!! :-)")
    }
    */
    

}

