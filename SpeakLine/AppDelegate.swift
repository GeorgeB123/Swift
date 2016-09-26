//
//  AppDelegate.swift
//  SpeakLine
//
//  Created by George Bonnici-Carter on 9/15/16.
//  Copyright © 2016 George Bonnici-Carter. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSSpeechSynthesizerDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var display: NSTextField!
    
    var speechSynth: NSSpeechSynthesizer? = nil
    
    override init(){
        speechSynth = NSSpeechSynthesizer()
        super.init()
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        speechSynth = NSSpeechSynthesizer()
        speechSynth?.delegate = self
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    @IBAction func sayIt(sender: NSButton) {
        if(display != ""){
            let input: String = display.stringValue
            speechSynth!.startSpeakingString(input)
        
        }
    }
    
    @IBAction func stopIt(sender: NSButton) {
        speechSynth!.stopSpeaking()
    }
    
    func didNotFinishSpeaking(dnfSpeak: NSSpeechSynthesizer) -> Bool {
        
        return true
    }

}

