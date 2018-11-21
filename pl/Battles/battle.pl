
/* 
 * startBattle/1:
 *      O único atributo que precisa ser passado é o ID do monstro que será chamado, para
 *      saber qual o ID do monstro com o qual o personagem batalhará, basta consultar os 
 *      fatos em monsters.pl
 * */

:- module(battle, [startBattle/1]).

:- use_module("util").
:- use_module("Monsters/monsters").
:- use_module("Sheet/sheet").

startBattle(IdMonster) :-
    util:cls,
    monsters:isMonster(IdMonster) ->
        monsters:build_monster(IdMonster, Monster),
        write("Um desafio se aproxima, um "),
        monsters:getName(Monster, MonsterName),
        atom_concat(MonsterName, " te ataca...", ChallengeInfo),
        writeln(ChallengeInfo),
        writeln(Monster),
        loopBattle(Monster).

loopBattle(Monster) :-
    monsters:getHp(Monster, MonsterHP),
    monsters:getName(Monster, MonsterName),
    atom_concat("HP ", MonsterName, MonsterNameInfo),
    atom_concat(": ", MonsterHP, MonsterHPInfo),
    atom_concat(MonsterNameInfo, MonsterHPInfo, MonsterInfo),
    sheet:getHP(CharHP),
    atom_concat("Seu HP: ", CharHP, CharHPInfo),
    writeln(MonsterInfo),
    writeln(CharHPInfo),
    menu(Monster).

menu(Monster) :-
    writeln("O que deseja fazer?"),
    writeln("1) Atacar/Lançar magia"),
    writeln("2) Abrir mochila"),
    writeln("3) Fugir"),
    util:readString(Option),
    evaluateOptionMenu(Option, Monster).

evaluateOptionMenu(O, Monster) :-
    util:cls,
    O = "1" -> evaluateCharAttackOption(Monster);
    O = "2" -> openBag(Monster);
    O = "3" -> tryEscape(Monster);
    (writeln("Opção inválida!"), menu(Monster)).

evaluateCharAttackOption(Monster) :-
    sheet:getClass(Class),
    Class == "mago" -> 
        magicalAttack(Monster);
        phisicalAttack(Monster).

magicalAttack(Monster) :-
    sheet:getLevel(Level),
    spells:getUsableSpells(Level, IDs),
    menuSpells(IDs, Monster).

menuSpells(IDs, Monster) :-
    writeln("HABILIDADES: "),
    sheet:getMP(Mana),
    atom_concat("Mana disponível: ", Mana, ManaInfo),
    writeln(ManaInfo),
    printSpells(IDs, 1),
    writeln("Informe o número da magia que você quer lançar: "),
    util:readInt(Option),
    evaluateSpellOption(Option, IDs, Monster).

evaluateSpellOption(Option, IDs, Monster) :-
    length(IDs, ListSize),
    (Option > ListSize) -> 
        (
            util:cls,
            writeln("Opção inválida..."),
            menuSpells(IDs, Monster)
        ); (util:cls, executeMagicalAttack(Monster, Option)).

printSpells([], _).
printSpells([Head|Tail], Pos) :-
    atom_concat(Pos, "- ", ConcatPos),
    write(ConcatPos),
    spells:printSpellLabel(Head),
    AuxPos is Pos + 1,
    printSpells(Tail, AuxPos).

executeMagicalAttack(Monster, ID) :-
    sheet:useSpell(ID, CharDamage) ->
        (
            sheet:recoverMP(5),
            writeln("Você se prepara para realizar um ataque mágico..."),
            util:rollDice(20, RollResult),
            RollResult >= 8 -> successfullAttack(CharDamage, Monster);
            (writeln("E falha miseravelmente... O monstro ri de você!"), monsterAttack(Monster))
        ); 
        (
            sheet:recoverMP(5),
            writeln("Sem mana..."),
            monsterAttack(Monster)
    ).

phisicalAttack(Monster) :-
    sheet:calculateDamage(CharDamage),
    monsters:getCa(Monster, CaMonster),
    writeln("Você se prepara para realizar um ataque corpo a corpo..."),
    util:rollDice(20, RollResult),
    AuxDmg is RollResult + CharDamage,
    AuxDmg >= CaMonster -> successfullAttack(CharDamage, Monster);
    (writeln("E falha miseravelmente... O monstro ri de você!"), monsterAttack(Monster)).

successfullAttack(CharDamage, Monster) :-
    write("Você infligiu um total de "),
    atom_concat(CharDamage, " danos no monstro...", Concat),
    writeln(Concat),
    monsters:takeDmgMonster(Monster, CharDamage, NewMonster),
    monsters:getHp(NewMonster, NewMonsterHp),
    writeln(NewMonster),
    (NewMonsterHp =< 0 -> venceu(Monster); monsterAttack(NewMonster)).

monsterAttack(Monster) :-
    util:rollDice(20, RollResult),
    sheet:calculateDefense(CharDef),
    monsters:getAtk(Monster, Atk),
    MonsterDMG is Atk + RollResult,
    writeln("O monstro se prepara para um ataque..."),
    MonsterDMG >= CharDef ->
        (
            write("E inflige um total de "),
            atom_concat(MonsterDMG, " danos em você...", Concat),
            writeln(Concat),
            sheet:takeDamage(MonsterDMG),
            sheet:getHP(C2),
            (C2 =< 0 -> perdeu; loopBattle(Monster))
        );
    (writeln("E falha miseravelmente..."), loopBattle(Monster)).

openBag(Monster) :-
    inventory:printInventory,
    evaluateBagOption(Monster).

evaluateBagOption(Monster) :-
    writeln("Selecione um item da mochila: "),
    util:readInt(Option),
    (Option > 0, Option =< 5) -> 
    (
        sheet:useItem(Option),
        monsterAttack(Monster)
    );
    (
        writeln("Opcão inválida!"),
        evaluateBagOption(Monster)         
    ).

tryEscape(Monster) :-
    writeln("Você tenta fugir e..."),
    util:rollDice(20, RollResult),
    RollResult >= 10 -> 
        writeln("Escapou com sucesso...");
    (writeln("Não conseguiu... O monstro ri de você"), monsterAttack(Monster)).

venceu(Monster) :-
    util:cls,
    writeln("Parabéns, você venceu!"),
    monsters:getDrop(Monster, Drop),
    itens:getDescription(Drop, Desc),
    itens:getName(Drop, Name),
    write("O monstro deixou cair uma "),
    writeln(Name),
    writeln("Informações do drop: "),
    writeln(Desc),
    inventory:add(Drop),
    monsters:getXp(Monster, Xp),
    write("Você ganhou "),
    atom_concat(Xp, " pontos de experiência.", XpInfo),
    writeln(XpInfo),
    sheet:increaseXP(Xp).

perdeu :-
    writeln("Que pena, você perdeu!").
