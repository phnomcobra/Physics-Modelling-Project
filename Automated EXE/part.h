/************************************************
* Particle data type for a spheroid element.    *
* This data type contains several trisets and   *
* doubles in an effort to characterize the      *
* particle's mass, radius, color, undergoing    *
* force, acceleration, velocity, position, and  *
* normal acceleration.							* 
*												*
* Justin Dierking								*
* justin.dierking@appliedo.com					*
* (937) - 475 - 1735							*
* 8406 SR 72									*
* Springfield, OH 45502							*
************************************************/

#ifndef _PART

#define _PART

#include <vector>
#include <string>
#include "triset.h"

using namespace std;

class part
{
	public:
		// Default Contruction
		part();
		
		// Particle Data
		triset pos;			// Position
		triset vel;			// Velocity
		triset acc;			// Acceleration
		triset frc;			// Undergone Force
		triset color;		// Display Color
		double mas;			// Mass
		double rad;			// Radius
		triset normal;		// Normal Acceleration
		double density;		
		double restDensity; // Rest Density
		double attCoef;		// Attraction Coefficient
		double fdfCoef;		// Force Diffusion Coefficient
		double drgCoef;		// Drag Coefficient
		int    type;
		double tmp;			// Temperature
		double tcp;			// Thermal Capacity
		double ter;			// Thermal Exchange Rate Coefficient
		int    rbm;			// Rigid Body Mode
		double tld;

		// Particle Flags
		bool isStatic;
		
		// Particle Bindings
		void	resizeBinders(int size);
		int		numBinders;
		int*    bindings;
		double* bdist;
		double* spring;
		double* damper;
		double* stretch;
		
		// Particle Inertia
		double inertia();

		// Defaults
		void zero();
		
		// Enumerate Particle For the Given Time Step
		void enumerate(double tstep);
};

#endif
