//
//  main.swift
//  RSANumbers
//
//  Created by Gordon, Russell on 2018-04-04.
//  Copyright © 2018 Gordon, Russell. All rights reserved.
//

import Foundation

// INPUT
// Collect and filter user input here

//imput 1: lower limit
var lowerLimit = 0 // Invalid at start

//loop
while true {
    
    // Show prompt
    print("Enter lower limit of range")
    
    // Get input
    // 1: Make sure input isnt nil
    guard let givenInput = readLine() else {
        
        // bad input
        continue
        
    }
    
    // Make sure our input is an integer
    guard let givenInteger = Int(givenInput) else {
        
        continue
    }
    
    // Make sure input is greater than or equal to 1
    if givenInteger < 1 {
        
        
        continue
    }
    
    // If we got here, the input is valid
    lowerLimit = givenInteger
    break // exit this input loop
    
}

//imput 2: upper limit
var upperLimit = 0 // Invalid to start
//loop
while true {
    
    
    print("Enter upper limit of range")
    
    //1: Make sure input is not nil
    guard let givenInput = readLine() else {
        
        // bad input
        continue
        
    }
    
    // Make sure input is an integer
    guard let givenInteger = Int(givenInput) else {
        
        continue
    }
    
    // Make sure input is less than or equal to 1000
    if givenInteger > 1000 {
        
        
        continue
    }
    
    // If we got here, the input is valid
    upperLimit = givenInteger
    break // exit this input loop
    
}

// PROCESS
// Implement the primary logic of the problem here

// Get the number of possible divisors for the given number
func countOfDivisors(for number: Int) -> Int {
    
    // Track number of divisors
    if number == 1 {
        return 1
    } else if number == 2 || number == 3 {
        return 2
    } else {
        
        // Every number 4 or greater has at least two divisors
        var divisorCount = 2
    
        for possibleDivisor in 2...number / 2 {
            
            if number % possibleDivisor == 0 {
                divisorCount += 1
            }
            
        }
        // Return the number of divisors
        return divisorCount
    }
    
}

// Keep track of count of RSA numbers founds
var countOfRSANumbers = 0

// Check each number inside the range of the lower and upper limit
for aNumber in lowerLimit...upperLimit {
    
    // Get count of divisors and when count is 4, we have an RSA number
    if countOfDivisors(for: aNumber) == 4 {
        countOfRSANumbers += 1
    }
}


// OUTPUT
// Report results to the user here

//just printing the result

print("Number of RSA numbers between \(lowerLimit) and \(upperLimit) is \(countOfRSANumbers)")

