/************************************************
* The Field Class encapulates the mechanism and *
* data for running the simulation and			*
* generating images of the simulation. The class*
* contains the particle and container data,     *
* file writing pointer, and several member      *
* functions. These functions include scripting  *
* and image, enumerating particles, invoking    *
* dynamincs, and generating a time step.		*
*												*
* Justin Dierking								*
* justin.dierking@appliedo.com					*
* (937) - 475 - 1735							*
* 8406 SR 72									*
* Springfield, OH 45502							*
************************************************/

#ifndef _FIELD

#define _FIELD

#include <vector>
#include <string>
#include <iostream>
#include <math.h>
#include "container.h"
#include "triset.h"
#include "part.h"
#include "dynamix.h"
#include "bumper.h"

using namespace std;

class field
{
	public:
		// Primary Functions
		void enumerate(double tstep);	// Enumerate Particles for a Given Time Step
		void interact();				// Apply Dynamics
		double gettstep();				// Generate Time Step

		// Data
		part* elts;				// Particle Data
		void resizeElts(int size);
		int numElts;
		
		bumper* bumpers;		// Container Bumpers
		void resizeBumpers(int size);
		int numBumpers;

		container* cont;		// Container Data
		void resizeCont(int size);
		int numCont;

		// File Pointer
		FILE* wtstrm;
};

#endif