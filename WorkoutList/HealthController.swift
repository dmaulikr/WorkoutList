//
//  HealthController.swift
//  WorkoutList
//
//  Created by Patrick DeSantis on 10/14/16.
//  Copyright © 2016 Patrick DeSantis. All rights reserved.
//

import Foundation
import HealthKit

class HealthController {

    static let shared = HealthController()

    let healthStore = HKHealthStore()

    func requestAccess() {

        var readTypes = Set<HKObjectType>()

        // HKCharacteristicType
        let characteristicTypes = HKCharacteristicTypeIdentifier.allValues.flatMap { HKCharacteristicType.characteristicType(forIdentifier: $0) }
        characteristicTypes.forEach { readTypes.insert($0) }

        // HKQuantityType
        let quantityTypes = HKQuantityTypeIdentifier.allValues.flatMap { HKQuantityType.quantityType(forIdentifier: $0) }
        quantityTypes.forEach { readTypes.insert($0) }

        // HKWorkoutType
        readTypes.insert(HKObjectType.workoutType())

        // HKCategoryType
        let categoryTypes = HKCategoryTypeIdentifier.allValues.flatMap { HKCategoryType.categoryType(forIdentifier: $0) }
        categoryTypes.forEach { readTypes.insert($0) }

        // HKCorrelationType
//        let correlationTypes = HKCorrelationTypeIdentifier.allValues.flatMap { HKCorrelationType.correlationType(forIdentifier: $0) }
//        correlationTypes.forEach { readTypes.insert($0) }


        healthStore.requestAuthorization(toShare: nil, read: readTypes) { (success, error) in
            if success {
                print("got access!")
            }
            if let error = error {
                print(error)
            }
        }
    }
}

extension HKCategoryTypeIdentifier {
    static let allValues = [
        sleepAnalysis,
        appleStandHour,
        cervicalMucusQuality,
        ovulationTestResult,
        menstrualFlow,
        intermenstrualBleeding,
        sexualActivity,
        mindfulSession
    ]
}

extension HKCorrelationTypeIdentifier {
    static let allValues = [
        bloodPressure,
        food
    ]
}

extension HKCharacteristicTypeIdentifier {
    static let allValues = [
        biologicalSex,
        bloodType,
        dateOfBirth,
        fitzpatrickSkinType,
        wheelchairUse
    ]
}

extension HKQuantityTypeIdentifier {

    static let allValues = [
    bodyMassIndex,
    bodyFatPercentage,
    height,
    bodyMass,
    leanBodyMass,

    // Fitness
    stepCount,
    distanceWalkingRunning,
    distanceCycling,
    distanceWheelchair,
    basalEnergyBurned,
    activeEnergyBurned,
    flightsClimbed,
    nikeFuel,
    appleExerciseTime,
    pushCount,
    distanceSwimming,
    swimmingStrokeCount,

    // Vitals
    heartRate,
    bodyTemperature,
    basalBodyTemperature,
    bloodPressureSystolic,
    bloodPressureDiastolic,
    respiratoryRate,

    // Results
    oxygenSaturation,
    peripheralPerfusionIndex,
    bloodGlucose,
    numberOfTimesFallen,
    electrodermalActivity,
    inhalerUsage,
    bloodAlcoholContent,
    forcedVitalCapacity,
    forcedExpiratoryVolume1,
    peakExpiratoryFlowRate,

    // Nutrition
    dietaryFatTotal,
    dietaryFatPolyunsaturated,
    dietaryFatMonounsaturated,
    dietaryFatSaturated,
    dietaryCholesterol,
    dietarySodium,
    dietaryCarbohydrates,
    dietaryFiber,
    dietarySugar,
    dietaryEnergyConsumed,
    dietaryProtein,

    dietaryVitaminA,
    dietaryVitaminB6,
    dietaryVitaminB12,
    dietaryVitaminC,
    dietaryVitaminD,
    dietaryVitaminE,
    dietaryVitaminK,
    dietaryCalcium,
    dietaryIron,
    dietaryThiamin,
    dietaryRiboflavin,
    dietaryNiacin,
    dietaryFolate,
    dietaryBiotin,
    dietaryPantothenicAcid,
    dietaryPhosphorus,
    dietaryIodine,
    dietaryMagnesium,
    dietaryZinc,
    dietarySelenium,
    dietaryCopper,
    dietaryManganese,
    dietaryChromium,
    dietaryMolybdenum,
    dietaryChloride,
    dietaryPotassium,
    dietaryCaffeine,
    dietaryWater,
    
    uvExposure
    ]
}
