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

#include "part.h"

using namespace std;

// Default Construction
part::part()
{
	mas			= 1;			// Mass
	rad			= 5;			// Radius
	isStatic	= 0;			// Static
	numBinders	= 0;
	density		= 0;
	restDensity = 7.5;
	attCoef		= .0001;
	drgCoef		= .01;
	fdfCoef		= .1;
	type		= 0;
	rbm         = 0;
}

void part::resizeBinders(int size)
{
	numBinders   = size;
	bdist        = new double[size];
	bindings     = new int[size];
	damper       = new double[size];
	spring       = new double[size];
	stretch      = new double[size];
}

// Defaults
void part::zero()
{
	mas		= 1;			// Mass
	rad		= 5;			// Radius
	pos.zero();
	vel.zero();
	acc.zero();
	frc.zero();
	color.zero();
	normal.zero();
}




// Particle Inertia
double part::inertia()
{
	return vel.mag() * mas;
}




// Enumerate Particle For the Given Time Step
void part::enumerate(double tstep)
{
	// Sum Up Acceleration from Undergone Force and Normal Acceleration
	acc.x = frc.x / mas + normal.x;
	acc.y = frc.y / mas + normal.y;
	acc.z = frc.z / mas + normal.z;

	// Integrate Velocity from Acceleration for the Time Step
	vel.x = vel.x + tstep * acc.x;
	vel.y = vel.y + tstep * acc.y;
	vel.z = vel.z + tstep * acc.z;

	// Integrate Position from Velocity for the Time Step
	pos.x = pos.x + tstep * vel.x;
	pos.y = pos.y + tstep * vel.y;
	pos.z = pos.z + tstep * vel.z;
}