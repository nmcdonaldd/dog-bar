//
//  AppDelegate.swift
//  dog-bar
//
//  Created by Nicholas McDonald on 11/2/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    private var statusBar: StatusBar?
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusBar = StatusBar()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

