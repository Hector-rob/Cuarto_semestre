//Héctor Robles Villarreal A01634105
//Actividad 5.2 Programación paralela y concurrente
//Lunes 23 de mayo de 2022
//Implementación de Métodos Computacionales Grupo 600

#include <iostream>
#include <cstdlib>
#include <ctime>
#include <chrono>
#include <cmath>
#include <thread>
#include <vector>

using namespace std;
using namespace std::chrono;

bool isPrime(int n)
{
	if (n < 2)
		return false;

	for (int i = 2; i <= sqrt(n); i++){
		if (n % i == 0){
			return false;
        }
    }
    return true; 
}

void sumPrimes(int n){
    long long sum = 0;
	for (int i = 2; i <= n; i++) {
		if (isPrime(i)){
            sum += i;
        }
	}
    cout << "Suma: " << sum;
}

int main(){
    auto start = high_resolution_clock::now();
	sumPrimes(5000000);
    auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);
    cout << endl;
    cout << "Tiempo de ejecución: " << duration.count()/double(CLOCKS_PER_SEC) << " segundos" << endl;
}
