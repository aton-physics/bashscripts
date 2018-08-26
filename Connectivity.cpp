#include <iostream>
#include <fstream>
#include <cmath>
#include <numeric>
#include <vector>
#include <array>
#include <algorithm> //for transform
#include <functional> //for plus
#include <algorithm>
#include <iostream>
#include <string>
#include "headers/Point.h" // Point class, some storage structs


std::vector<Point> GetConfiguration(int NumberOfLines) {
	std::vector<Point> Pointvector;
	double a, b, c, d;
	for (int i = 0; i < NumberOfLines; i++) {
		std::cin >> a >> b >> c >> d;
		Point temp_point(c, d);
		Pointvector.push_back(temp_point);
	}
	return Pointvector;
}

int main() {
	//Center on each point and calculate pair separations
	//If pair separation is close enough, print the focal particle and its neighbors
	//plot using gnuplot 'every' functionality
	//overlay this plot (plotted with lines) on top of a palette-type configuration
	//try different values of rnn. Obvious value is just over 2sin(37.5), just under 2sin(37.5), 1.1.
	double rnn = 1.218;
	int NumberOfLines = 600;
	std::vector<Point> Positions = GetConfiguration(NumberOfLines);
	std::ofstream ofs("NeighborNodes.data");
	for (int j = 0; j < NumberOfLines; j++) {
		int NeighborCount = 0;
		for (int k = 0; k < NumberOfLines; k++) {
			//With atom j as a focal point, compute atom-atom pair separations.
			if (j != k) {
				double distance = Positions[j].dist(Positions[k]);
				if (distance < rnn) {	// iff they are neighbors, plot the points. 
					Positions[j].print(ofs);
					Positions[k].print(ofs);
					ofs << "\n\n";
				}
			}
		}
	}
}

