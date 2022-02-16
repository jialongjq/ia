#include <iostream>
#include <fstream>
#include <string>
#include <stdlib.h>
#include <time.h>
using namespace std;

bool valid(int argc, char* argv[]) {
    if (argc != 4) return false;
    string s1 = argv[1];
    for (int i = 0; i < s1.size(); ++i) if (not isdigit(argv[1][i])) return false;
    string s2 = argv[2];
    for (int i = 0; i < s2.size(); ++i) if (not isdigit(argv[2][i])) return false;
    return true;
}

int main(int argc, char* argv[]) {
    if (not valid(argc, argv)) {
        cout << "USAGE: " << argv[0] << " [numero de habitaciones] [numero de reservas] [nombre del archivo .pddl]" << endl;
        return 0;
    }
    string problema = "";
    problema +=
        "(define (problem ext4)\n"
        "\t(:domain hotel)\n"
        "\t(:objects\n\t\t";
    for (int i = 1; i <= stoi(argv[1]); ++i) {
        problema += "h" + to_string(i) + " ";
    }
    problema +=
        "- habitacion\n\t\t";
    for (int i = 1; i <= stoi(argv[2]); ++i) {
        problema += "r" + to_string(i) + " ";
    }
    problema +=
        "- reserva\n"
        "\t)\n"
        "\t(:init\n";
    for (int i = 1; i <= stoi(argv[1]); ++i) {
        problema +=
            "\t\t(= (capacidad h" + to_string(i) + ") " + to_string(rand() % 4 + 1) + ")\n"
            "\t\t(= (dia-libre h" + to_string(i) + ") " + to_string(1) + ")\n\n";
    }
    for (int i = 1; i <= stoi(argv[2]); ++i) {
        int dia_inicio = rand() % 30 + 1;
        
        int dia_final = dia_inicio;
        if (dia_inicio != 30) dia_final += rand() % (30 - dia_inicio);
        problema +=
            "\t\t(= (personas r" + to_string(i) + ") " + to_string(rand() % 4 + 1) + ")\n"
            "\t\t(= (dia-inicio r" + to_string(i) + ") " + to_string(dia_inicio) + ")\n"
            "\t\t(= (dia-final r" + to_string(i) + ") " + to_string(dia_final) + ")\n\n";
    }
    problema += 
        "\t\t(= (reservas-descartadas) 0)\n"
        "\t\t(= (plazas-desperdiciadas) 0)\n"
        "\t\t(= (habitaciones-diferentes) 0)\n"
        "\t)\n"
        "\t(:goal (forall (?reserva - reserva) (servida ?reserva)))\n"
        "\t(:metric minimize (+ (+ (* 100 (reservas-descartadas)) (* 10 (habitaciones-diferentes))) (plazas-desperdiciadas)))\n"
        ")\n";
    ofstream file;
    file.open (string(argv[3]) + ".pddl");
    file << problema;
    file.close();
}