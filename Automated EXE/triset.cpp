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

#include "triset.h"

using namespace std;

// Default Constructor
triset::triset()
{
	this->x = 0;
	this->y = 0;
	this->z = 0;
}




// Defaults
void triset::zero()
{
	this->x = 0;
	this->y = 0;
	this->z = 0;
}




// Magnitude of Vector
double triset::mag()
{
	return sqrt(pow(this->x, 2) + pow(this->y, 2) + pow(this->z, 2));
}




// Unit Vector of Vector
triset triset::unit()
{
	// Initialization
	double d = 0;	// Divisor
	triset temp;	// Temp triset
	
	// Calculate Magnitude
	d = sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));

	// Element Division
	if(d != 0)
	{
		temp.x = this->x / d;
		temp.y = this->y / d;
		temp.z = this->z / d;
	}

	// Return Object
	return temp;
}

// Unit Vector of Vector
triset triset::aunit()
{
	// Initialization
	double d = 0;	// Divisor
	triset temp;	// Temp triset
	
	// Calculate Magnitude
	d = sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));

	// Element Division
	if(d != 0)
	{
		temp.x = abs(this->x / d);
		temp.y = abs(this->y / d);
		temp.z = abs(this->z / d);
	}

	// Return Object
	return temp;
}



// Subtraction Operator Overload
triset triset::operator-(triset& temp)
{
	triset answer;
	
	answer.x = this->x - temp.x;
	answer.y = this->y - temp.y;
	answer.z = this->z - temp.z;

	return answer;
}




// Addition Operator Overload
triset triset::operator+(triset& temp)
{
	triset answer;
	
	answer.x = this->x + temp.x;
	answer.y = this->y + temp.y;
	answer.z = this->z + temp.z;

	return answer;
}




// Element to Element Product Operator Overload
triset triset::operator*(triset& temp)
{
	triset answer;
	
	answer.x = this->x * temp.x;
	answer.y = this->y * temp.y;
	answer.z = this->z * temp.z;

	return answer;
}




// Scalar Product Operator Overload
triset triset::operator*(double c)
{
	triset answer;
	
	answer.x = this->x * c;
	answer.y = this->y * c;
	answer.z = this->z * c;

	return answer;
}




// Element to Element Division Operator Overload
triset triset::operator/(triset& temp)
{
	triset answer;
	
	answer.x = this->x / temp.x;
	answer.y = this->y / temp.y;
	answer.z = this->z / temp.z;

	return answer;
}




// Scalar Division Operator Overload
triset triset::operator/(double c)
{
	triset answer;
	
	answer.x = this->x / c;
	answer.y = this->y / c;
	answer.z = this->z / c;

	return answer;
}