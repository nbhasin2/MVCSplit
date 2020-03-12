//
//  ViewModel.swift
//  MVCSplit
//
//  Created by Nishant Bhasin on 2020-03-12.
//  Copyright © 2020 Nishant Bhasin. All rights reserved.
//

import Foundation

class ViewModel {
    //  Internal vars
    var model: Model?
    var closureDelegate: (() -> Void)?

       
    init() {
       setupModel()
    }

    private func setupModel() {
        model = Model(totalAmount: 0.0, totalAttendees: 0.0, totalSplit: 0.0)
    }
    
    // Basic Business Logic
    func calculateTotalSplit(totalAmount: Double, totalAttendees: Double) -> Double {
        var split = 0.0
        // Total Amount is 0
        guard totalAmount > 0 else { return 0 }
        // Total Attendees are 0
        guard totalAttendees > 0 else { return 0 }
        // Total Attendees are 1
        if totalAttendees == 1 { return totalAmount }
        
        split = (totalAmount / totalAttendees)
        
        return split
    }

    // Enhanced Business Logic (using model)
    func calculateTotalSplit() -> Double {
        guard model != nil else { return 0 }
        let totalAmount = model!.totalAmount
        let totalAttendees = model!.totalAttendees
        var split = 0.0
        // Total Amount is 0
        guard totalAmount > 0 else { return 0 }
        // Total Attendees are 0
        guard totalAttendees > 0 else { return 0 }
        // Total Attendees are 1
        if totalAttendees == 1 { return model!.totalAmount }
        
        split = (model!.totalAmount / model!.totalAttendees)
        
        return split
    }
    
    // Update the model with
    func updateModel(totalAmount: Double, totalAttendees: Double, split: Double) {
        guard self.model != nil else { return }
        // We update the model
        let newModel = Model(totalAmount: totalAmount, totalAttendees: totalAttendees, totalSplit: split)
        self.model = newModel
    }
    
    // Validation logic to allow only Doubles and emptry characters to be a valid text input
    func validateNumericTextInput(fullText: String, upcomingCharacter: String) -> Bool {
        if upcomingCharacter.isEmpty { return true }
        if fullText.isEmpty && (Double(upcomingCharacter) != nil) { return true }
        if fullText.contains(".") && upcomingCharacter == "." { return false }
        guard let _ = Double(fullText) else {
            return false
        }
        return true
    }
}
