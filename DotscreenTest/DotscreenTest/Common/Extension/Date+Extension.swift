//
//  Date+Extension.swift
//  DotscreenTest
//
//  Created by CHEN on 23/07/2022.
//

import Foundation

extension Date {
    
    func getNumberOfMinutesAndSecondsFromDate(dateFrom: Date) -> (Int, Int) {
        var seconds = Int(dateFrom.timeIntervalSince1970 - Date().timeIntervalSince1970)
        
        let minutes = Int(seconds / 60)
        seconds -= minutes * 60
        
        return (minutes, seconds)
    }
}
    
//    func updateNextLotteryDrawDatesString() {
//        if let nextLotteryDrawEndDate = nextLotteryDrawEndDate {
//            let (days, hours, minutes, seconds) = Date().getNumberOfDaysHoursMinutesSecondsFromDateAndToday(dateFrom: nextLotteryDrawEndDate)
//
//            if days < 10 {
//                nextLotteryDaysStringValue = "0" + String(days)
//            } else {
//                nextLotteryDaysStringValue = String(days)
//            }
//            if hours < 10 {
//                nextLotteryHoursStringValue = "0" + String(hours)
//            } else {
//                nextLotteryHoursStringValue = String(hours)
//            }
//            if minutes < 10 {
//                nextLotteryMinutesStringValue = "0" + String(minutes)
//            } else {
//                nextLotteryMinutesStringValue = String(minutes)
//            }
//            if seconds < 10 {
//                nextLotterySecondsStringValue = "0" + String(seconds)
//            } else {
//                nextLotterySecondsStringValue = String(seconds)
//            }
//        }
//    }
//
//    func updateLotteryEntriesValue() {
//        ECUserDefaultsManager.shared.lotteryEntries += 1
//        lotteryEntries = ECUserDefaultsManager.shared.lotteryEntries
//    }
    
