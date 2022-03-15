//
//  main.swift
//  dam_ios1_labo2
//
//  Created by Philippe Allard-Rousse (Étudiant) on 2022-03-15.
//

import Foundation

func DebugPrint(_ output: Any) -> Void {
    print("Debug: ", output)
}

func inputInt(_ prompt:String, min: Int=0, max: Int=0, defaultVal: Int = -1)->Int{
    var strValide = "Entier positif"
    
    
    if(max > 0){
        strValide = "Entre \(min) et \(max)"
    }
    else if(min>0){
        strValide = "au moins \(min)"
    }
    
    if(defaultVal>=0){
        strValide += " [défault: \(defaultVal)]"
    }
    
    print("---------------------", separator:"\n")
    while true {
        print(prompt,"\(strValide)",":",terminator: "")
        let res  = readLine()
        let input = Int(res ?? "") ?? Int(defaultVal)
        if (input >= min) && ((max<=0)||(input <= max)){
            //print("---------------------")
            return input
        }
        print("-- ERREUR: La valeur entré n'est pas valide. Recommencé")
    }
    
}

func partie( borneMin: Int = 1, borneMax : Int = 100, nbEssaie nbCoupsMax:Int = 10) -> Void {
    let chiffreMystère = Int(arc4random_uniform(UInt32(borneMax - borneMin))) + borneMin
    print("","""
========================================================
              TROUVER LE CHIFFRE MYSTÈRE
========================================================
Le chiffre mystère est entre \(borneMin) et \(borneMax).
Vous avez \(nbCoupsMax) essaies pour le trouvé.
Bonne Chance!
""", separator:"\n")
    DebugPrint("DB 1: \(chiffreMystère)")
    
    for i in 1...nbCoupsMax{
        let nb = inputInt("Essais #\(i) sur \(nbCoupsMax): Entrez un nombre",min:borneMin,max:borneMax)
        
        DebugPrint("DB 2: \(nb)")

        // Refactor des condition
        // 1. Dans tous les cas, si le nombre est trouvé, le jeu est fini
        // 2. Si on est rendu à nbCoupsMax, c'était notre dernier chance et nous reviendrons pas dans la loop, donc affiche 'Game Over'
        // 3. Si on as passé les autres conditions, nous avons un autre essaie. Donnons un indice
        if nb == chiffreMystère {
            print("")
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!")
            print("GAGNÉ")
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!")
            break
        } else if i == nbCoupsMax {
            print("")
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!")
            print("PERDU")
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!")
        } else if nb  < chiffreMystère {
            print("^^^^^ Le nombre à deviner est plus grand. ^^^^^")
        } else {
            print("vvvvv Le nombre à deviner est plus petit. vvvvv")
        }
        
    }
}

func partiePerso() {
    
    print("","""
===================================
CONFIGURATION DE PARTIE PESONNALISÉ
""", separator:"\n")
    let vMin = inputInt("Valeur minimal à trouver", defaultVal: 1)
    let vMax = inputInt("Valeur maximal à trouver", defaultVal: 10)
    let nb = inputInt("Nombre d'essaies", defaultVal: 5)
    partie(borneMin: vMin, borneMax: vMax, nbEssaie: nb)
}
func Menu(){
    while true {
        
        print("","""
=====================
Vos choix:
1: Partie classique
2: Partie rapide
3: Partie personnalisé
0: Quitter
""", separator:"\n")
        let choix = inputInt("Que voulez-vous faire?",max: 3)
        switch choix {
        case 1:
            partie()
        case 2:
            partie(borneMin:21, borneMax: 42, nbEssaie: 3)
        case 3:
            partiePerso()
        default:
            return
        }
    }
}
print("Bienvenue au jeu!")
Menu()
print("Bye")
