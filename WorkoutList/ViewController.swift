//
//  ViewController.swift
//  WorkoutList
//
//  Created by Patrick DeSantis on 10/14/16.
//  Copyright © 2016 Patrick DeSantis. All rights reserved.
//

import HealthKit
import UIKit

class ViewController: UIViewController {

    var workouts = [HKWorkout]()

    fileprivate let dateIntervalFormatter = DateIntervalFormatter()

    @IBOutlet weak var tableView: UITableView!

    var sampleTypes = Set<HKSampleType>()

    override func viewDidLoad() {
        super.viewDidLoad()

        dateIntervalFormatter.timeStyle = .short
        dateIntervalFormatter.dateStyle = .short

        HealthController.shared.requestAccess()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let predicate = HKQuery.predicateForWorkouts(with: .greaterThanOrEqualTo, duration: 0)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: HKWorkoutType.workoutType(),
                                  predicate: predicate,
                                  limit: 0,
                                  sortDescriptors: [sortDescriptor])
        { (query, samples, error) in
            DispatchQueue.main.async {
                if let samples = samples {
                    self.workouts = samples.flatMap { $0 as? HKWorkout }
                }
                self.tableView.reloadData()

                for workout in self.workouts {
                    DispatchQueue.global().async {
                        self.inspectWorkout(workout: workout)
                    }
                }
            }
        }

        HealthController.shared.healthStore.execute(query)
    }
    @IBAction func doStuff(_ sender: Any) {
        for type in sampleTypes {
            print(type)
        }
    }

    func inspectWorkout(workout: HKWorkout) {

        if let metadata = workout.metadata {
//            print(metadata)
            //            for (key, value) in metadata {
            //                print("\(key) = \(value) (of type \(type(of: value)))")
            //            }
        } else {
//            print("no metadata")
        }


        let predicate = HKQuery.predicateForObjects(from: workout)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        for identifier in HKQuantityTypeIdentifier.allValues {
            let sampleType = HKQuantityType.quantityType(forIdentifier: identifier)!
            let query = HKSampleQuery(sampleType: sampleType,
                                      predicate: predicate,
                                      limit: 0,
                                      sortDescriptors: [sortDescriptor])
            { (query, samples, error) in
                if let samples = samples, !samples.isEmpty {
//                    print("found \(samples.count) samples for \(identifier)")
                    DispatchQueue.main.async {
                        self.sampleTypes.insert(sampleType)
                    }
                    for sample in samples {
                        if let metadata = sample.metadata {
                            print(metadata)
                        }
                    }
                } else {
//                    print("found no samples for \(identifier)")
                }

            }
            HealthController.shared.healthStore.execute(query)
        }
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath)

        let workout = workouts[indexPath.row]

        cell.detailTextLabel?.text = dateIntervalFormatter.string(from: workout.startDate, to: workout.endDate)
        cell.textLabel?.text = workout.workoutActivityType.name

        return cell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let workout = workouts[indexPath.row]

        inspectWorkout(workout: workout)
    }
}
