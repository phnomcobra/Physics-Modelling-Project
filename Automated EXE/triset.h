/************************************************
* Triset 3D vector data type. Components are	*
* composed of doubles which default to 0 uppon	*
* initialization. Member functions include		*
* magnitude and unit vector. The basic math		*
* operators have been overloaded to interact    *
* with other trisets as well as doubles. These  *
* operations include dot product, scalar		*
* product, addition, and subtraction.			*
*												*
* Justin Dierking								*
* justin.dierking@appliedo.com					*
* (937) - 475 - 1735							*
* 8406 SR 72									*
* Springfield, OH 45502							*
************************************************/

#ifndef _TRISET

#define _TRISET

#include <vector>
#include <math.h>

using namespace std;

class triset
{
	public:	
		// Default Contructor
		triset();		
		
		// Triset Data
		double x;
		double y;
		double z;
		
		// Vector Magnitude
		double mag();

		// Unit Vector
		triset unit();
		triset aunit();

		// Operator Overloading
		triset operator-(triset& temp);	// Subtraction
		triset operator+(triset& temp); // Addition
		triset operator*(triset& temp);	// Element to Element Product
		triset operator*(double c);		// Scalar Product
		triset operator/(triset& temp);	// Element to Element Division
		triset operator/(double c);		// Scalar Division

		// Defaults
		void zero();
};

#endif
