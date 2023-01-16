//
//  JokenpoLogic.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/01/23.
//

import Foundation

class Jokenpo {
    private static var wins = 0
    private static var draws = 0
    private static var loses = 0
    static var getWins: Int {return wins;}
    static var getDraws: Int {return draws;}
    static var getLoses: Int {return loses;}
    static func play(player: Int, cpu: Int) {
        if (player == 0 && cpu == 2 || player == 0 && cpu == 3 ||
            player == 1 && cpu == 0 || player == 1 && cpu == 4 ||
            player == 2 && cpu == 1 || player == 2 && cpu == 3 ||
            player == 3 && cpu == 1 || player == 3 && cpu == 4 ||
            player == 4 && cpu == 0 || player == 4 && cpu == 2) {
            wins += 1;
        }
        else if (player == cpu) {
            draws += 1;
        }
        else {
            loses += 1;
        }
    }
}
