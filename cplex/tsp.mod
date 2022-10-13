/*
//n = 2; //Numero de variables
c = [[1000, 10, 10, 12, 25, 23],
	 [10, 1000, 12, 16, 21, 26],
	 [10, 12, 1000, 13, 18, 16],
	 [12, 16, 13, 1000, 30, 28],
	 [25, 21, 18, 30, 1000, 27],
	 [23, 26, 16, 28, 27, 1000]];
*/

dvar boolean x[1..6][1..6];
int c[1..6][1..6] = ...;
minimize sum(i in 1..6, j in 1..6) c[i][j]*x[i][j];
constraints{
	forall(i in 1..6) x[i][i] == 0;
	forall(j in 1..6) 
		sum(i in 1..6) x[i][j] == 1;
	forall(i in 1..6)
	  	sum(j in 1..6) x[i][j] == 1;
}