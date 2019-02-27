//
//  ShopListTests.swift
//  ShopListTests
//
//  Created by Abraao Levi on 16/02/19.
//  Copyright © 2019 Abraao Levi. All rights reserved.
//

import XCTest
@testable import ShopList

class ShopListTests: XCTestCase {

    func testExample() {
        // var saldo_devedor: Float = 280000;
        var saldo_devedor: Float = 300000;
        var prazo: Int = 360;
        var taxa_aa: Float = 10 / 100;
        var taxa_am: Float = taxa_aa / 12;
        var amortizacao: Float = saldo_devedor / Float(exactly: prazo)!
        
        var adiantamento: Float = 0
        var adiantamento_insuficiente_anterior: Float = 0
        var valor_pago: Float = 6000
        
        var juros: Float = 0
        var parcela: Float = 0
        var soma_amortizacao: Float = 0
        var soma_juros: Float = 0
        var soma_parcela: Float = 0
        var soma_pago: Float = 0
        
        var abater: Float = 0
        
        for mes in 1...prazo {
            
//            if mes == 1 || mes % 12 == 0 {
//                abater += 12000
//            }
            
            if mes == 1 {
                abater += 100000
            }
            
            if mes % 12 == 0 {
                abater += 5000
            }
            
            soma_pago += abater
            
            juros = saldo_devedor * taxa_am
            parcela = amortizacao + juros
            saldo_devedor = saldo_devedor - amortizacao - abater
            
            print("\(mes)\t\t\(amortizacao)\t\t\(juros)\t\t\(parcela)\t\t\(saldo_devedor)")
            
            if saldo_devedor < 0 {
                print("\(soma_amortizacao)\t\t\(soma_juros)\t\t\(soma_parcela)\t\t\(soma_pago)")
                break
            }
            
            adiantamento = valor_pago + adiantamento_insuficiente_anterior - parcela
            
            abater = 0
            while adiantamento > amortizacao {
                abater = abater + amortizacao
                adiantamento = adiantamento - amortizacao
            }
            
            adiantamento_insuficiente_anterior = 0
            if adiantamento > 0 {
                adiantamento_insuficiente_anterior = adiantamento
                adiantamento = 0
            }
            
            soma_amortizacao += amortizacao
            soma_juros += juros
            soma_parcela += parcela
            soma_pago += valor_pago
            
        }
        
        

    }

}
