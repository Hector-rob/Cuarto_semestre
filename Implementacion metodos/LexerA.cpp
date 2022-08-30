//Héctor Robles Villarreal A01634105
//Actividad 3.2 Programando un DFA
//Lunes 14 de marzo de 2022
//Implementación de Métodos Computacionales Grupo 600

#include <iostream>
#include <fstream>
#include <string>
using namespace std;


void lexerAritmetico(string archivo){
    ifstream documento (archivo);
    string linea;
    cout <<"\nToken" <<" Tipo\n" <<endl;
    while ((getline(documento,linea))){
        for (int i = 0; i < linea.length(); i++){
            char token = linea[i];
            if(token == '/' && linea[i+1] == '/'){
                    string comment = "";
                    for(int j = i; j < linea.length();j++){
                        comment+= linea[j];
                    }
            cout << comment <<" Comentario" << endl <<endl;
            break;
            }
            else if(isalpha(token)){
                string variable = "";
                char sig = linea[i+1];
                variable = token;
                for(int j = i; j < linea.length();j++){
                    char siguiente = linea[j+1];
                    if(!isalpha(siguiente) && !isdigit(siguiente) && (siguiente != '_')){
                         cout << variable << " Variable" <<endl <<endl;
                        i = j;                            
                        break;
                    }
                    else{
                        variable+= siguiente;;
                    }
                }
            }
            else if(isdigit(token) || (token == '-' && isdigit(linea[i+1]))){
                string real = "";
                real = token;
                for(int h = i; h < linea.length();h++){
                    char next = linea[h+1];
                    char next2 = linea[h+2];
                    char next3 = linea[h+3];
                    if(isdigit(next) || next == '.' || next =='E' || next =='e'){
                        if(next== 'e' || next == 'E' && next2=='-'){
                            real = real+next+next2+next3;
                            cout << real << " Real" << endl <<endl;
                            i = h+3;
                            break;
                        } 
                        else if(next== 'e' || next == 'E' && isdigit(next2)){
                            real = real+next+next2;
                            cout << real << " Real" << endl <<endl;
                            break;
                        }
                        else{
                            real+=next;
                        } 
                    }
                    else{
                        if(real.length()==1){
                            cout << real << " Entero" << endl <<endl;
                            break;
                        }
                        if(real.length() ==2 && real.at(0) == '-'){
                            cout << real << " Entero" << endl <<endl;
                            i = h;
                            break;
                        }
                        else{
                            cout << real << " Real" << endl <<endl;
                            i = h;
                            break; 
                        }
                        
                    }
                }
            }
            else if(token == '='){
                cout << token << " Asignacion" << endl <<endl;
            }
            else if(token == '*'){
                cout << token << " Multiplicacion" <<endl <<endl;
            }
            else if(token == '/' && linea[i+1]!= '/'){
                cout << token << " Division" <<endl << endl;
            }
            else if (token == '+'){
                cout << token << " Suma" <<endl << endl;
            }
            else if(token == '-' && !isdigit(linea[i+1])){
                cout << token << " Resta" <<endl << endl;
            }
            else if(token =='^'){
                cout << token <<" Potencia" <<endl << endl;
            }
            else if(token =='('){
                cout << token <<" Parentesis que abre" <<endl << endl;
            }
            else if(token == ')'){
                cout << token <<" Parentesis que cierra"  <<endl << endl;
            } 
            else if(token == '.'){
                break;
            }
            else if(token!=' ' ){
               cout <<"Error en esta linea, se ingreso algo que no corresponde "
               << "a los tokens reconocidos" <<endl << endl;
                break;
            }
        }
    }
}

int main(){
    string archivo = "expresiones.txt";
    lexerAritmetico(archivo);
    return 0;
}