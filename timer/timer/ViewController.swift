//
//  ViewController.swift
//  timer
//
//  Created by GEU on 05/01/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var durationSegment: UISegmentedControl!

    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var pause: UIButton!
    private var timer: Timer?
    private var remainingSeconds: Int = 0
    private var isRunning = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        stop.tintColor = .gray
        play.tintColor = .blue
        pause.tintColor = .gray
    }

    private func setupInitialState() {
        durationSegment.selectedSegmentIndex = 0
        setDurationFromSegment()
        updateTimerLabel()
    }

    @IBAction func durationChanged(_ sender: UISegmentedControl) {
        stopTimer()
        setDurationFromSegment()
        stop.tintColor = .gray
        play.tintColor = .blue
        pause.tintColor = .gray
    }

    private func setDurationFromSegment() {
        let minutes: Int

        switch durationSegment.selectedSegmentIndex {
        case 0:
            minutes = 10
        case 1:
            minutes = 15
        case 2:
            minutes = 30
        default:
            minutes = 10
        }

        remainingSeconds = minutes * 60
        updateTimerLabel()
    }

    @IBAction func playTapped(_ sender: Any) {
        guard !isRunning else { return }

        isRunning = true
        stop.tintColor = .blue
        pause.tintColor = .blue
        play.tintColor = .gray
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }

    @IBAction func pauseTapped(_ sender: Any) {
        timer?.invalidate()
        isRunning = false
        stop.tintColor = .gray
        play.tintColor = .blue
        pause.tintColor = .gray
    }

    @IBAction func stopTapped(_ sender: Any) {
        stopTimer()
        setDurationFromSegment()
        stop.tintColor = .gray
        play.tintColor = .blue
        pause.tintColor = .gray
    }

    @objc private func updateTimer() {
        guard remainingSeconds > 0 else {
            stopTimer()
            return
        }

        remainingSeconds -= 1
        updateTimerLabel()
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }

    private func updateTimerLabel() {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
}
