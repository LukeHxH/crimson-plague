#ifndef INVENTARIO_H
#define INVENTARIO_H
#include<iostream>
#include "item.h"
#include "../util.h"

using namespace std;

struct Equipados{
    Item arma;
    Item armadura;
    Item botas;
    Item capacete;
    Item escudo;
};

struct Inventario{
    int tamInvent;
    Item* tdsItens;
    Item* mochila;
    Classe classe;
    int* quantidade;
    Equipados equipados;
    int dinheiro;

};

int qtdItens(Inventario inv);

void imprimeMochila(Inventario inventario);

/**
 * @retorna um item especifico do inventario pelo id
 */
Item getItemPeloId(int id, Inventario inventario);

/**
 * Imprime o conteudo do inventário
 */
void imprimeInventario(Inventario inventario);

/**
*@return o numero de espacos vazios no inventario
*/
int qtdVazios(Inventario inventario);

/**
 * inicia o inventario com os itens basicos
 */
void iniciarItensBasicos(Inventario &inventario);

/**
 *@return o dano total dos itens equipados
 */

int getDanoItens(Inventario inv);

/**
 * @return a armadura total equipada
 */
int getArmadura(Inventario inv);

/**
 * Vende um item especifico pelo numero listado no inventario
 */
void venderItem(int numero,Inventario &inv);

/**
 * Adiciona um item ao inventario pelo id
 */
void adicionarItem(int numero,Inventario &inv);

/**
 * Equipa um item do inventario pelo numero da listagem do inventario
 */
void equiparItem(int numero,Inventario &inv);


/**
 * @return se contem ou não um item especifico no inventario pelo id 
 */
bool contemItem(int id, Inventario inv);
/**
 * @return o total de inteligencia dos itens equipados
 */
int getInteligencia(Inventario inv);

/**
 * @return o total de Força dos itens equipados
 */
int getForca(Inventario inv);

/**
 * @return o total de Destreza dos itens equipados
 */
int getDestreza(Inventario inv);
#endif
