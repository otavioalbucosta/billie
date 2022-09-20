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
        ChoiceOf{
            CharacterClass.horizontalWhitespace
            CharacterClass.verticalWhitespace
        }
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

     func RegexToItem(str: String) -> [ItemNota] {
        var itens: [ItemNota] = []
        let titles = str.matches(of: self.regtitles)
        let qtdsandValunits = str.matches(of: self.regDigitAndValUnit)
         let valtot = str.components(separatedBy: "Total")[1].components(separatedBy: "Permanencia")[0].matches(of: self.regtotal)
        
        for title in titles {
            let (_, produto) = title.output
            print(produto)
            let item = ItemNota(product: String(produto) )
            itens.append(item)
        }
         for (index,qtds) in qtdsandValunits.enumerated() {
             print(index, qtds.output)
            let (_, qtd, val) = qtds.output
             itens[index].quantity = qtd
             itens[index].valUnit = val
//            qttyarr.append(qtd)
//            valsarr.append(val)
        }
         for (index,total) in valtot.enumerated(){
             print(index, total.output)
            let (_, tota) = total.output
             itens[index].valTotal = tota
        }
        return itens
    }
                         
}

