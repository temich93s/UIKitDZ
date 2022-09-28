//
//  PlayerViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 23.09.2022.
//

import AVFoundation
import UIKit

/// PlayerViewController - экран с музыкальным плеером
class PlayerViewController: UIViewController {

    @IBOutlet weak var currentTimeMusicLabel: UILabel!
    @IBOutlet weak var leftTimeMusicLabel: UILabel!
    @IBOutlet weak var musicCurrentTimeSlider: UISlider!
    @IBOutlet weak var musicLogoImageView: UIImageView!
    @IBOutlet weak var nameMusicLabel: UILabel!
    @IBOutlet weak var nameSingerLabel: UILabel!
    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var volumeMusicSlider: UISlider!
    
    var currentMusic = MusicPlist().musicPlistArray[0]
    
    private var audioPlayer = AVAudioPlayer()
    private var playerStop = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAudioPlayer()
        setUI()
    }
    
    @IBAction func playStopButtonPressAction(_ sender: UIButton) {
        let config = UIImage.SymbolConfiguration(pointSize: 60, weight: .medium, scale: .default)
        if audioPlayer.isPlaying {
            playStopButton.setImage(UIImage(systemName: "play.fill", withConfiguration: config), for: .normal)
            audioPlayer.pause()
            playerStop.toggle()
        } else {
            playStopButton.setImage(UIImage(systemName: "pause.fill", withConfiguration: config), for: .normal)
            audioPlayer.play()
            playerStop.toggle()
        }
    }
    
    @IBAction func closeButtonPressAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func volumeMusicSliderAction(_ sender: UISlider) {
        audioPlayer.volume = volumeMusicSlider.value
    }
    
    private func setAudioPlayer() {
        guard let url = Bundle.main.url(forResource: currentMusic.namePathMusic, withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error.localizedDescription)
        }
        audioPlayer.play()
    }
    
    private func setUI() {
        musicLogoImageView.image = UIImage(named: currentMusic.nameImageMusic)
        nameMusicLabel.text = currentMusic.nameMusic
        nameSingerLabel.text = currentMusic.nameArtistMusic
        currentTimeMusicLabel.text = "00:00"
        leftTimeMusicLabel.text = String(
            format: "-%02d:%02d", Int(audioPlayer.duration) / 60,
            Int(audioPlayer.duration) % 60
        )
        musicCurrentTimeSlider.maximumValue = Float(audioPlayer.duration)
    }
    
}
