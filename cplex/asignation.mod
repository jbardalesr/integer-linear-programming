/*
c = [[2, 1, 3, 4, 2],
	 [5, 3, 4, 6, 7],
	 [8, 4, 3, 6, 2],
	 [10, 8, 7, 4, 9],
	 [5, 10, 8, 6, 12]];
*/

dvar boolean x[1..5][1..5];
int c[1..5][1..5] = ...;
minimize sum(i in 1..5, j in 1..5) c[i][j]*x[i][j];
constraints{
	forall(i in 1..5)
	  	sum(j in 1..5) x[i][j] == 1;
	forall(j in 1..5)
	  	sum(i in 1..5) x[i][j] == 1;
}
