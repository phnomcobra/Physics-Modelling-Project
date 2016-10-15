#include <vector>
#include <string>
#include <iostream>
#include <stdio.h>
#include <math.h>
#include "container.h"
#include "triset.h"
#include "part.h"
#include "field.h"
#include "bumper.h"

using namespace std;

FILE* wtstrm;
FILE* rdstrm;

void writeSimplex(field& x)
{
	int i, j;
	wtstrm = fopen("simplex.dat", "w");

	fprintf(wtstrm, "%i\n", x.numElts);
	for(i = 0; i < x.numElts; i++)
	{
		fprintf(wtstrm, "%f %f %f\n", x.elts[i].pos.x, x.elts[i].pos.y, x.elts[i].pos.z);
		fprintf(wtstrm, "%f %f %f\n", x.elts[i].vel.x, x.elts[i].vel.y, x.elts[i].vel.z);
		fprintf(wtstrm, "%f %f %f\n", x.elts[i].acc.x, x.elts[i].acc.y, x.elts[i].acc.z);
		fprintf(wtstrm, "%f %f %f\n", x.elts[i].frc.x, x.elts[i].frc.y, x.elts[i].frc.z);

		fprintf(wtstrm, "%f %f %f\n", x.elts[i].tmp, x.elts[i].tcp, x.elts[i].ter);
		
		fprintf(wtstrm, "%f\n", x.elts[i].mas);
		
		fprintf(wtstrm, "%f\n", x.elts[i].rad);

		fprintf(wtstrm, "%f\n", x.elts[i].attCoef);

		fprintf(wtstrm, "%f\n", x.elts[i].drgCoef);

		fprintf(wtstrm, "%f\n", x.elts[i].fdfCoef);

		fprintf(wtstrm, "%i\n", x.elts[i].isStatic);

		fprintf(wtstrm, "%i\n", x.elts[i].type);

		fprintf(wtstrm, "%i\n", x.elts[i].rbm);
		
		fprintf(wtstrm, "%f %f %f\n", x.elts[i].normal.x, x.elts[i].normal.y, x.elts[i].normal.z);

		fprintf(wtstrm, "%f %f %f\n", x.elts[i].color.x, x.elts[i].color.y, x.elts[i].color.z);
		
		fprintf(wtstrm, "%i\n", x.elts[i].numBinders);
		for(j = 0; j < x.elts[i].numBinders; j++) fprintf(wtstrm, "%i %f %f %f %f\n", x.elts[i].bindings[j], x.elts[i].bdist[j], x.elts[i].spring[j], x.elts[i].damper[j], x.elts[i].stretch[j]);
	}
	
	fprintf(wtstrm, "%i\n", x.numCont);
	for(i = 0; i < x.numCont; i++) fprintf(wtstrm, "%i %i %i %f %f %f %f %f %f %f %f %f\n", x.cont[i].p1, x.cont[i].p2, x.cont[i].p3, x.cont[i].x1, x.cont[i].x2, x.cont[i].x3, x.cont[i].y1, x.cont[i].y2, x.cont[i].y3, x.cont[i].z1, x.cont[i].z2, x.cont[i].z3);

	fprintf(wtstrm, "%i\n", x.numBumpers);
	for(i = 0; i < x.numBumpers; i++) fprintf(wtstrm, "%i %i\n", x.bumpers[i].p0, x.bumpers[i].p1);

	fclose(wtstrm);
}

void readSimplex(field& x, string filename)
{
	int i, j, k;
	int numNodes;
	int numBindings;
	int newBinder;
	int newBdist;
	int numCont;
	int numBumpers;
	double newSpring;
	double newDamper;
	double newStretch;
	float a, b, c, d, e, f, g, h, m;
	char buffer[128];
	part newPart;
	container newCont;
	bumper newBumper;
	rdstrm = fopen(filename.c_str(), "r");
	
	fscanf(rdstrm, "%i", &numNodes);
	x.resizeElts(numNodes);
	for(i = 0; i < numNodes; i++)
	{
		fscanf(rdstrm, "%f %f %f", &a, &b, &c); newPart.pos.x = a; newPart.pos.y = b; newPart.pos.z = c;
		fscanf(rdstrm, "%f %f %f", &a, &b, &c); newPart.vel.x = a; newPart.vel.y = b; newPart.vel.z = c;
		fscanf(rdstrm, "%f %f %f", &a, &b, &c); newPart.acc.x = a; newPart.acc.y = b; newPart.acc.z = c;
		fscanf(rdstrm, "%f %f %f", &a, &b, &c); newPart.frc.x = a; newPart.frc.y = b; newPart.frc.z = c;
		
		fscanf(rdstrm, "%f %f %f", &a, &b, &c); newPart.tmp = a; newPart.tcp = b; newPart.ter = c;
		
		fscanf(rdstrm, "%f", &a); newPart.mas = a;
		
		fscanf(rdstrm, "%f", &a); newPart.rad = a;

		fscanf(rdstrm, "%f", &a); newPart.attCoef = a;

		fscanf(rdstrm, "%f", &a); newPart.drgCoef = a;

		fscanf(rdstrm, "%f", &a); newPart.fdfCoef = a;

		fscanf(rdstrm, "%i", &newPart.isStatic);

		fscanf(rdstrm, "%i", &newPart.type);

		fscanf(rdstrm, "%i", &newPart.rbm);

		fscanf(rdstrm, "%f %f %f", &a, &b, &c); newPart.normal.x = a; newPart.normal.y = b; newPart.normal.z = c;
		
		fscanf(rdstrm, "%f %f %f", &a, &b, &c); newPart.color.x = a; newPart.color.y = b; newPart.color.z = c;
		
		x.elts[i] = newPart;	

		fscanf(rdstrm, "%i", &numBindings);
		x.elts[i].resizeBinders(numBindings);
		for(j = 0; j < numBindings; j++)
		{
			fscanf(rdstrm, "%i %f %f %f %f", &newBinder, &a, &b, &c, &d); 
			
			newBdist   = a;
			newSpring  = b;
			newDamper  = c;
			newStretch = d;
		
			x.elts[i].bindings[j] = newBinder;
			x.elts[i].bdist[j]    = newBdist;
			x.elts[i].spring[j]   = newSpring;
			x.elts[i].damper[j]   = newDamper;
			x.elts[i].stretch[j]  = newStretch;
		}
	}
	
	fscanf(rdstrm, "%i", &numCont);
	x.resizeCont(numCont);
	for(i = 0; i < numCont; i++)
	{
		fscanf(rdstrm, "%i %i %i %f %f %f %f %f %f %f %f %f\n", &newCont.p1, &newCont.p2, &newCont.p3, &a, &b, &c, &d, &e, &f, &g, &h, &m);
			newCont.x1 = a; newCont.x2 = b; newCont.x3 = c;
			newCont.y1 = d; newCont.y2 = e; newCont.y3 = f;
			newCont.z1 = g; newCont.z2 = h; newCont.z3 = m;
		x.cont[i] = newCont;
	}

	
	fscanf(rdstrm, "%i", &numBumpers);
	x.resizeBumpers(numBumpers);
	for(i = 0; i < numBumpers; i++)
	{
		fscanf(rdstrm, "%i %i", &newBumper.p0, &newBumper.p1);
		x.bumpers[i] = newBumper;
	}

	fclose(rdstrm);
}

void main(int argc, char *argv[])
{
	field x;
	int i, numint;
	double tstep, d;
	double iR = 1;

	cout << "fisx:" << endl;

	cout << "   read simplex" << endl;
	readSimplex(x, argv[1]);
	
	for(i = 0; i < 1; i++)
	{	
		d = 0;
		numint = 0;
		
		do
		{
			x.interact();

			tstep = x.gettstep();
			if((iR - d) < tstep)
				tstep = iR - d;

			x.enumerate(tstep);

			d = d + tstep;
			
			numint = numint + 1;
			cout << "   pass" << numint << endl;
		} while(d < iR);
	}

	cout << "   write simplex" << endl;
	writeSimplex(x);
}