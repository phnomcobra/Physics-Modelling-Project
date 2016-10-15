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

#include "container.h"

using namespace std;

// Default Contructor
container::container()
{
	x1 = 0;
	y1 = 0;
	z1 = 0;
	p1 = -1;

	x2 = 0;
	y2 = 0;
	z2 = 0;
	p2 = -1;

	x3 = 0;
	y3 = 0;
	z3 = 0;
	p3 = -1;
}
