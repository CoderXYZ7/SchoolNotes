#include <iostream>
#include <fstream>
#include <math.h>
#include <string>
#include <map>
#include <vector>

using namespace std;

typedef struct{
	int index;
	string FOSchosen;
	int correct;
}endTurn;

//nomi "costanti" dei file da modificare
const string FOS = "//pl//list.txt"; 	//figure of speech
const string TURN = "output.txt";	//current turn
const string PLAYERS = "//gm//stats.txt";
ifstream PATH ("path.txt");

//prototipi
double sigmoid(double);							//funzioni matematiche
double invertedSigmoid(double);

void loadTurn(ifstream& file, endTurn& turn);	//caricamento e riscrittura del file
void loadMap(ifstream&, map<string, double>&);
void loadMap(ifstream&, map<int, vector<int>>&);	
void stampMap(ofstream&, map<string, double>&);
void stampMap(ofstream&, map<int, vector<int>>&);
double getValue(string, char); 
string getString(string, char);
int findChar(string, char);
int getID(string);
int isCorrect(string);
void newTurn(string);

string getpath(ifstream&);

//main
int main(){
	newTurn(getpath(PATH));
	
	
	
}


//defining functions
double sigmoid(double x){
	return 10.0/(1.0 + pow(1.6, -x)) +10.0;
}

double invertedSigmoid(double x){
	return -log((20.0-x)/(x-10.0))/log(1.6);
}

int findChar(string str, char c){
	int i=0;
	while(str[i]!=c && i<str.length()) i++;
	return i;
}

double getValue(string str, char c){
	double value=0;
	int powOfTen = 1;
	for(int i=findChar(str, ';')+1; i<str.length(); i++){
		if(str[i]!='.'){
			value += (str[i]-48)*pow(10, powOfTen);
			powOfTen--;
		}
	}
	return value;
}

int getID(string str){
	int res = (str[0]-48)*10 + str[1]-48;
	return res;
}

int isCorrect(string s){
	if(s[s.length()-2]=='-') return -1;
	else return 1;
}

string getString(string str, char c){
	int ID = findChar(str, c);
	string result = "";
	for(int i=0; i<ID; i++){
		result+= str[i];
	} 
	return result;
}

void loadMap(ifstream& file, map<string, double>& Map){
	string s;
	while(getline(file, s)){
		double f = getValue(s, ';');
		Map[getString(s, ';')] = f;		
	}

}

void loadMap(ifstream& file, map<int, vector<int>>& Map){
	string s;
	int id;
	int sign=1;
	int i=0;
	while(getline(file, s)){
		i=0;
		id = (s[0]-48)*10 + s[1]-48;
		s = s.substr(3);
				
		while(s.length()>2){
			if(s[0]=='-'){
				sign = -1;
				s = s.substr(1);
			} 
			else sign = 1;
			
			
			Map[id].push_back((s[0]-48)*10 + s[1]-48);
			Map[id][i]*=sign;
			s = s.substr(3);			
			i++;					
		}
		
				
	}

}

void loadTurn(ifstream& file, endTurn& turn){
	string s;
	getline(file, s);
	
	turn.index = getID(s.substr(0, 2));
	turn.FOSchosen = getString(s.substr(3), ';');
	turn.correct = isCorrect(s);
}

void stampMap(ofstream& file, map<string, double>& Map){
	for(pair<string, double> x: Map){
		file<<x.first<<";"<<x.second<<endl;
	}

}

void stampMap(ofstream& file, map<int, vector<int>>& Map){
	for(pair<int, vector<int>>  x: Map){
		if(x.first<10)file<<"0";
		file<<x.first<<"|";
		for(int j: x.second)
			file<<j<<";";
		file<<endl;
	}
	
}

void newTurn(string path){
	ifstream cTurn (TURN);
	endTurn Turn;
	loadTurn(cTurn, Turn);
	cTurn.close();
		
	ifstream figOfSpeech (path + FOS);
	map<string, double> List;
	loadMap(figOfSpeech, List);
	figOfSpeech.close();
	
	ifstream statistics(path + PLAYERS);
	map<int, vector<int>> People;
	loadMap(statistics, People);
	statistics.close();
	
	People[Turn.index].push_back(Turn.correct * (int)List[Turn.FOSchosen]);
	List[Turn.FOSchosen] = sigmoid(invertedSigmoid(abs(List[Turn.FOSchosen]))-Turn.correct);
		
	
	ofstream figOfSpeechO (path + FOS);
	stampMap(figOfSpeechO, List);
	
	ofstream PeopleO (path + PLAYERS);
	stampMap(PeopleO, People);
}

string getpath(ifstream& file){
	string s;
	getline(file, s);
	return s;
}
