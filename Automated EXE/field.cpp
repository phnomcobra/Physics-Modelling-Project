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

#include "field.h"

using namespace std;

void field::resizeElts(int size)
{
	numElts = size;
	elts =  new part[size];
}

void field::resizeBumpers(int size)
{
	numBumpers = size;
	bumpers =  new bumper[size];
}

void field::resizeCont(int size)
{
	numCont = size;
	cont =  new container[size];
}


// Enumerate Particles
void field::enumerate(double tstep)
{
	bool trigger;
	int j;

	for(int i = 0; i < this->numElts; i++)
	{
		if(!this->elts[i].isStatic) this->elts[i].enumerate(tstep);
		elts[i].tmp = elts[i].tmp + elts[i].tld * tstep;
	}

	for(int i = 0; i < this->numCont; i++)
	{
		if(this->cont[i].p1 > -1)
		{
			this->cont[i].x1 = this->elts[this->cont[i].p1].pos.x;
			this->cont[i].y1 = this->elts[this->cont[i].p1].pos.y;
			this->cont[i].z1 = this->elts[this->cont[i].p1].pos.z;
		}
		
		if(this->cont[i].p2 > -1)
		{
			this->cont[i].x2 = this->elts[this->cont[i].p2].pos.x;
			this->cont[i].y2 = this->elts[this->cont[i].p2].pos.y;
			this->cont[i].z2 = this->elts[this->cont[i].p2].pos.z;
		}
		
		if(this->cont[i].p3 > -1)
		{
			this->cont[i].x3 = this->elts[this->cont[i].p3].pos.x;
			this->cont[i].y3 = this->elts[this->cont[i].p3].pos.y;
			this->cont[i].z3 = this->elts[this->cont[i].p3].pos.z;
		}
	}
}




// Apply Particle Dynamics
void field::interact()
{
	// Initialize Data
	int i, j, k, g, hits;					// For Loop Iterators
	double tstep = field::gettstep();	// Time Step
	double r;
	dynamix fx;							// Dynamix Object
	
	// Zero Undergone Force and Thermal Load
	for(i = 0; i < numElts; i++)
	{
		elts[i].frc.x   = 0;
		elts[i].frc.y   = 0;
		elts[i].frc.z   = 0;
		elts[i].tld     = 0;
	}

	// Containment Dynamics
	for(i = 0; i < numElts; i++)
	{
		for(j = 0; j < numCont; j++)
		{
			if((cont[j].p1 != i) &&
			   (cont[j].p2 != i) &&
			   (cont[j].p3 != i)) fx.containment(elts[i], cont[j], elts);
		}
	}

	// Static Dynamics
	for(i = 0; i < numElts; i++)
	{
		fx.drag(elts[i]);	// Linear Drag
	}

	// Interactive Dynamics
	for(j = 0; j < numElts; j++)
	{
		elts[j].density = 0;
		
		for(i = 0; i < numElts; i++)
		{
			if(i != j)
			{
				r = (elts[i].pos - elts[j].pos).mag();

				if(r < 5) 
				{
					elts[j].density = elts[j].density + pow(1 - (r / 2.5), 2);
				}
			}
		}
	}

	// Interactive Dynamics
	for(j = 0; j < numElts; j++)
	{
		for(i = j + 1; i < numElts; i++)
		{
			if(elts[i].rbm == 1 && elts[i].type != elts[j].type) fx.repulsion(elts[i], elts[j]); // Repulsion
			if(elts[j].rbm == 1 && elts[i].type != elts[j].type) fx.repulsion(elts[j], elts[i]); // Repulsion
			
			if(elts[i].rbm == 2 && elts[i].type == elts[j].type) fx.repulsion(elts[i], elts[j]); // Repulsion
			if(elts[j].rbm == 2 && elts[i].type == elts[j].type) fx.repulsion(elts[j], elts[i]); // Repulsion
			
			if(elts[i].rbm == 3) fx.repulsion(elts[i], elts[j]); // Repulsion
			if(elts[j].rbm == 3) fx.repulsion(elts[j], elts[i]); // Repulsion
	
			if(elts[i].type == elts[j].type)
			{
				fx.attraction(elts[i], elts[j]);	// Attraction
				fx.laminosity(elts[i], elts[j]);	// Laminosity	
				fx.attraction(elts[j], elts[i]);	// Attraction
				fx.laminosity(elts[j], elts[i]);	// Laminosity
			}

			fx.thermal(elts[j], elts[i]);	// Thermal
			fx.thermal(elts[i], elts[j]);	// Thermal
		}
	}
	
	// Bumper Dynamics
	for(j = 0; j < numBumpers; j++)
	{
		for(i = j + 1; i < numBumpers; i++)
		{
			if(elts[bumpers[j].p0].rbm == 1 && elts[bumpers[j].p0].type != elts[bumpers[i].p0].type && elts[bumpers[i].p0].rbm != 2)
			{
				if(!((elts[bumpers[j].p0].isStatic || elts[bumpers[j].p1].isStatic) &&
				(elts[bumpers[i].p0].isStatic || elts[bumpers[i].p1].isStatic)))
				{
					if((bumpers[i].p0 != bumpers[j].p0) &&
						(bumpers[i].p1 != bumpers[j].p0) &&
						(bumpers[i].p0 != bumpers[j].p1) &&
						(bumpers[i].p1 != bumpers[j].p1)) fx.bumper2bumper(bumpers[i], bumpers[j], elts);
				}
			}

			if(elts[bumpers[j].p0].rbm == 2 && elts[bumpers[j].p0].type == elts[bumpers[i].p0].type && elts[bumpers[i].p0].rbm != 1)
			{
				if(!((elts[bumpers[j].p0].isStatic || elts[bumpers[j].p1].isStatic) &&
				(elts[bumpers[i].p0].isStatic || elts[bumpers[i].p1].isStatic)))
				{
					if((bumpers[i].p0 != bumpers[j].p0) &&
						(bumpers[i].p1 != bumpers[j].p0) &&
						(bumpers[i].p0 != bumpers[j].p1) &&
						(bumpers[i].p1 != bumpers[j].p1)) fx.bumper2bumper(bumpers[i], bumpers[j], elts);
				}
			}

			if(elts[bumpers[j].p0].rbm == 3)
			{
				if(elts[bumpers[i].p0].rbm == 1 && elts[bumpers[i].p0].type != elts[bumpers[j].p0].type)
				{
					if(!((elts[bumpers[j].p0].isStatic || elts[bumpers[j].p1].isStatic) &&
					(elts[bumpers[i].p0].isStatic || elts[bumpers[i].p1].isStatic)))
					{
						if((bumpers[i].p0 != bumpers[j].p0) &&
							(bumpers[i].p1 != bumpers[j].p0) &&
							(bumpers[i].p0 != bumpers[j].p1) &&
							(bumpers[i].p1 != bumpers[j].p1)) fx.bumper2bumper(bumpers[i], bumpers[j], elts);
					}
				}

				if(elts[bumpers[i].p0].rbm == 2 && elts[bumpers[i].p0].type == elts[bumpers[j].p0].type)
				{
					if(!((elts[bumpers[j].p0].isStatic || elts[bumpers[j].p1].isStatic) &&
					(elts[bumpers[i].p0].isStatic || elts[bumpers[i].p1].isStatic)))
					{
						if((bumpers[i].p0 != bumpers[j].p0) &&
							(bumpers[i].p1 != bumpers[j].p0) &&
							(bumpers[i].p0 != bumpers[j].p1) &&
							(bumpers[i].p1 != bumpers[j].p1)) fx.bumper2bumper(bumpers[i], bumpers[j], elts);
					}
				}

				if(elts[bumpers[i].p0].rbm == 3)
				{
					if(!((elts[bumpers[j].p0].isStatic || elts[bumpers[j].p1].isStatic) &&
					(elts[bumpers[i].p0].isStatic || elts[bumpers[i].p1].isStatic)))
					{
						if((bumpers[i].p0 != bumpers[j].p0) &&
							(bumpers[i].p1 != bumpers[j].p0) &&
							(bumpers[i].p0 != bumpers[j].p1) &&
							(bumpers[i].p1 != bumpers[j].p1)) fx.bumper2bumper(bumpers[i], bumpers[j], elts);
					}
				}
			}
		}
	}

	// Bumper to Particle Dynamics
	for(j = 0; j < numBumpers; j++)
	{
		for(i < 0; i < numElts; i++)
		{
			if(elts[bumpers[j].p0].rbm == 1 && elts[bumpers[j].p0].type != elts[i].type && elts[i].rbm != 2)
			{
				if((i != bumpers[j].p0) && (i != bumpers[j].p1))
				{
					fx.containerbumper(elts[i], bumpers[j], elts);
				}
			}

			if(elts[bumpers[j].p0].rbm == 2 && elts[bumpers[j].p0].type == elts[i].type && elts[i].rbm != 1)
			{
				if((i != bumpers[j].p0) && (i != bumpers[j].p1))
				{
					fx.containerbumper(elts[i], bumpers[j], elts);
				}
			}

			if(elts[bumpers[j].p0].rbm == 3)
			{
				if(elts[i].rbm == 1 && elts[bumpers[j].p0].type != elts[i].type)
				{
					if((i != bumpers[j].p0) && (i != bumpers[j].p1))
					{
						fx.containerbumper(elts[i], bumpers[j], elts);
					}
				}

				if(elts[i].rbm == 2 && elts[bumpers[j].p0].type == elts[i].type)
				{
					if((i != bumpers[j].p0) && (i != bumpers[j].p1))
					{
						fx.containerbumper(elts[i], bumpers[j], elts);
					}
				}

				if(elts[i].rbm == 3)
				{
					if((i != bumpers[j].p0) && (i != bumpers[j].p1))
					{
						fx.containerbumper(elts[i], bumpers[j], elts);
					}
				}
			}
		}
	}

	// Descrete Dynamics
	for(j = 0; j < numElts; j++)
	{
		for(i = 0; i < elts[j].numBinders; i++)
		{
			fx.binding(elts[j], elts[elts[j].bindings[i]], elts[j].bdist[i], elts[j].spring[i], elts[j].damper[i], elts[j].stretch[i]);
		}
	}

	// Zero Undergone Force on Static Particles
	for(i = 0; i < numElts; i++)
	{
		if(elts[i].isStatic)
		{
			elts[i].frc.x   = 0;
			elts[i].frc.y   = 0;
			elts[i].frc.z   = 0;
		}
	}
}




// Calculate Time Step
double field::gettstep()
{
	// Initialize Vector Extremities
	double xmin = 0;
	double ymin = 0;
	double zmin = 0;
	double xmax = 0;
	double ymax = 0;
	double zmax = 0;
	
	// Initilize Time Step Values
	double tstep;
	double tstepF;
	double tstepV;

	// Calculate Time Step by Field Velocity Differential
	for(int i = 0; i < numElts; i++)
	{
		if(elts[i].vel.x > xmax)
			xmax = elts[i].vel.x;
		if(elts[i].vel.y > ymax)
			ymax = elts[i].vel.y;
		if(elts[i].vel.z > zmax)
			zmax = elts[i].vel.z;
		
		if(elts[i].vel.x < xmin)
			xmin = elts[i].vel.x;
		if(elts[i].vel.y < ymin)
			ymin = elts[i].vel.y;
		if(elts[i].vel.z < zmin)
			zmin = elts[i].vel.z;		
	}
	if(sqrt(pow(xmax - xmin, 2) + pow(ymax - ymin, 2) + pow(zmax - zmin, 2)) != 0)
		tstepV = 1 / (sqrt(pow(xmax - xmin, 2) + pow(ymax - ymin, 2) + pow(zmax - zmin, 2)));
	else
		tstepV = 1;

	
	xmax = 0;
	ymax = 0;
	zmax = 0;

	// Calculate Time Step by Field Force Differential
	for(int i = 0; i < numElts; i++)
	{
		if(abs(elts[i].frc.x) > xmax)
			xmax = abs(elts[i].frc.x);
		if(abs(elts[i].frc.y) > ymax)
			ymax = abs(elts[i].frc.y);
		if(abs(elts[i].frc.z) > zmax)
			zmax = abs(elts[i].frc.z);
	}
	if(sqrt(pow(xmax, 2) + pow(ymax, 2) + pow(zmax, 2)) > 0)
		tstepF = 1 / (sqrt(pow(xmax, 2) + pow(ymax, 2) + pow(zmax, 2)));
	else 
		tstepF = 1;
	
	
	if(tstepF < tstepV) tstep = tstepF;
	else                tstep = tstepV;

	if(tstep > 1)    tstep = 1;

	// Return Time Step
	return(tstep);
}