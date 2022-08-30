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
vector<long> vecSum;

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

void sumPrimes(int start, int end){
    vector<int> vectorPrimos;
    long long sum = 0;
	for (int i = start; i <= end; i++) {
		if (isPrime(i)){
            sum+= i;
        }
	}
    vecSum.push_back(sum);
}


void primeThread(int start, int end, int numThreads){
    vector<thread> threadVect;
    int threadSpread = end/numThreads;
    int newEnd = start + threadSpread - 1;
    for (int i = 0; i < numThreads; i++){
        threadVect.emplace_back(sumPrimes, start, newEnd);
        start+= threadSpread;
        newEnd+= threadSpread;
    }
    for (auto &t : threadVect){
        t.join();
    }
    
}
int main(){
    auto start = high_resolution_clock::now();
	primeThread(1, 5000000,64);
    auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);
    cout << endl;
    long long sumT = 0;
    for(int i = 0; i < vecSum.size(); i++){
        sumT+= vecSum[i];
    }
    cout << "Sum of primes: " << sumT << endl;
    cout << "Execution time: " << duration.count()/double(CLOCKS_PER_SEC) << " seconds" << endl;
    return 0;
}

