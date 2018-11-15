% Estrutura do item: id nome descricao

item(1,"Pocao de cura pequena","Recupera 8 de HP").
item(2,"Pocao de cura média","Recupera 16 de HP").
item(3,"Pocao de MP pequena","Recupera 8 de MP").
item(4,"Pocao de MP média","Recupera 16 de MP").
item(7,"Carne seca contaminada","Recupera 2 de HP e 2 de MP").
item(10,"Manto de resistência","Um fino manto feito de pequenos cristais e muito resistente").
item(11,"Escudo de Metal Grande","Um escudo feito de metal e é empunhado com uma mão").
item(17,"Espada Longa +1","Espada feita de metal, concede um bônus de +1 de Força").
item(21,"Livro de feitiços","Apenas magos habilidosos podem extrair todo o potencial desse item").
item(25,"Bota simples","Bota feita de couro").
item(27,"Arm. de Ferro","Armadura simples de ferro fundido").
item(30,"Espada Curta +1","Espada curta usada em ataques de curta distância com bônus +1 de Força").
item(32,"Adaga +1","Arma branca para ataques furtivos e ágeis, com bônus de +1 de Destreza").
item(34,"Vazio","representa o espaco vazio no inventario").
item(35,"Espada simples","Espada inicial").
item(36,"Armadura de Latão","Armadura para aventureiros iniciantes").
item(37,"Cajado simples","cajado para magos inexperientes").
item(39,"Manto simples","Manto de magos aprendizes").
item(40,"Capacete de Latão","Capacete simples de jovens aventureiros").
item(41,"Chapéu inicial","Vestimentas simples para cosplayers de magos").
item(45,"Sobretudo de Couro","Dizem que você ganha mais agilidade com ele,mesmo que não faça sentido").
item(47,"EScudo simples","Escudo simples feito de madeira").


% Estrutura do equipavel: id dano atrbArm atrbForca atrbDest atrbIntel tipoEquipavel 

equipavel(10,0,2,0,0,0,2).
equipavel(11,0,3,0,0,0,5).
equipavel(17,20,0,1,0,0,1).	
equipavel(21,0,0,0,0,3,1).
equipavel(25,0,0,0,1,0,3).
equipavel(27,0,1,0,0,0,2).
equipavel(30,10,0,1,0,0,1).
equipavel(32,15,0,0,1,0,1).
equipavel(34,0,0,0,0,0,0).	
equipavel(35,5,0,0,0,0,1).
equipavel(36,0,1,0,0,0,2).
equipavel(37,5,0,0,0,1,1).
equipavel(39,0,3,0,0,1,2).
equipavel(40,0,2,1,0,0,4).
equipavel(41,0,1,0,0,1,4).
equipavel(45,0,2,0,2,0,4).
equipavel(47,0,2,0,0,0,5).


% Estrutura do consumivel: id recHp recMp

consumivel(1,0,8).
consumivel(2,0,16).
consumivel(3,8,0).
consumivel(4,16,0).
consumivel(7,2,2).