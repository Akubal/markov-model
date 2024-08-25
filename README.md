# Coin Flip Markov Process Simulation

## Overview

This project simulates a Markov process involving a collection of weighted coins of different types. The process revolves around flipping coins and placing them in an urn based on the outcome. The goal is to understand the behavior of this system over time, including transitions between states and the expected time for the urn to fill with coins.

## Function Descriptions

### 1. `States(K)`
- **Purpose:** Generates a state matrix representing the number of coins of each type in the urn for all possible states.
- **Parameters:**
  - `K`: A vector where each element represents the number of coins of a specific type.
- **Returns:** An m×q array `S` where `S[i, j]` indicates the number of coins of type `i` in the urn in state `j`.

### 2. `GetTransition(S, H)`
- **Purpose:** Calculates the transition matrix that defines the probability of moving from one state to another based on coin flips.
- **Parameters:**
  - `S`: The state matrix produced by the `States` function.
  - `H`: A vector where each element is the probability that a coin of a specific type comes up heads.
- **Returns:** The transition matrix that maps state-to-state changes in the Markov process.

### 3. `GetStationary(T)`
- **Purpose:** Computes the stationary distribution of the transition matrix, indicating the long-term behavior of the system.
- **Parameters:**
  - `T`: The transition matrix.
- **Returns:** A vector representing the stationary distribution of the system's states.

### 4. `GetProbFullUrn(T, N)`
- **Purpose:** Calculates the probability that the urn will be full on or before a given number of coin flips.
- **Parameters:**
  - `T`: The transition matrix.
  - `N`: The number of coin flips to consider.
- **Returns:** A vector of size `N` where each element represents the probability that the urn is full at or before that step.

### 5. `GetExpTimeToFill(T, EPS)`
- **Purpose:** Estimates the expected number of coin flips required to fill the urn, with a specified accuracy.
- **Parameters:**
  - `T`: The transition matrix.
  - `EPS`: A small positive number indicating the desired accuracy of the estimate.
- **Returns:** The expected number of flips needed to fill the urn to the specified accuracy.

## Usage

To use these functions, set up the initial parameters for the number of coins, their types, and their respective probabilities of landing heads. Then, use the functions to simulate the process, calculate transition probabilities, determine stationary distributions, and estimate the time required for the urn to become full.


