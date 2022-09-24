//
//  PlistViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 23.09.2022.
//

import UIKit

/// PlistViewController - основной экран со списком песен
class PlistViewController: UIViewController {
    
    @IBOutlet weak var musicNumberFirstLogoImageView: UIImageView!
    @IBOutlet weak var musicNumberSecondLogoImageView: UIImageView!
    @IBOutlet weak var musicNumberThirdLogoImageView: UIImageView!
    
    @IBOutlet weak var musicNumberFirstNameButton: UIButton!
    @IBOutlet weak var musicNumberSecondNameButton: UIButton!
    @IBOutlet weak var musicNumberThirdNameButton: UIButton!

    @IBOutlet weak var musicNumberFirstDurationLabel: UILabel!
    @IBOutlet weak var musicNumberSecondDurationLabel: UILabel!
    @IBOutlet weak var musicNumberThirdDurationLabel: UILabel!
    
    private var musicPlist = MusicPlist().musicPlistArray
    private var currentMusic = MusicPlist().musicPlistArray[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        setUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Player",
        let playerViewController = segue.destination as? PlayerViewController else { return }
        playerViewController.currentMusic = currentMusic
    }
    
    @IBAction func musicNameButtonPress(_ sender: UIButton) {
        guard let safeID = Int(sender.restorationIdentifier ?? "") else { return }
        currentMusic = MusicPlist().musicPlistArray[safeID]
        performSegue(withIdentifier: "Player", sender: self)
    }
    
    private func setUI() {
        guard musicPlist.count == 3 else { return }
        
        musicNumberFirstLogoImageView.image = UIImage(named: musicPlist[0].nameImageMusic)
        musicNumberSecondLogoImageView.image = UIImage(named: musicPlist[1].nameImageMusic)
        musicNumberThirdLogoImageView.image = UIImage(named: musicPlist[2].nameImageMusic)
        
        musicNumberFirstNameButton.setTitle(musicPlist[0].nameMusic, for: .normal)
        musicNumberSecondNameButton.setTitle(musicPlist[1].nameMusic, for: .normal)
        musicNumberThirdNameButton.setTitle(musicPlist[2].nameMusic, for: .normal)
        
        musicNumberFirstDurationLabel.text = musicPlist[0].durationMusic
        musicNumberSecondDurationLabel.text = musicPlist[1].durationMusic
        musicNumberThirdDurationLabel.text = musicPlist[2].durationMusic
    }
    
}
