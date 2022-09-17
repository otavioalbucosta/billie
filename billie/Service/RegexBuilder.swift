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
    
    static var reg = Regex {
        CharacterClass.anyNonNewline
        CharacterClass.verticalWhitespace
        Capture{
            OneOrMore(.digit)
        }
        ChoiceOf{
            CharacterClass.horizontalWhitespace
            CharacterClass.verticalWhitespace
        }
        Capture{
            OneOrMore(.anyNonNewline)
        }
        CharacterClass.verticalWhitespace
        CharacterClass.anyNonNewline
        CharacterClass.verticalWhitespace
        Capture{
            One(.digit)
        }
        ChoiceOf{
            CharacterClass.horizontalWhitespace
            CharacterClass.verticalWhitespace
        }
        CharacterClass.verticalWhitespace
        Capture{
            One(.localizedDecimal(locale: Locale(identifier: "pt_BR")))
        } transform: {
            ($0 as NSNumber).doubleValue
        }
        CharacterClass.verticalWhitespace
        CharacterClass.anyNonNewline
        CharacterClass.verticalWhitespace
        Capture{
            One(.localizedDecimal(locale: Locale(identifier: "pt_BR")))
        } transform: {
            ($0 as NSNumber).doubleValue
        }
        
    }
    
    
    #if DEBUG
    static var mockExample = {
        return """

        0300
        QUENTINHA DE MAMIN
        1
        19,00
        19,00
        0200
        COCA COLA 500ML
        1
        19,00
        19,00
        """
    }
    #endif
    
}

