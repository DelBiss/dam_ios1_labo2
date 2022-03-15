//
//  main.swift
//  dam_ios1_labo2
//
//  Created by Philippe Allard-Rousse (Étudiant) on 2022-03-15.
//



import Foundation
var str = "Bienvenue au jeu!"
let borneMin = 1
let borneMax = 100
let chiffreMystère = Int(arc4random_uniform(10) + 1) // Écrire la formule qui permet de calculer un chiffre entre borneMin et borneMax
let nbCoupsMax = 3
print("DB 1: \(chiffreMystère)")
for i in /* TODO */{
 print("Entrez un nombre:")
 let res /* Mettre le type de res */ = readLine()

 let nb = Int(res) // HMMMM Ce truc marche pas. Que faire?
 print("DB 2: \(nb)")

 if i > nbCoupsMax {
 print("Perdu")
 break // Faut-il mettre un break ici?
 } else if nb == chiffreMystère {
 print("Gagné")
 break
 } else {
 if nb /* TODO Insérer un comaprateur*/ chiffreMystère {
 print("Le nombre à deviner est plus grand.")
 } else {
 print("Le nombre à deviner est plus petit.")
 }
 }
}
print("Bye")
