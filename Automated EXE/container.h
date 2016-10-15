/************************************************
* The Container Class is a data type for		*
* the position attributes for a 3D triangular   *
* face. The class contains 9 doubles that		*
* specify the before mentioned attributes as    *
* well as the relavent normal of the triangle.  *
* Uppon initialization, these doubles are set   *
* to 0.											*
*												*
* Justin Dierking								*
* justin.dierking@appliedo.com					*
* (937) - 475 - 1735							*
* 8406 SR 72									*
* Springfield, OH 45502							*
************************************************/

#ifndef _CONTAINER

#define _CONTAINER

#include "triset.h"
#include <vector>
#include <math.h>

using namespace std;

class container
{
	public:	
		// Default Contructor
		container();		
		
		// Vertex 1
		double x1;
		double y1;
		double z1;
		int    p1;

		// Vertex 2
		double x2;
		double y2;
		double z2;
		int    p2;

		// Vertex 3
		double x3;
		double y3;
		double z3;
		int	   p3;

		// Relevent Normal
		triset normal;
};

#endif
