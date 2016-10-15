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

#include "dynamix.h"

using namespace std;

// Velocity Controlled Particle Attraction
void dynamix::attraction(part& a, part& b)
{
	triset tcoef = (b.pos - a.pos).unit();

	if((b.pos - a.pos).mag() < 10) a.frc = a.frc + tcoef * (a.restDensity - a.density) * a.attCoef;
}

void dynamix::thermal(part& a, part& b)
{
	if((b.pos - a.pos).mag() < (2 * (a.rad + b.rad))) a.tld = a.tld + (b.tmp - a.tmp) * (b.tcp / a.tcp) * .5 * (a.ter + b.ter);
}

// Particle Binding
void dynamix::binding(part& a, part& b, double dist, double springCoef, double damperCoef, double stretch)
{
	double coef;
	part   aN = a;
	part   bN = b;
	
	aN.enumerate(.000001);
	bN.enumerate(.000001);

	triset tcoef = (b.pos - a.pos).unit();
	double coefD = ((aN.pos - bN.pos).mag() - (a.pos - b.pos).mag()) * 1000000;
	
	// Calculate Scalar Coefficent
	coef    = ((a.pos - b.pos).mag() - dist);
		
	// Apply Attraction
	a.frc = a.frc + tcoef * (springCoef * coef + damperCoef * coefD) * .5;
	b.frc = b.frc - tcoef * (springCoef * coef + damperCoef * coefD) * .5;
}

// Particle Repulsion
void dynamix::repulsion(part& a, part& b)
{
	/*
	triset tcoef;
	double intru;
	triset pa;

	// Apply Repulsion for a Negative Range
	if((a.pos - b.pos).mag() < (a.rad + b.rad))
	{
		// Initialize Intrusion Factor by Particle Radius
		intru = ((a.rad + b.rad) - (a.pos - b.pos).mag()) / (a.rad + b.rad);
				
		// Create Unit Vector for A and B's Difference of Position
		tcoef = (b.pos - a.pos).unit();

		// Apply Repulsion
		if((b.pos - a.pos).mag() > (b.pos + (b.vel * .000001) - a.pos - (a.vel * .000001)).mag())
		{
		a.frc = a.frc - tcoef * ((a.vel.unit() * (tcoef * a.vel).mag() * a.mas) - (b.vel.unit() * (tcoef * b.vel).mag() * b.mas)).mag() / 2;
		}
		if((b.vel - a.vel).mag() > (b.vel + (b.acc * .000001) - a.vel - (a.acc * .000001)).mag())
		{
		a.frc = a.frc - tcoef * ((a.acc.unit() * (tcoef * a.acc).mag() * pow(a.mas, 2)) - (b.acc.unit() * (tcoef * b.acc).mag() * pow(b.mas, 2))).mag() / 2;
		}
		a.frc = a.frc - (tcoef * intru * 10);
	}
	*/
	
	double coef;
	part   aN = a;
	part   bN = b;
	
	aN.enumerate(.000001);
	bN.enumerate(.000001);

	triset tcoef = (b.pos - a.pos).unit();
	double coefD = ((aN.pos - bN.pos).mag() - (a.pos - b.pos).mag()) * 1000000;
	
	// Calculate Scalar Coefficent
	coef    = ((a.pos - b.pos).mag() - (a.rad + b.rad));
		
	// Apply Repulsion
	if(coef < 0) a.frc = a.frc + tcoef * (1000 * coef + 100 * coefD) * .5;
}

// Particle Laminosity
void dynamix::laminosity(part& a, part& b)
{
	double r;
	triset tcoef;

	part   aN = a;
	part   bN = b;
	
	aN.enumerate(.000001);
	bN.enumerate(.000001);

	double coefD = ((aN.pos - bN.pos).mag() - (a.pos - b.pos).mag()) * 1000000;

	// Initialize Range
	r = ((a.pos - b.pos).mag() - a.rad - b.rad);

	// Apply Dynamic for a Positive Range
	if(r > 0 && r < (a.rad + b.rad))
	{
		// Initialize Transfer Coeffecient
		tcoef = (b.pos - a.pos).unit() * a.fdfCoef * coefD;

		// Apply Diffusion
		a.frc = a.frc + tcoef * (b.mas / a.mas);
	}
}

// Linear Drag
void dynamix::drag(part& a)
{
	a.frc = a.frc - a.vel * a.drgCoef;
}

// Calculate Dot Product
double dynamix::dot(triset& a, triset& b)
{
	return(a.x * b.x + a.y * b.y + a.z * b.z);
}

// Barycentric Coordinate Test
bool dynamix::rayinter(part& a, container& b)
{
	// Barycentric Coordinate Test
	triset p0; triset p1; triset p2; triset pa;								// Vertices
	triset v0; triset v1; triset v2;										// Vectors
	double dot00; double dot01; double dot02; double dot11; double dot12;	// Dot Products
	double invDenom;														// Inverse Denominator
	double bU; double bV;													// Barycentric Coordinates

	// Define Trisets
	p0.x = b.x1;    p0.y = b.y1;    p0.z = b.z1;
	p1.x = b.x2;    p1.y = b.y2;    p1.z = b.z2;
	p2.x = b.x3;    p2.y = b.y3;    p2.z = b.z3;
	pa.x = a.pos.x; pa.y = a.pos.y; pa.z = a.pos.z;
	
	// Compute vectors        
	v0 = p2 - p0;
	v1 = p1 - p0;
	v2 = pa - p0;

	// Compute dot products
	dot00 = dynamix::dot(v0, v0);
	dot01 = dynamix::dot(v0, v1);
	dot02 = dynamix::dot(v0, v2);
	dot11 = dynamix::dot(v1, v1);
	dot12 = dynamix::dot(v1, v2);

	// Compute barycentric coordinates
	invDenom = (dot00 * dot11 - dot01 * dot01);
	bU       = (dot11 * dot02 - dot01 * dot12) / invDenom;
	bV       = (dot00 * dot12 - dot01 * dot02) / invDenom;

	// Check if point is in triangle
	return((bU > 0) && (bV > 0) && (bU + bV < 1));
}

// Area of Irregular Triangle
double dynamix::area(double sa, double sb, double sc)
{
	double s = (sa + sb + sc) / 2;
	return(sqrt(s * (s - sa) * (s - sb) * (s - sc)));
}

// Particle Container
void dynamix::containment(part& a, container& b, part* elts)
{
	// Container Values
	triset normal;	// Container Normal
	triset u;		// Cross Product Component
	triset v;		// Cross Product Component
	triset n0;		// Normal
	triset n1;		// Normal
	triset cpos;	// Center of Container Triangle
	double alt;		// Particle Altitude
	part   shadow;  // a Projected onto b About by Normal

	double aA;
	double aB;
	double aC;

	double sA;
	double sB;
	double sC;

	// Reset to Defaults
	normal.zero();	// Container Normal
	u.zero();		// Cross Product Component
	v.zero();		// Cross Product Component
	n0.zero();		// Normal
	n1.zero();		// Normal
	cpos.zero();	// Center of Container Triangle
	alt = 0;		// Particle Altitude
	shadow.zero();  // a Projected onto b About by Normal

	// Center of Container
	cpos.x = (b.x1 + b.x2 + b.x3) / 3;
	cpos.y = (b.y1 + b.y2 + b.y3) / 3;
	cpos.z = (b.z1 + b.z2 + b.z3) / 3;

	// First Cross Product
	u.x = b.x1 - b.x2;					// Define U
	u.y = b.y1 - b.y2;
	u.z = b.z1 - b.z2;
	v.x = b.x1 - b.x3;					// Define V
	v.y = b.y1 - b.y3;
	v.z = b.z1 - b.z3;
	normal.x = u.y * v.z - u.z * v.y;	// Compute Normal with Cross Product
	normal.y = u.z * v.x - u.x * v.z;
	normal.z = u.x * v.y - u.y * v.x;
	n0  = normal.unit();
	
	// Second Cross Product
	v.x = b.x1 - b.x2;					// Define V
	v.y = b.y1 - b.y2;
	v.z = b.z1 - b.z2;
	u.x = b.x1 - b.x3;					// Define U
	u.y = b.y1 - b.y3;
	u.z = b.z1 - b.z3;
	normal.x = u.y * v.z - u.z * v.y;	// Compute Normal with Cross Product
	normal.y = u.z * v.x - u.x * v.z;
	normal.z = u.x * v.y - u.y * v.x;
	n1  = normal.unit();
	
	// Select the Anti-Directive Normal with Respect to Particle
	if(((cpos + n0 * .000001) - a.pos).mag() < ((cpos + n1 * .000001) - a.pos).mag()) normal = n0;
	else normal = n1;
	
	// Set Container Normal for Display Purposes Only
	b.normal = normal * 5;

	// Set Up Shadowed Projection Particle
	alt        = dynamix::dot((a.pos - cpos), normal);
	shadow.pos = a.pos - normal * alt;
	shadow.rad = a.rad;
		
	// Apply Containment If Barymetric Test Passes Within Tolerance
	if(rayinter(shadow, b)) 
	{
		if(b.p1 != -1)
		{
			sA = sqrt(pow(b.x1 - a.pos.x, 2) + pow(b.y1 - a.pos.y, 2) + pow(b.z1 - a.pos.z, 2));
			sB = sqrt(pow(b.x2 - a.pos.x, 2) + pow(b.y2 - a.pos.y, 2) + pow(b.z2 - a.pos.z, 2));
			sC = sqrt(pow(b.x1 - b.x2   , 2) + pow(b.y1 - b.y2   , 2) + pow(b.z1 - b.z2   , 2));
			aC = dynamix::area(sA, sB, sC);

			sA = sqrt(pow(b.x2 - a.pos.x, 2) + pow(b.y2 - a.pos.y, 2) + pow(b.z2 - a.pos.z, 2));
			sB = sqrt(pow(b.x3 - a.pos.x, 2) + pow(b.y3 - a.pos.y, 2) + pow(b.z3 - a.pos.z, 2));
			sC = sqrt(pow(b.x2 - b.x3   , 2) + pow(b.y2 - b.y3   , 2) + pow(b.z2 - b.z3   , 2));
			aA = dynamix::area(sA, sB, sC);

			sA = sqrt(pow(b.x1 - a.pos.x, 2) + pow(b.y1 - a.pos.y, 2) + pow(b.z1 - a.pos.z, 2));
			sB = sqrt(pow(b.x3 - a.pos.x, 2) + pow(b.y3 - a.pos.y, 2) + pow(b.z3 - a.pos.z, 2));
			sC = sqrt(pow(b.x1 - b.x3   , 2) + pow(b.y1 - b.y3   , 2) + pow(b.z1 - b.z3   , 2));
			aB = dynamix::area(sA, sB, sC);

			shadow.rad = ((elts[b.p1].rad * aA) + (elts[b.p1].rad * aB) + (elts[b.p1].rad * aC)) / (aA + aB + aC);
		}

		dynamix::repulsion(shadow, a);
		dynamix::repulsion(a, shadow);

		if(b.p1 == -1) a.frc = a.frc - shadow.frc;
		else
		{			
			elts[b.p1].frc = elts[b.p1].frc + shadow.frc * (aA / (aA + aB + aC));
			elts[b.p2].frc = elts[b.p2].frc + shadow.frc * (aB / (aA + aB + aC));
			elts[b.p3].frc = elts[b.p3].frc + shadow.frc * (aC / (aA + aB + aC));
		}
	}
}

void dynamix::containerbumper(part& a, bumper& b, part* elts)
{	
	double sA = (a.pos - elts[b.p0].pos).mag();
	double sB = (a.pos - elts[b.p1].pos).mag();
	double sC = (elts[b.p1].pos - elts[b.p0].pos).mag();
	
	double aA = acos((pow(sB, 2) + pow(sC, 2) - pow(sA, 2)) / (2 * sB * sC));
	double aB = acos((pow(sA, 2) + pow(sC, 2) - pow(sB, 2)) / (2 * sA * sC));

	if((aB <= 1.57079) && (aA <= 1.57079))
	{
		double aD = 3.14159 - (1.57079 - aA);
		double sD = (sB * sin(aD)) / sin(1.57079);

		part shadow;
		shadow.pos = elts[b.p1].pos * ((sC - sD) / sC) + elts[b.p0].pos * (sD / sC);
		shadow.rad = elts[b.p1].rad * ((sC - sD) / sC) + elts[b.p0].rad * (sD / sC);

		dynamix::repulsion(shadow, a);
		dynamix::repulsion(a, shadow);

		elts[b.p1].frc = elts[b.p1].frc + shadow.frc * ((sC - sD) / sC);
		elts[b.p0].frc = elts[b.p0].frc + shadow.frc * (sD / sC);
	}
}

triset dynamix::interptriset(triset a, triset b, double d)
{
	return(a * (1 - d) + b * d);
}

void dynamix::bumper2bumper(bumper b0, bumper b1, part* elts)
{
	double s0 = .5, s1 = .5, d, de, a, b, c, dPos, dNeg, m = .05;
	double slp0, slp1, r0, r1;
	triset p0, p1;
	int i;

	for(i = 0; i < 10; i++)
	{
		dPos = (interptriset(elts[b0.p0].pos, elts[b0.p1].pos, s0 + .000001) - interptriset(elts[b1.p0].pos, elts[b1.p1].pos, s1)).mag();
		dNeg = (interptriset(elts[b0.p0].pos, elts[b0.p1].pos, s0          ) - interptriset(elts[b1.p0].pos, elts[b1.p1].pos, s1)).mag();
		slp0 = dPos - dNeg;

		dPos = (interptriset(elts[b0.p0].pos, elts[b0.p1].pos, s0) - interptriset(elts[b1.p0].pos, elts[b1.p1].pos, s1 + .000001)).mag();
		dNeg = (interptriset(elts[b0.p0].pos, elts[b0.p1].pos, s0) - interptriset(elts[b1.p0].pos, elts[b1.p1].pos, s1)).mag();
		slp1 = dPos - dNeg;
			
		r0 = slp0 / sqrt(pow(abs(slp0), 2) + pow(abs(slp1), 2));
		r1 = slp1 / sqrt(pow(abs(slp0), 2) + pow(abs(slp1), 2));

		s0 = s0 - r0 * m;
		s1 = s1 - r1 * m;
		m  = m * .5;

		if(s0 < 0) s0 = 0; if(s0 > 1) s0 = 1;
		if(s1 < 0) s1 = 0; if(s1 > 1) s1 = 1;
	}
		
	p0 = interptriset(elts[b0.p0].pos, elts[b0.p1].pos, s0);
	p1 = interptriset(elts[b1.p0].pos, elts[b1.p1].pos, s1);
		
	part shadow0, shadow1;
	shadow0.pos = p0;
	shadow1.pos = p1;

	shadow0.rad = (s0 - 1) * elts[b0.p0].rad + s0 * elts[b0.p1].rad;
	shadow1.rad = (s1 - 1) * elts[b1.p0].rad + s1 * elts[b1.p1].rad;

	dynamix::repulsion(shadow0, shadow1);
	dynamix::repulsion(shadow1, shadow0);
		
	a = (p0 - elts[b0.p0].pos).mag();		
	b = (p0 - elts[b0.p1].pos).mag();		
	c = a + b;

	elts[b0.p0].frc = elts[b0.p0].frc + shadow0.frc * (b / c);
	elts[b0.p1].frc = elts[b0.p1].frc + shadow0.frc * (a / c);
	
	a = (p1 - elts[b1.p0].pos).mag();		
	b = (p1 - elts[b1.p1].pos).mag();		
	c = a + b;

	elts[b1.p0].frc = elts[b1.p0].frc + shadow1.frc * (b / c);
	elts[b1.p1].frc = elts[b1.p1].frc + shadow1.frc * (a / c);
}