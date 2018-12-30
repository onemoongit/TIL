//
//  Functions.swift
//  Sec3_MyLocations
//
//  Created by Hyeontae on 30/12/2018.
//  Copyright © 2018 onemoon. All rights reserved.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    // 당장실행시키는 것이 아니라 가지고 잇는 거라서 escaping을 사용했다.
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds,
                                  execute: run)
}

