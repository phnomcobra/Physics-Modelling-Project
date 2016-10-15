/************************************************
* The Dynamix Class encapsulates a collection   *
* of static and interactive dynamics that get   *
* summarily applied to every particle. These    *
* dynamics include laminosity, linear drag,     *
* relative velocity dependent particle			*
* attraction, particle repulsion, and particle  *
* containment. The class also includes member   *
* functions for a barycentic coordinate test    *
* calculating to area of a triangle.			*
*												*
* Justin Dierking								*
* justin.dierking@appliedo.com					*
* (937) - 475 - 1735							*
* 8406 SR 72									*
* Springfield, OH 45502							*
************************************************/

#ifndef _DYNAMIX

#define _DYNAMIX

#include <vector>
#include <string>
#include <math.h>
#include "triset.h"
#include "part.h"
#include "field.h"
#include "bumper.h"

using namespace std;

class dynamix
{
	public:
		// Particle Dynamics
		static void attraction(part& a, part& b);																	// Velocity Controlled Attraction
		static void repulsion(part& a, part& b);																	// Repulsion
		static void laminosity(part& a, part& b);																	// Laminosity
		static void thermal(part& a, part& b);																		// Thermal
		static void drag(part& a);																					// Linear Drag
		static void containment(part& a, container& c, part* elts);													// Containment
		static void binding(part& a, part& b, double dist, double springCoef, double damperCoef, double stretch);	// Particle Binding
		static void containerbumper(part& a, bumper& b, part* elts);												// Container Bumpers
		static void bumper2bumper(bumper b0, bumper b1, part* elts);
		
	private:
		// Support Functions
		static bool   rayinter(part& a, container& b);					// Barycentric Coordinate Test
		static double dot(triset& a, triset& b);						// Dot Product
		static double area(double sa, double sb, double sc);			// Area of Irregular Triangle
		static triset interptriset(triset a, triset b, double d);		// Interpolate Triset	
};

#endif