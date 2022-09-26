//
//  RegexBuilder.swift
//  billie
//
//  Created by Otávio Albuquerque on 13/09/22.
//


//Nota:
// Cod. Produto                 Qtd     Vlr.Unit    Total
//0300  QUENTINHA DE MAMIN      1        19,00      19,00
//0200  COCA COLA 500ML         1        19,00      19,00



import Foundation
import RegexBuilder

struct RegexNF {
    
    private var regtitles = Regex {
        CharacterClass.verticalWhitespace
        OneOrMore(.digit)
        CharacterClass.horizontalWhitespace
        Capture{
            OneOrMore(.anyNonNewline)
        }
    }
    private var regDigitAndValUnit = Regex{
        CharacterClass.verticalWhitespace
        Capture{
            One(.digit)
        }transform: { W in
            Int(W)
        }
        CharacterClass.verticalWhitespace
        Capture{
            One(.localizedDecimal(locale: Locale(identifier: "pt_BR")))
        } transform: {
            ($0 as NSNumber).doubleValue
        }
    }
    private var regtotal = Regex {

        CharacterClass.verticalWhitespace
        Capture{
            One(.localizedDecimal(locale: Locale(identifier: "pt_BR")))
        } transform: {
            ($0 as NSNumber).doubleValue
        }
    }

     func RegexToItem(str: String) -> [TabItem] {
        var itens: [TabItem] = []
        let titles = str.matches(of: self.regtitles)
        let qtdsandValunits = str.matches(of: self.regDigitAndValUnit)
        
        for title in titles {
            let (_, produto) = title.output
            print(produto)
            let item = TabItem(name: String(produto))
            itens.append(item)
        }
         for (index,qtds) in qtdsandValunits.enumerated() {
             print(index, qtds.output)
            let (_, qtd, val) = qtds.output
             itens[index].quantity = qtd ?? 0
             itens[index].unitPrice = val
//            qttyarr.append(qtd)
//            valsarr.append(val)
        }
        return itens
    }
                         
}

