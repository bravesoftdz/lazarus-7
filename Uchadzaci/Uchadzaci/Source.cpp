#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <numeric>
#include <sstream>
#include <math.h>
using namespace std;

void fileIn();
void load();
int combine(int a, int b);
void fileOut();

string original[2];
string solved[3][4];

int linesNumber;

int main() {
	int i;
	//string line;
	
	fileIn();
	load();

	cout << "Solved:\n";
	for (i = 0; i < linesNumber; i++){
		cout << solved[i][0] << " " << solved[i][1] << " " << solved[i][2] << " " << solved[i][3] << " \n";;
	}
	//system("CLS"); clear screen
	fileOut();
	system("pause");

	return 0;
}

void fileIn() {
	string line;
	int i=0;

	ifstream myfileI("Text.txt");
	if (myfileI.is_open())
	{
		cout << "Original: \n";
		while (getline(myfileI, line))
		{
			//cout << line << '\n'; // output file line
			original[i] = line + original[i];
			cout << original[i] << '\n';
			i++;
			linesNumber = i;
			cout << "Number of lines is:" << linesNumber << "\n";
		}
		cout << "________________\n \n";
		myfileI.close();
	}
	else cout << "Unable to open file";
}

void fileOut(){
	int i;
	ofstream myfileO("Text.txt", ios::app);
	if (myfileO.is_open())
	{
		myfileO << "\n Solved:\n";

		for (i = 0; i < linesNumber; i++){
			myfileO << solved[i][0] << " " << solved[i][1] << " " << solved[i][2] << " " << solved[i][3] << " \n";;
		}

		myfileO.close();
	}
	else cout << "Unable to open file";
}

void load(){
	int i, sum, firstPart, secondPart, allPart, controlNumber;
	vector<string> originalVector;
	vector<string> dateSeparated;
	vector<string> scoreString;
	vector<int> score;

	string date;
	string finalDate;
	string token;

	cout << "Calling load: \n";
	for (i = 0; i < linesNumber; i++)
	{
		stringstream ss(original[i]); // Insert the string into a stream

		while (ss >> original[i])
			originalVector.push_back(original[i]); //puts the whole line in

		solved[i][0] = originalVector.at(0); //name
		solved[i][1] = originalVector.at(1); //surname

		//DATE separate by '.'
		dateSeparated.clear();
		stringstream date(originalVector.at(2));
		while (getline(date, token, '.')) {
			cout << token << " ";
			dateSeparated.insert(dateSeparated.begin(), token);
		}
		dateSeparated.at(0) = dateSeparated.at(0).substr(2, 4); //get just last two numbers from date
		cout << "Date separated: ";
		for (vector<string>::const_iterator c = dateSeparated.begin(); c != dateSeparated.end(); ++c){
			cout << *c << ' ';
		}
		cout << "\n";
		
		string dateTogether;
		dateTogether = accumulate(begin(dateSeparated), end(dateSeparated), dateTogether);
		cout << dateTogether;

		firstPart = stoi(dateTogether);
		secondPart = rand() % 900 + 100;

		allPart = combine(firstPart, secondPart);

		controlNumber = allPart / 11;
		while (controlNumber >= 10)
			controlNumber /= 10;

		cout << ". All Parts:" << allPart;
		cout << ". Control number: "<< controlNumber << "\n";

		finalDate = to_string(allPart)+to_string(controlNumber);
		finalDate.insert(6, "/");
		
		solved[i][2] = finalDate;
		
		vector<string> scoreString(originalVector.begin() + 3, originalVector.end());

		score.clear();
		sum = 0;
		for (int i_strToInt = 0; i_strToInt < 5; i_strToInt++)
		{
			int num = atoi(scoreString.at(i_strToInt).c_str());
			score.push_back(num);
			sum += num;
		}

		solved[i][3] = to_string(sum);
		cout << "Sum: " << to_string(sum) << ". ";

		//vector cout just to be sure
		for (vector<int>::const_iterator a = score.begin(); a != score.end(); ++a)
			cout << *a << " ";
		cout << "\n";

		originalVector.clear();
		date.clear();
		score.clear();
	}
	cout << "________________\n \n";	
}

int combine(int a, int b) {
	int times = 1;
	while (times <= b)
		times *= 10;
	return a*times + b;
}