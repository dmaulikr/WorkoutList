//
//  HKWorkoutActivityTypeExtension.swift
//  WorkoutList
//
//  Created by Patrick DeSantis on 10/14/16.
//  Copyright © 2016 Patrick DeSantis. All rights reserved.
//

import HealthKit

public extension HKWorkoutActivityType {

    public static let allValues: [HKWorkoutActivityType] = [
        americanFootball,
        archery,
        australianFootball,
        badminton,
        baseball,
        basketball,
        bowling,
        boxing,
        climbing,
        cricket,
        crossTraining,
        curling,
        cycling,
        dance,
        danceInspiredTraining,
        elliptical,
        equestrianSports,
        fencing,
        fishing,
        functionalStrengthTraining,
        golf,
        gymnastics,
        handball,
        hiking,
        hockey,
        hunting,
        lacrosse,
        martialArts,
        mindAndBody,
        mixedMetabolicCardioTraining,
        paddleSports,
        play,
        preparationAndRecovery,
        racquetball,
        rowing,
        rugby,
        running,
        sailing,
        skatingSports,
        snowSports,
        soccer,
        softball,
        squash,
        stairClimbing,
        surfingSports,
        swimming,
        tableTennis,
        tennis,
        trackAndField,
        traditionalStrengthTraining,
        volleyball,
        walking,
        waterFitness,
        waterPolo,
        waterSports,
        wrestling,
        yoga,
        barre,
        coreTraining,
        crossCountrySkiing,
        downhillSkiing,
        flexibility,
        highIntensityIntervalTraining,
        jumpRope,
        kickboxing,
        pilates,
        snowboarding,
        stairs,
        stepTraining,
        wheelchairWalkPace,
        wheelchairRunPace,
        other
    ]

    public static let visibleValues: [HKWorkoutActivityType] = {
        let invisibleValues = [
            crossTraining,
            danceInspiredTraining,
            functionalStrengthTraining,
            other,
            preparationAndRecovery,
            swimming,
            stairs,
            stepTraining,
            snowSports,
            wheelchairRunPace,
            wheelchairWalkPace
        ]
        return HKWorkoutActivityType.allValues.filter { !invisibleValues.contains($0) }
    }()

    public var distanceQuantityTypeIdentifier: HKQuantityTypeIdentifier? {
        switch self {
        case .cycling:
            return .distanceCycling
        case .running, .walking:
            return .distanceWalkingRunning
        case .swimming:
            return .distanceSwimming
        case .wheelchairWalkPace, .wheelchairRunPace:
            return .distanceWheelchair
        default:
            return nil
        }
    }
    public var supportsLocation: Bool {
        switch self {
        case .cycling, .running, .walking:
            return true
        default:
            return false
        }
    }

    public var name: String {
        switch self {
        case .americanFootball:
            return NSLocalizedString("American Football", comment: "American Football")
        case .archery:
            return NSLocalizedString("Archery", comment: "Archery")
        case .australianFootball:
            return NSLocalizedString("Australian Football", comment: "Australian Football")
        case .badminton:
            return NSLocalizedString("Badminton", comment: "Badminton")
        case .baseball:
            return NSLocalizedString("Baseball", comment: "Baseball")
        case .basketball:
            return NSLocalizedString("Basketball", comment: "Basketball")
        case .bowling:
            return NSLocalizedString("Bowling", comment: "Bowling")
        case .boxing:
            return NSLocalizedString("Boxing", comment: "Boxing")
        case .climbing:
            return NSLocalizedString("Climbing", comment: "Climbing")
        case .cricket:
            return NSLocalizedString("Cricket", comment: "Cricket")
        case .crossTraining:
            return NSLocalizedString("Cross Training", comment: "Cross Training")
        case .curling:
            return NSLocalizedString("Curling", comment: "Curling")
        case .cycling:
            return NSLocalizedString("Cycling", comment: "Cycling")
        case .dance:
            return NSLocalizedString("Dance", comment: "Dance")
        case .elliptical:
            return NSLocalizedString("Elliptical", comment: "Elliptical")
        case .equestrianSports:
            return NSLocalizedString("Equestrian Sports", comment: "Equestrian Sports")
        case .fencing:
            return NSLocalizedString("Fencing", comment: "Fencing")
        case .fishing:
            return NSLocalizedString("Fishing", comment: "Fishing")
        case .functionalStrengthTraining:
            return NSLocalizedString("Functional Strength Training", comment: "Functional Strength Training")
        case .golf:
            return NSLocalizedString("Golf", comment: "Golf")
        case .gymnastics:
            return NSLocalizedString("Gymnastics", comment: "Gymnastics")
        case .handball:
            return NSLocalizedString("Handball", comment: "Handball")
        case .hiking:
            return NSLocalizedString("Hiking", comment: "Hiking")
        case .hockey:
            return NSLocalizedString("Hockey", comment: "Hockey")
        case .hunting:
            return NSLocalizedString("Hunting", comment: "Hunting")
        case .lacrosse:
            return NSLocalizedString("Lacrosse", comment: "Lacrosse")
        case .martialArts:
            return NSLocalizedString("Martial Arts", comment: "Martial Arts")
        case .mindAndBody:
            return NSLocalizedString("Meditation", comment: "Mind and Body")
        case .mixedMetabolicCardioTraining:
            return NSLocalizedString("Mixed Metabolic Cardio Training", comment: "Mixed Metabolic Cardio Training")
        case .paddleSports:
            return NSLocalizedString("Paddle Sports", comment: "Paddle Sports")
        case .play:
            return NSLocalizedString("Play", comment: "Play")
        case .preparationAndRecovery:
            return NSLocalizedString("Preparation and Recovery", comment: "Preparation and Recovery")
        case .racquetball:
            return NSLocalizedString("Racquetball", comment: "Racquetball")
        case .rowing:
            return NSLocalizedString("Rowing", comment: "Rowing")
        case .rugby:
            return NSLocalizedString("Rugby", comment: "Rugby")
        case .running:
            return NSLocalizedString("Running", comment: "Running")
        case .sailing:
            return NSLocalizedString("Sailing", comment: "Sailing")
        case .skatingSports:
            return NSLocalizedString("Skating Sports", comment: "Skating Sports")
        case .snowSports:
            return NSLocalizedString("Snow Sports", comment: "Snow Sports")
        case .soccer:
            return NSLocalizedString("Soccer", comment: "Soccer")
        case .softball:
            return NSLocalizedString("Softball", comment: "Softball")
        case .squash:
            return NSLocalizedString("Squash", comment: "Squash")
        case .stairClimbing:
            return NSLocalizedString("Stair Climbing", comment: "Stair Climbing")
        case .surfingSports:
            return NSLocalizedString("Surfing Sports", comment: "Surfing Sports")
        case .swimming:
            return NSLocalizedString("Swimming", comment: "Swimming")
        case .tableTennis:
            return NSLocalizedString("Table Tennis", comment: "Table Tennis")
        case .tennis:
            return NSLocalizedString("Tennis", comment: "Tennis")
        case .trackAndField:
            return NSLocalizedString("Track and Field", comment: "Track and Field")
        case .traditionalStrengthTraining:
            return NSLocalizedString("Traditional Strength Training", comment: "Traditional Strength Training")
        case .volleyball:
            return NSLocalizedString("Volleyball", comment: "Volleyball")
        case .walking:
            return NSLocalizedString("Walking", comment: "Walking")
        case .waterFitness:
            return NSLocalizedString("Water Fitness", comment: "Water Fitness")
        case .waterPolo:
            return NSLocalizedString("Water Polo", comment: "Water Polo")
        case .waterSports:
            return NSLocalizedString("Water Sports", comment: "Water Sports")
        case .wrestling:
            return NSLocalizedString("Wrestling", comment: "Wrestling")
        case .yoga:
            return NSLocalizedString("Yoga", comment: "Yoga")
        case .barre:
            return NSLocalizedString("Barre", comment: "Barre")
        case .coreTraining:
            return NSLocalizedString("Core Training", comment: "Core Training")
        case .crossCountrySkiing:
            return NSLocalizedString("Cross Country Skiing", comment: "Cross Country Skiing")
        case .downhillSkiing:
            return NSLocalizedString("Downhill Skiing", comment: "Downhill Skiing")
        case .flexibility:
            return NSLocalizedString("Flexibility", comment: "Flexibility")
        case .highIntensityIntervalTraining:
            return NSLocalizedString("High Intensity Interval Training", comment: "High Intensity Interval Training")
        case .jumpRope:
            return NSLocalizedString("Jump Rope", comment: "Jump Rope")
        case .kickboxing:
            return NSLocalizedString("Kickboxing", comment: "Kickboxing")
        case .pilates:
            return NSLocalizedString("Pilates", comment: "Pilates")
        case .snowboarding:
            return NSLocalizedString("Snowboarding", comment: "Snowboarding")
        case .stairs:
            return NSLocalizedString("Stairs", comment: "Stairs")
        case .stepTraining:
            return NSLocalizedString("Step Training", comment: "Step Training")
        case .wheelchairWalkPace:
            return NSLocalizedString("Wheelchair Walk Pace", comment: "Wheelchair Walk Pace")
        case .wheelchairRunPace:
            return NSLocalizedString("Wheelchair Run Pace", comment: "Wheelchair Run Pace")
        case .other:
            return NSLocalizedString("Other", comment: "Other")

        // Deprecated
        case .danceInspiredTraining:
            return NSLocalizedString("Dance Inspired Training", comment: "Dance Inspired Training")
        }
    }

    public var shortName: String {
        switch self {
        case .americanFootball:
            return NSLocalizedString("Football", comment: "Football")
        case .australianFootball:
            return NSLocalizedString("🇦🇺 Football", comment: "Australian Football (short)")
        case .cycling:
            return NSLocalizedString("Cycle", comment: "Cycle")
        case .equestrianSports:
            return NSLocalizedString("Equestrian", comment: "Equestrian")
        case .mixedMetabolicCardioTraining:
            return NSLocalizedString("Mixed Cardio", comment: "Mixed Cardio")
        case .running:
            return NSLocalizedString("Run", comment: "Run")
        case .skatingSports:
            return NSLocalizedString("Skate Sports", comment: "Skating Sports (shortened)")
        case .snowSports:
            return NSLocalizedString("Snow Sports", comment: "Snow Sports")
        case .soccer:
            return NSLocalizedString("Soccer", comment: "Soccer")
        case .softball:
            return NSLocalizedString("Softball", comment: "Softball")
        case .squash:
            return NSLocalizedString("Squash", comment: "Squash")
        case .stairClimbing:
            return NSLocalizedString("Stairs", comment: "Stairs")
        case .surfingSports:
            return NSLocalizedString("Surfing", comment: "Surfing")
        case .trackAndField:
            return NSLocalizedString("Track & Field", comment: "Track & Field")
        case .traditionalStrengthTraining:
            return NSLocalizedString("Strength Train", comment: "Strength Train")
        case .walking:
            return NSLocalizedString("Walk", comment: "Walk")
        case .crossCountrySkiing:
            return NSLocalizedString("XC Skiing", comment: "Cross Country Skiing (abbreviated)")
        case .downhillSkiing:
            return NSLocalizedString("Skiing", comment: "Skiing")
        case .highIntensityIntervalTraining:
            return NSLocalizedString("HIIT", comment: "High Intensity Interval Training (abbreviated)")
        case .snowboarding:
            return NSLocalizedString("Snowboard", comment: "Snowboard")
        default:
            return name
        }
    }
    
}
