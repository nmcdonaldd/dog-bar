//
//  StatusBar.swift
//  dog-bar
//
//  Created by Nicholas McDonald on 11/2/21.
//

import Foundation
import SwiftUI

class StatusBarItem {
    private let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    private var popover: NSPopover?
    
    init() {
        initStatusItem()
    }
    
    private func initStatusItem() {
        statusItem.button?.image = NSImage(
            systemSymbolName: "pawprint.fill",
            accessibilityDescription: nil)
        statusItem.button?.action = #selector(onButtonClick)
        // Necessary so AppDelegate doesn't implicitly receive the action
        statusItem.button?.target = self
    }
    
    @objc private func onButtonClick() {
        NSApplication.shared.activate(ignoringOtherApps: true)
        
        popover = NSPopover()
        popover!.behavior = .transient
        if popover!.isShown {
            popover!.close()
        } else {
            guard let button = statusItem.button else { return }
             
            // Set the view and placement of view
            popover!.contentViewController = NSHostingController<PopoverView>(
                rootView: PopoverView())
            popover!.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }
}
