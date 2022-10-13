/*
p = [25, 14, 19, 30, 26, 12, 6, 9, 18, 24]; 	// utilidad
w = [15, 18, 16, 24, 18, 24, 13, 15, 12, 16];	// peso
*/

dvar boolean x[1..10];
int p[1..10] = ...;
int w[1..10] = ...;

maximize 
	sum(i in 1..10)p[i]*x[i];

constraints {
	sum(i in 1..10)w[i]*x[i] <= 70;
}