#include <iostream>
#include "../util.h"
using namespace std;

struct Habilidade {
	int id;
	string nome;
	string descricao;
	int circulo;
	int dado;
};

Habilidade getHabilidade(int id);
int calculaDano(int id, int nivelPersonagem);