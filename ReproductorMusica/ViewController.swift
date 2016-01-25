//
//  ViewController.swift
//  ReproductorMusica
//
//  Created by Fer on 25/1/16.
//  Copyright © 2016 Fer. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var volumeText: UILabel!
    @IBOutlet weak var playingSongText: UILabel!
    @IBOutlet weak var caratula: UIImageView!
    
    private var reproductor : AVAudioPlayer!
    
    private var antemasqueURL : NSURL!
    private var crystalFightersURL : NSURL!
    private var daftPunkURL : NSURL!
    private var kingsOfLeonURL : NSURL!
    private var supersubmarinaURL : NSURL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        antemasqueURL = NSBundle.mainBundle().URLForResource("AM - Memento Mori", withExtension: "mp3")!
        crystalFightersURL = NSBundle.mainBundle().URLForResource("CF - You & I", withExtension: "mp3")!
        daftPunkURL = NSBundle.mainBundle().URLForResource("DP - Get Lucky", withExtension: "mp3")!
        kingsOfLeonURL = NSBundle.mainBundle().URLForResource("KL - Use Somebody", withExtension: "mp3")!
        supersubmarinaURL = NSBundle.mainBundle().URLForResource("SS - Cancion De Guerra", withExtension: "mp3")!
        
        //reproductor.volume = 0.5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func play() {
        if reproductor != nil{
            if !reproductor.playing{
                reproductor.play()
            }
        }else{
            playingSongText.text = "Antes elige una canción"
        }
    }

    @IBAction func pause() {
        if reproductor != nil{
            if reproductor.playing{
                reproductor.pause()
            }
        }else{
            playingSongText.text = "Antes elige una canción"
        }
    }

    @IBAction func stop() {
        if reproductor != nil{
            if reproductor.playing{
                reproductor.stop()
            }
            //si está pausada y damos a stop es porque queremos ir al principio
            reproductor.currentTime = 0.0
        }else{
            playingSongText.text = "Antes elige una canción"
        }
    }
    
    @IBAction func volumeDown() {
        if reproductor.volume > 0.0 {
            reproductor.volume -= 0.05
            volumeText.text = String(reproductor.volume * 100)
        }
    }
    
    @IBAction func volumeUp() {
        if reproductor.volume < 1.0 {
            reproductor.volume += 0.05
            volumeText.text = String(reproductor.volume * 100)
        }
    }
    
    @IBAction func antemasque() {
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: antemasqueURL)
            playingSongText.text = "Antemasque - Memento Mori"
            reproductor.volume = 0.5
            volumeText.text = "50"
            caratula.image = UIImage(named: "AM.jpg")!
            reproductor.play()
        }catch{
            playingSongText.text = "Error al cargar la canción"
        }
    }
    
    @IBAction func crystalFighters() {
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: crystalFightersURL)
            playingSongText.text = "Crystal Fighters - You & I"
            reproductor.volume = 0.5
            volumeText.text = "50"
            caratula.image = UIImage(named: "CF.jpg")!
            reproductor.play()
        }catch{
            playingSongText.text = "Error al cargar la canción"
        }
    }
    
    @IBAction func daftPunk() {
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: daftPunkURL)
            playingSongText.text = "Daft Punk - Get Lucky"
            reproductor.volume = 0.5
            volumeText.text = "50"
            caratula.image = UIImage(named: "DP.jpg")!
            reproductor.play()
        }catch{
            playingSongText.text = "Error al cargar la canción"
        }
    }
    
    @IBAction func kingsOfLeon() {
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: kingsOfLeonURL)
            playingSongText.text = "Kings of Leon - Use Somebody"
            reproductor.volume = 0.5
            volumeText.text = "50"
            caratula.image = UIImage(named: "KL.jpg")!
            reproductor.play()
        }catch{
            playingSongText.text = "Error al cargar la canción"
        }
    }
    
    @IBAction func supersubmarina() {
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: supersubmarinaURL)
            playingSongText.text = "Supersubmarina - Canción de Guerra"
            reproductor.volume = 0.5
            volumeText.text = "50"
            caratula.image = UIImage(named: "SS.jpg")!
            reproductor.play()
        }catch{
            playingSongText.text = "Error al cargar la canción"
        }
    }
    @IBAction func random() {
        let rnd = arc4random_uniform(5)

        switch rnd{
        case 0:
            self.antemasque()
        case 1:
            self.crystalFighters()
        case 2:
            self.daftPunk()
        case 3:
            self.kingsOfLeon()
        case 4:
            self.supersubmarina()
        default:
            self.daftPunk()
        }
    }
    
}

