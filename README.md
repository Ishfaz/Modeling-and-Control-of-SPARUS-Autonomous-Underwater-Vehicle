# Modeling of the Underwater Vehicle SPARUS

## Overview

This repository contains the documentation and code for the modeling of the SPARUS submarine. The project involves detailed analysis of the submarine's dynamics, including mass and drag matrices, added mass calculations, and simulation results. The primary objective of this model is to simulate and understand the dynamics of the SPARUS submarine under various conditions, including thruster activation and buoyancy effects.

## Table of Contents
1. [Introduction](#introduction)
2. [Global Mass Matrix](#global-mass-matrix)
3. [Added Mass Matrices](#added-mass-matrices)
4. [Comparison of Different Matrix Mass](#comparison-of-different-matrix-mass)
5. [Drag Matrices](#drag-matrices)
6. [Coriolis Matrix Modeling](#coriolis-matrix-modeling)
7. [Simulation Results](#simulation-results)
8. [Conclusion](#conclusion)

## 1. Introduction

This document provides an overview of the modeling process for the SPARUS submarine. The project includes defining the basic characteristics and dimensions of different parts of the submarine, with a focus on calculating the center of gravity (CG) for each body part.

## 2. Global Mass Matrix

The global mass matrix is calculated using the real mass and inertia values of the submarine. This matrix helps in analyzing the distribution of mass components and the coupling effects between various parts. The global mass matrix plays a vital role in understanding how different forces affect the submarine’s movement.

## 3. Added Mass Matrices

In this section, we compute the added mass matrices for different parts of the submarine. The methodology and theory behind determining added mass coefficients are also explained. The added mass matrix provides insights into the extra inertia experienced by the vehicle when moving through water.

## 4. Comparison of Different Matrix Mass

This section provides a detailed comparison between:
- Added mass matrices at the center of gravity (CG) and the center of buoyancy (CB).
- Added mass matrices for different parts of the submarine such as the main body, antenna, and thrusters.

## 5. Drag Matrices

The calculation of drag coefficients for various parts of the submarine is presented here. The projected surfaces of the different parts and their respective drag coefficients are computed. These calculations help in understanding how drag forces affect the submarine’s movement, which is critical for optimizing its hydrodynamic performance.

## 6. Coriolis Matrix Modeling

Coriolis forces arise due to the velocity of the submarine and influence its trajectory. This section explains the equations and matrices used to model the Coriolis forces affecting the submarine. The Coriolis matrix is derived and discussed in detail.

## 7. Simulation Results

The repository also contains the simulation results obtained by applying different thruster forces and observing the effects of buoyancy. Several scenarios are simulated, and the following results are analyzed:
- XY-trajectory and depth trajectory.
- Velocities and accelerations of the submarine in various conditions.
- Effects of buoyancy and thruster configurations on submarine motion.

## 8. Conclusion

This section emphasizes the importance of drag matrices in designing efficient underwater vehicles. It highlights the critical role of considering the drag forces acting on individual subcomponents for optimizing the overall performance of the vehicle. Understanding the interaction of mass, drag, and Coriolis forces helps in designing a stable and efficient underwater vehicle like SPARUS.

## How to Use

To run simulations and view results:
1. Clone this repository to your local machine.
2. Open the `modeling` directory to find Python and MATLAB files for mass matrix and drag matrix calculations.
3. Run the provided simulation scripts to reproduce the results shown in this document.

## References

- Fossen, T. I., *Handbook of Marine Craft Hydrodynamics and Motion Control*. Wiley, 2011.
- Severholt, J., *Generic 6-DOF Added Mass Formulation for Arbitrary Underwater Vehicles based on Existing Semi-Empirical Methods*. R. Institute of Technology, Sweden, 2017.

---

**Note**: Some figures, tables, and simulations mentioned in the report are attached in the repository. For additional information, refer to the attached AutoCAD and Python files.

