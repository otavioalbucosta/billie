//
//  ContentView.swift
//  billie
//
//  Created by Otávio Albuquerque on 08/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showScanner = false
    @State private var texts: [ScanData] = []
    var body: some View {
        NavigationView{
            VStack{
                if texts.count > 0 {
                    List{
                        ForEach(texts){ text in
                            NavigationLink(destination: ScrollView{Text(text.content)}, label: {
                                Text(text.content).lineLimit(1)
                            })
                        }
                    }
                }else{
                    Text("No texts scanned")
                }
            }
            .navigationTitle("Scan Text")
            .toolbar(content: {
                Button(action: {
                    self.showScanner = true
                }, label: {
                    Image(systemName: "doc.text.viewfinder")
                        .font(.title)
                })
                .sheet(isPresented: $showScanner, content: {
                    makeScannerView()
                })
            })
        }
    }
    private func makeScannerView() -> ScannerView{
        ScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScanner = false
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

