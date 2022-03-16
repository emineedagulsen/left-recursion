%{
	#include <stdio.h>
	#include <iostream>
	#include <string>
	using namespace std;
	#include "y.tab.h"
	#include <map>
	#include <vector>
	extern FILE *yyin;
	extern int yylex();
	void yyerror(string s);
	extern int linenum;
	map<string,string> strMap;
	map<string,string> strMap6;
	map<int,int> strMap2;
	map<string,int> strMap3;
	map<string,int> strMap4;
	map<string,int> strMap5;
	FILE *out;
	string allStr = "";
	string temp = "";
	bool error=false;
	bool check=true;
	int i=1;
	int j;
	
%}
%union
{
	
	char *str;
}
%token <str>   NONTERMINAL TERMINAL SPACE  SEMICOLON EPSILON RULEOPERATOR ERRORNONO ERRORNONC
%type <str> type  decl decl1  lhs  type1 terminal decl2 type2 decl3

%%
statements:
	decl
	|
	decl1
	|
	decl2
	|
	decl3
	|
	decl statements
	|
	decl1 statements
	|
	decl2 statements 	
	|
	decl3 statements 
	;
decl3:	  
		lhs RULEOPERATOR type SEMICOLON			
		{
		
			int i=1;
			string x,y,a,b,c,d,e;
			map<string, string>::iterator it =strMap.begin();
			map<string, string>::iterator it6 =strMap6.begin();
			map<string, int>::iterator it4 =strMap4.begin();
		
			x=$1[1];
			for(i=1;i<=linenum;i+=2){
				if(linenum==i){
					if($1[1]==$3[1]){
							while (it4 != strMap4.end())//left nonterminal kısmı <E>->
							{
									e=it4->first;
									it4++;
									
							}
							
							while(it!=strMap.end())
							{
								
								b=it->first;
								a= it->second;	
								it = strMap.end();
								it--;
								strMap.erase(it);
								
								allStr +=string($1) + " -> " + a+" "+"<"+x +"2>"+"\n";
								$$ = strdup(allStr.c_str());
								allStr += "<"+x +"2>"+ " -> " +"epsilon"+"\n";
								$$ = strdup(allStr.c_str());
								allStr += "<"+x +"2>"+ " -> " +b+" "+a+" "+"<"+x +"2>"+"\n";
								$$ = strdup(allStr.c_str());
								it++;
							}	
							while(it6!=strMap6.end())
							{
								c= it6->second;	
								allStr += "<"+x +"2>"+ " -> " +"epsilon"+"\n";
								$$ = strdup(allStr.c_str());
								allStr += "<"+x +"2>"+ " -> " +c+" "+"<"+x +"2>"+"\n";
								$$ = strdup(allStr.c_str());
								it6++;
							}		
								
					}	
				}
			}
		
		}
		;
decl:	  
		lhs RULEOPERATOR type2 SEMICOLON			
		{
		
			int i=1;
			string x,y,a,b,c,d,e;
			map<string, string>::iterator it =strMap.begin();
			map<string, string>::iterator it6 =strMap6.begin();
			map<string, int>::iterator it4 =strMap4.begin();
			map<string, int>::iterator it5 =strMap5.begin();
			x=$1[1];
			for(i=1;i<=linenum;i+=2){
				if(linenum==i){
					if($1[1]==$3[1]){
							while (it4 != strMap4.end())//left nonterminal kısmı <E>->
							{
									e=it4->first;
									it4++;
									
							}
							
							while(it!=strMap.end())
							{
								
								b=it->first;
								a= it->second;	
								it = strMap.end();
								it--;
								strMap.erase(it);
								
								
								allStr += "<"+x +"2>"+ " -> " +"epsilon"+"\n";
								$$ = strdup(allStr.c_str());
								allStr += "<"+x +"2>"+ " -> " +b+" "+a+" "+"<"+x +"2>"+"\n";
								$$ = strdup(allStr.c_str());
								it++;
							}	
							while(it6!=strMap6.end())
							{
								c= it6->second;	
								allStr += "<"+x +"2>"+ " -> " +"epsilon"+"\n";
								$$ = strdup(allStr.c_str());
								allStr += "<"+x +"2>"+ " -> " +c+" "+"<"+x +"2>"+"\n";
								$$ = strdup(allStr.c_str());
								it6++;
							}		
								
					}	
				}
				if((linenum==i+1)||(linenum==i+2)){
						while(it5 != strMap5.end())
							{
								e=it5->first;
								it5++;
								
							}
							temp += "<"+x +"2>"+ " -> " +e+" "+"<"+x+"2>"+"\n";
							$$ = strdup(temp.c_str());
						
				
				}
			}
		}
		;
decl1:
	
	lhs RULEOPERATOR type1 SEMICOLON			
		{
		
			int i=1;
			string x,y,a,b,c,d,e;
			map<string, string>::iterator it =strMap.begin();
			map<string, string>::iterator it6 =strMap6.begin();
			map<string, int>::iterator it4 =strMap4.begin();
			map<string, int>::iterator it5 =strMap5.begin();
			x=$1[1];
			
			for(i=1;i<=linenum;i+=3){
				if(linenum!=i){
					
							while(it5 != strMap5.end())//left nonterminal kısmı <E>->
							{
								e=it5->first;
								it5++;
								
							}
							temp += "<"+x +"2>"+ " -> " +e+" "+"<"+x+"2>"+"\n";
							$$ = strdup(temp.c_str());
							
						
				}
				else{
						while(it!=strMap.end())
							{
								
								b=it->first;
								a= it->second;	
								it = strMap.end();
								it--;
								strMap.erase(it);
								it++;
							}	
							while(it6!=strMap6.end())
							{
								c= it6->second;	
								it6++;
								
							}	
							
							allStr += "<"+x +"2>"+ " -> " +"epsilon"+"\n";
							$$ = strdup(allStr.c_str());
							allStr += "<"+x +"2>"+ " -> " +c+" "+"<"+x +"2>"+"\n";
							$$ = strdup(allStr.c_str());
				}	
				
					
			}
		
		}
		;
decl2:
		lhs RULEOPERATOR terminal SEMICOLON
		{
			
				
				allStr += string($1)+ " -> " +string($3)+"\n";
				$$ = strdup(allStr.c_str());
			
			
		}
		
		
		
	;
	

lhs:
	
		NONTERMINAL {
			string x = string($1)+" ";
			$$= strdup(x.c_str());
			strMap3.insert(pair<string,int>(string($1),0));
			
		}
		|
		ERRORNONO
		{
			error=true;
			cout<<"missing < symbol in line "<<linenum<<endl;
		}
		|
		ERRORNONC
		{
			error=true;
			cout<<"missing > symbol in line "<<linenum<<endl;
		}
		;

type:
		
		
		ERRORNONO
		{
			error=true;
			cout<<"missing < symbol in line "<<linenum<<endl;
		}
		|
		ERRORNONC
		{
			error=true;
			cout<<"missing > symbol in line "<<linenum<<endl;
		}
		|
		NONTERMINAL {

			string x = string($1)+" ";
			$$= strdup(x.c_str());
			
		}
		|
		NONTERMINAL TERMINAL NONTERMINAL{
			string combined = string($1)+" "+string($2)+" "+string($3);
			$$= strdup(combined.c_str());
			strMap.insert(pair<string,string>(string($2),string($3)));
			strMap4.insert(pair<string,int>(string($1),1));
		}
		;
type2:		
		ERRORNONO
		{
			error=true;
			cout<<"missing < symbol in line "<<linenum<<endl;
		}
		|
		ERRORNONC
		{
			error=true;
			cout<<"missing > symbol in line "<<linenum<<endl;
		}
		|
		TERMINAL {

			string x = string($1)+" ";
			$$= strdup(x.c_str());
			strMap5.insert(pair<string,int>(string($1),0));
		}
		|
		NONTERMINAL TERMINAL NONTERMINAL{
			string combined = string($1)+" "+string($2)+" "+string($3);
			$$= strdup(combined.c_str());
			strMap.insert(pair<string,string>(string($2),string($3)));
			strMap4.insert(pair<string,int>(string($1),1));
		}
		;
type1:
		ERRORNONO
		{
			error=true;
			cout<<"missing < symbol in line "<<linenum<<endl;
		}
		|
		ERRORNONC
		{
			error=true;
			cout<<"missing > symbol in line "<<linenum<<endl;
		}
		|
		TERMINAL {

			string x = string($1)+" ";
			$$= strdup(x.c_str());
			strMap5.insert(pair<string,int>(string($1),1));
		}
		|
		NONTERMINAL type1
		{
			string combined = string($1)+" "+string($2);
			$$= strdup(combined.c_str());
			strMap6.insert(pair<string,string>(string($1),string($2)));
		}
		;
terminal:
		TERMINAL {
			string x = string($1)+" ";
			$$= strdup(x.c_str());
			strMap2.insert(pair<int,int>(0,0));
		}
		|
		TERMINAL terminal
		{
			string combined = string($1)+" "+string($2);
			$$= strdup(combined.c_str());
			strMap2.insert(pair<int,int>(0,1));
		}
		;	


%%
void yyerror(string s){
	//cerr<<"Error at line: "<<linenum<<endl;
	
}

int yywrap(){
	return 1;
}
int main(int argc, char *argv[])
{
    yyin=fopen(argv[1],"r");
    yyparse();
    fclose(yyin);
	if(error==false){
		cout<<temp;
		cout<<allStr<<endl;
	}
	
    return 0;
}














