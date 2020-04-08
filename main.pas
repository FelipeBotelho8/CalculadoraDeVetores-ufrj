Program Calculadora;
(*Programa que calcula operações (and, or, xor) entre dois vetores, ordena crescentemente vetores, obtem a transposta  de uma matriz e  multiplica  duas matrizes, sempre armazenando o resultado de uma operação para ser usado em outra, também sendo possível apagar esse resultado armazenado; Responsável: Felipe Botelho Nunes da Silva; Data: 17/01/2016*)

Uses Testes,crt;

Type
	matriz = array[1..50,1..50] of real;
	vetor = array[1..50] of real;

Procedure lerElemvet(var elem:integer); (*Procedimento para ler a quantidade de elementos do vetor.*)

Begin
	writeln('informe o numero de ELEMENTOS EXISTENTES no vetor.(NO MAXIMO 50.)');
	testElem(elem); {Leitura e teste da entrada}
End;

Procedure lerLinCol(var lin,col:integer); (*Procedimento para ler o número de linhas e colunas de uma matriz*)
Begin
	writeln('informe o numero de LINHAS EXISTENTES na matriz: (NO MAXIMO 50)');
	testElem(lin); {Leitura e teste da entrada}
	writeln('informe o numero de COLUNAS EXISTENTES na matriz: (NO MAXIMO 50)');
	testElem(col); {Leitura e teste da entrada}
End;

Procedure lerVetint(var vet:vetor;var elem:integer);(*Procedimento para ler os valores de um vetor de inteiros*)
Var	
	cont:integer;
	valor:longint;
Begin
	writeln('Informe os dados do vetor:');
	lerElemvet(elem); {Leitura e teste da entrada}
	for cont:=1 to elem do
	begin
		writeln('Insira um valor INTEIRO para posicao ',cont);
		testvetInt(valor,cont); {Ler e testar se a entrada é um número inteiro.}
		vet[cont]:=valor;
	end;
	clrscr;
End;

Procedure lerVetbin(var vet:vetor;elem:integer);(*Procedimento para ler os valores de só um vetor binário*)

Var
	cont,valor:integer;
Begin
	for cont:=1 to elem do
	begin	
		writeln('Insira o valor da posicao ',cont, ' (DEVE SER 0 ou 1)');
		test0ou1(valor,cont); {Leitura e teste se a entrada é 1 ou 0}
		vet[cont]:=valor;
	end;
	clrscr;
End;

Procedure ler2Vetsbin(var vet1,vet2:vetor;var elem1,elem2:integer);(*Procedimento para ler os valores de dois vetores binários*)
Begin
	write('Para o PRIMEIRO vetor, ');
	lerElemvet(elem1);
	lerVetbin(vet1,elem1);
	clrscr;
	writeln('Para o SEGUNDO vetor: ');
	elem2:=elem1; {Igualar o número de elementos existentes nos vetores}
	lerVetbin(vet2,elem2);
	clrscr;
		
End;

Procedure lerMat(var mat:matriz;lin,col:integer); (*Procedimento para ler os valores de uma matriz*)
Var
	cont1,cont2:integer;
	valor:longint;
Begin
	for cont1:=1 to lin do
	begin
		for cont2:=1 to col do
		begin
			writeln('Insira o valor da posicao ',cont1,', ',cont2);
			testmatInt(valor,cont1,cont2); {Ler e testar se a entrada é número inteiro.}
			mat[cont1,cont2]:=valor;
		end;
	end;
	clrscr;
End;

Procedure ler2Mats(var mat1,mat2:matriz; var lin1,col1,lin2,col2:integer);
(*Procedimento para ler os dados de duas matrizes que possam servir como fatores de uma multiplicação*)
Var
	resposta:char;
	erro:integer; {Variável que controlará presença de erro}
Begin
	erro:=0; {Quando não houver erro}
	repeat
		writeln('Para a PRIMEIRA matriz:');
		lerLinCol(lin1,col1);
		lerMat(mat1,lin1,col1);
		clrscr;
		repeat
			writeln('Para a SEGUNDA matriz:');
			lerLinCol(lin2,col2);
			if (col1<>lin2) then
			begin
				writeln('ERRO: O numero de colunas da primeira matriz eh diferente do numero de linhas da primeira matriz.');
				writeln('Deseja voltar desde o inicio? (Tecle "s" para digitar novamente os valores da primeira e segunda matriz, ou tecle "n" para digitar somente os valores da segunda matriz.');
				testSouN(resposta);
				clrscr;
				erro:=1 {Houve erro}
			end
			else
			begin
				resposta:='s';
				erro:=0;
			end;
		until(resposta='s');
	until(erro=0);
	lerMat(mat2,lin2,col2);
	clrscr;
End;

Procedure andvet(var vetRes:vetor;vet1,vet2:vetor;var elemRes:integer;elem1,elem2:integer);(*Procedimento para fazer o AND entre dois vetores binários e exibir o resultado*)
Var
	cont:integer;
Begin
	elemRes:=elem1;
	writeln('O vetor resultante e:');
	writeln();
	for cont:=1 to elemRes do {Calculo do AND entre cada posicao dos vetores}
	begin
		if ((vet1[cont]=1)and(vet2[cont]=1)) then
		begin
			vetRes[cont]:=1;
		end
		else 
		begin
			vetRes[cont]:=0;
		end;
		write(vetRes[cont]:0:0,' ');
	end;
	writeln();
End;


Procedure orvet(var vetRes:vetor;vet1,vet2:vetor;var elemRes:integer;elem1,elem2:integer);(*Procedimento para fazer o OR entre dois vetores binários e exibir o resultado*)
Var
	cont:integer;
Begin
	elemRes:=elem1;
		
	writeln('O vetor resultante e:');
	writeln();
	for cont:=1 to elemRes do {Calculo do OR entre cada posicao dos vetores}
	begin
		if ((vet1[cont]=0)and(vet2[cont]=0)) then
		begin
			vetRes[cont]:=0;
		end
		else
		begin
			vetRes[cont]:=1;
		end; 
		write(vetRes[cont]:0:0,' ');
	end;
	writeln();
End;


Procedure xorvet(var vetRes:vetor;vet1,vet2:vetor;var elemRes:integer;elem1,elem2:integer);(*Procedimento para fazer o XOR entre dois vetores binários e exibir o resultado*)
Var
	cont:integer;

Begin
	elemRes:=elem1;

	writeln('O vetor resultante e:');
	writeln();
	for cont:=1 to elemRes do {Calculo do XOR entre cada posicao dos vetores}
	begin
		if (vet1[cont]=vet2[cont]) then
		begin
			vetRes[cont]:=0;
		end
		else
		begin
			vetRes[cont]:=1;
		end;
		write(vetRes[cont]:0:0,' ');
	end;
	writeln();
End;

Procedure memorizarVet(var vetMem:vetor;vet:vetor;var elemMem:integer;elem:integer);
(*Procedimento para armazenar dados de um vetor em outro*)
Var
	cont:integer;
Begin
	elemMem:=elem;
	for cont:=1 to elem do
	begin
	vetMem[cont]:=vet[cont];
	end;

End;

Procedure memorizarMat(var matMem:matriz;mat:matriz;var linMem,colMem:integer;lin,col:integer);
(*Procedimeto para armazenar dados de uma matriz em outra*)
Var
	cont1,cont2:integer;
Begin
	linMem:=lin;
	colMem:=col;
	for cont1:=1 to lin do
	begin
		for cont2:=1 to col do
		begin
			matMem[cont1,cont2]:=mat[cont1,cont2];
		end;
	end;
End;

Procedure ordenaVet(var vet:vetor;elem:integer); (*Procedimento para ordenar um vetor em ordem crescente e exibir o resltado*)
Var
	cont1,cont2:integer;
	aux:vetor;
Begin
	writeln('O vetor ordenado e:');
	writeln();
	for cont1:=1 to (elem-1) do
	begin
		for cont2:=1 to (elem-1) do
		begin
			if (vet[cont2]>vet[cont2+1]) then {Comparação entre dois valores de posições consecutivas}
			begin
				aux[cont2]:=vet[cont2];
				vet[cont2]:=vet[cont2+1];
				vet[cont2+1]:=aux[cont2];
			end;
		end;
	end;
	for cont1:=1 to elem do {Exibir resultado}
	begin
		write(vet[cont1]:0:0,' ');
	end;
	writeln();
	writeln();
	
End;

Procedure transpostaMat(var resultado:matriz;mat:matriz;var linRes,colRes:integer;lin,col:integer);
(*Procedimento que calcula a transposta de uma matriz e exibe o resultado*)
Var
	cont1,cont2:integer;
Begin
	linRes:=col;
	colRes:=lin;
	writeln('A matriz resultante e:');
	writeln();
	for cont1:=1 to linRes do
	begin
		for cont2:=1 to colRes do
		begin
			resultado[cont1,cont2]:=mat[cont2,cont1];
			write(resultado[cont1,cont2]:0:0,'   ');
		end;
		writeln();
	end;
	writeln();
	
End;

Procedure multiplicaMats(var resultado:matriz;mat1,mat2:matriz;var linRes,colRes:integer;lin1,col1,lin2,col2:integer);
(*Procedimento que calcula a multiplicação de duas matrizes e exibe o resultado*)
Var
	cont1,cont2,cont3:integer;
Begin
	linRes:=lin1; {O número de linhas do resultado e da primeira matriz é sempre igual na multiplicação de matrizes}
	colRes:=col2; {O número de colunas do resultado e da segunda matriz é sempre igual na multiplicação de matrizes}
	writeln('O resultado eh:');
	writeln();
	for cont1:=1 to linRes do {Incializar todos os valores da matriz resultante com 0}
	begin
		for cont2:=1 to colRes do
		begin
			resultado[cont1,cont2]:=0;
		end;
	end;
	
	for cont1:=1 to linRes do {Fazer a multiplicação}
	begin
		for cont2:=1 to colRes do
		begin
			for cont3:=1 to lin2 do
			begin
				resultado[cont1,cont2]:=resultado[cont1,cont2]+(mat1[cont1,cont3]*mat2[cont3,cont2]);
			end;
			write(resultado[cont1,cont2]:0:0,'   ');
		end;
		writeln();
	end;
	writeln();
End;

Function calcNumbin(vetMem:vetor;elemMem:integer):integer; (*Função para calcular o número de elementos binários existentes em um vetor*)
Var
	cont:integer;
Begin
	calcNumbin:=0;
	for cont:=1 to elemMem do
	begin
		if ((vetMem[cont]=1)or(vetMem[cont]=0)) then
		begin
			calcNumbin:=calcNumbin+1;
		end;
	end;
End;

Procedure usarMem(var resultado,vetMem:vetor;var elemRes,elemMem:integer;opcao:integer); (*Procedimento para analaisar se é possível usar o vetor memória, perguntar ao usuário sobre seu uso, e realiar a operação com ele, para as operações AND, OR e XOR*)
Var
	resposta:char;
	vet1,vet2:vetor;
	elem1,elem2:integer;
Begin
	if (calcNumbin(vetMem,elemMem)=elemMem) then 
	begin	
		writeln('Deseja usar o resultado anterior nessa operacao? Tecle s(sim)ou n(nao)');
		testSouN(resposta); {Leitura e teste da entrada}
		clrscr;
		if (resposta = 's') then
		begin
			elem1:=elemMem;
			writeln('Para o outro vetor:');
			lerVetbin(vet1,elem1);
			case opcao of
				1:	andvet(resultado,vet1,vetMem,elemRes,elem1,elemMem);{Operação ANS} 
				2:	orvet(resultado,vet1,vetMem,elemRes,elem1,elemMem); {Operação OR}
				3:	xorvet(resultado,vet1,vetMem,elemRes,elem1,elemMem);{Operação XOR}
			end;
			memorizarVet(vetMem,resultado,elemMem,elemRes);{Memorizar dados do resultados}
		end
		else {Com a resposta "n"(não), fará a operação entre dois vetores que serão solicitados}
		begin
			ler2Vetsbin(vet1,vet2,elem1,elem2);
			case opcao of
				1:	andvet(resultado,vet1,vet2,elemRes,elem1,elem2); {Operação AND}
				2:	orvet(resultado,vet1,vet2,elemRes,elem1,elem2); {Operação OR}
				3:	xorvet(resultado,vet1,vet2,elemRes,elem1,elem2); {Operação XOR}
			end;
			memorizarVet(vetMem,resultado,elemMem,elemRes); {Memorizar dados do resultado}
		end;
	end
	else {Nesse caso a memória possui um ou mais valores que não é(são) binário(s)}
	begin
		writeln('O vetor memoria armazenado nao sera utilizado pois nao e binario.');
		writeln('Deseja continuar? Digite "s" para informar dois vetores e fazer a operacao ou "n" para voltar ao menu.');
		testSouN(resposta); {Leitura e teste da entrada}
		clrscr;
		if (resposta='s') then
		begin
			ler2Vetsbin(vet1,vet2,elem1,elem2);
			case opcao of
				1:	andvet(resultado,vet1,vet2,elemRes,elem1,elem2); {Operação AND}
				2:	orvet(resultado,vet1,vet2,elemRes,elem1,elem2); {Operação OR}
				3:	xorvet(resultado,vet1,vet2,elemRes,elem1,elem2); {Operação XOR}
			end;
			memorizarVet(vetMem,resultado,elemMem,elemRes); {Memorizar dados do resultado}
		end;
	end;
End;		

//************************************** PROGRAMA PRINCIPAL ******************************************


Var
	vetResultado,vetMem,vet1,vet2:vetor;
	matResultado,matMem,mat1,mat2:matriz;
	elemVetres,elemMem,elem1,elem2:integer;
	linRes,colRes,linMem,colMem,lin1,lin2,col1,col2:integer;
	opcao,cont1,cont2:integer;
	resposta: char;
Begin
	opcao:=0; {Inicializar variavel.}
	elemMem:=50; {Inicializar variavel.}
	for cont1:=1 to 50 do {Inicializar o vetor e matriz que armazenarão resultados}
	begin
		for cont2:=1 to 50 do
		begin
		vetMem[cont1]:=1/10; {1/10 pois esse valor nunca irá aparecer na leitura dos vetores, matrizes ou nos resultados, assim ele será ignorado e considerado um vetor/matriz vazio}
		matMem[cont1,cont2]:=1/10;
		end;
	end;

	writeln('               BEM VINDO A CALCULADORA DE MATRIZES E VETORES!');
	writeln();	
	repeat {Menu de orientação das possiveis operacoes.}
		writeln('Digite 1 para calcular o AND entre dois vetores binarios.');
		writeln('Digite 2 para calcular o OR entre dois vetores binarios.');
		writeln('Digite 3 para calcular o XOR entre dois vetores binarios.');
		writeln('Digite 4 para ordenar um vetor de elementos inteiros.');
		writeln('Digite 5 para calcular a transposta de uma matriz de inteiros.');
		writeln('Digite 6 para multiplicar duas matrizes.');
		writeln('Digite 7 para apagar o ultimo resultado armazenado');
		writeln('Digite 8 para sair');
		writeln('Escolha uma das opcoes acima:');
		test1a8(opcao); {Leitura e teste da entrada}
		clrscr;
		case opcao of
			1: begin {AND entre vetores}
					if (vetMem[1]=1/10) then {Caso em que não há resultado anterior}
					begin
						ler2Vetsbin(vet1,vet2,elem1,elem2);
						andvet(vetResultado,vet1,vet2,elemVetres,elem1,elem2);
						memorizarVet(vetMem,vetResultado,elemMem,elemVetres); {Memorizar dados do resultado}
					end
					else {Caso em que há resultado anterior armazenado}
					begin
						usarMem(vetResultado,vetMem,elemVetres,elemMem,opcao);
					end;
					writeln();
				end;

			2:	begin {OR entre vetores}
					if (vetMem[1]=1/10) then {Caso em que não há resultado anterior}
					begin
						ler2Vetsbin(vet1,vet2,elem1,elem2);
						orvet(vetResultado,vet1,vet2,elemVetres,elem1,elem2);
						memorizarVet(vetMem,vetResultado,elemMem,elemVetres); {Memorizar dados do resultado}
					end
					else {Caso em que há resultado anterior armazenado}
					begin
						usarMem(vetResultado,vetMem,elemVetres,elemMem,opcao);
					end;
					writeln();
				end;
				
			3:	begin {XOR entre vetores}
					if (vetMem[1]=10) then {Caso em que não há resultado anterior}
					begin
						ler2Vetsbin(vet1,vet2,elem1,elem2);
						xorvet(vetResultado,vet1,vet2,elemVetres,elem1,elem2);
						memorizarVet(vetMem,vetResultado,elemMem,elemVetres); {Memorizar dados do resultado}
					end
					else {Caso em que há resultado anterior armazenado}
					begin
						usarMem(vetResultado,vetMem,elemVetres,elemMem,opcao);
					end;
					writeln();
				end;

			4: begin {Ordenar vetor}
					if (vetMem[1]=1/10) then {Caso em que não há resultado anterior}
					begin
						lerVetint(vetResultado,elemVetres);
						ordenaVet(vetResultado,elemVetres);
						memorizarVet(vetMem,vetResultado,elemMem,elemVetres);
					end
					else {Caso em que há resultado anterior}
					begin
						writeln('Deseja usar o resultado anterior nessa operacao? Tecle s(sim)ou n(nao)');
						testSouN(resposta); {Leitura e teste da entrada}
						clrscr;
						if (resposta = 's') then {Memória será usada}
						begin
							ordenaVet(vetMem,elemMem);
							memorizarVet(vetMem,vetMem,elemMem,elemMem);
						end
						else {Memória não será usada}
						begin
							lerVetint(vetResultado,elemVetres);
							ordenaVet(vetResultado,elemVetres);
							memorizarVet(vetMem,vetResultado,elemMem,elemVetres);
						end;
					end;
				end;

			5: begin {Transposta de uma matriz}
					if (matMem[1,1]=1/10) then {Caso em que há resultado anterior}
					begin
						lerLinCol(lin1,col1);
						lerMat(mat1,lin1,col1);
						transpostaMat(matResultado,mat1,linRes,colRes,lin1,col1);
						memorizarMat(matMem,matResultado,linMem,colMem,linRes,colRes);
					end
					else {Caso em que não há resultado anteriro}
					begin
						writeln('Deseja usar o resultado anterior nessa operacao? Tecle s(sim) ou n(nao).');
						testSouN(resposta); {Leitura e teste da entrada}
						clrscr;
						if (resposta='s') then {Memória será usada}
						begin
							transpostaMat(matResultado,matMem,linRes,colRes,linMem,colMem);
							memorizarMat(matMem,matResultado,linMem,colMem,linRes,colRes);
						end
						else {Memória não será usada}
						begin
							lerLinCol(lin1,col1);
							lerMat(mat1,lin1,col1);
							transpostaMat(matResultado,mat1,linRes,colRes,lin1,col1);
							memorizarMat(matMem,matResultado,linMem,colMem,linRes,colRes);
						end;
					end;
					
				end;

			6: begin {Multiplicação entre duas matrizes}
					if (matMem[1,1]=1/10) then {Caso em que há resultado anterior}
					begin
					ler2Mats(mat1,mat2,lin1,col1,lin2,col2);
					multiplicaMats(matResultado,mat1,mat2,linRes,colRes,lin1,col1,lin2,col2);
					memorizarMat(matMem,matResultado,linMem,colMem,linRes,colRes);
					end
					else {Caso em que não há resultado anterior}
					begin
						writeln('Deseja usar o resultado anterior nessa operacao? Tecle s(sim) ou n(nao)');
						testSouN(resposta); {Leitura e teste da entrada}
						clrscr;
						if (resposta='s') then {Memória será usada}
						begin
							writeln('Digite 1 se deseja usar a memoria como PRIMEIRO fator da multiplicacao, ou 2 para usa-la como SEGUNDO fator');
							test1ou2(opcao); {Leitura e teste da entrada}
							clrscr;
							if (opcao=1) then {Memoria será o primeiro fator}
							begin
							writeln('Informe os dados da matriz que sera o SEGUNDO fator:');
							repeat
								lerLinCol(lin2,col2);
								if (colMem<>lin2) then
								begin
									writeln('O numero de linhas dessa matriz dever ser igual ao numero de colunas da matriz memoria, que eh ',colMem,'. Tente novamente:');
								end;
							until(colMem=lin2);
							lerMat(mat2,lin2,col2);
							multiplicaMats(matResultado,matMem,mat2,linRes,colRes,linMem,colMem,lin2,col2);
							memorizarMat(matMem,matResultado,linMem,colMem,linRes,colRes);
							end
							else {Memória será o segundo fator}
							begin
								writeln('Informe os dados da matriz que sera o PRIMEIRO fator:');
							repeat
								lerLinCol(lin1,col1);
								if (col1<>linMem) then
								begin
									writeln('O numero de colunas dessa matriz dever ser igual ao numero de linhas da matriz memoria, que eh ',linMem,'. Tente novamente:');
								end;
							until(col1=linMem);
							lerMat(mat1,lin1,col1);
							multiplicaMats(matResultado,mat1,matMem,linRes,colRes,lin1,col1,linMem,colMem);
							memorizarMat(matMem,matResultado,linMem,colMem,linRes,colRes);
							end;
						end
						else {Memória não será usada}
						begin
							ler2Mats(mat1,mat2,lin1,col1,lin2,col2);
							multiplicaMats(matResultado,mat1,mat2,linRes,colRes,lin1,col1,lin2,col2);
							memorizarMat(matMem,matResultado,linMem,colMem,linRes,colRes);
						end;
					end;
				end;

			7:	begin {Apagar os dados armazenados}
					if ((vetMem[1]<>1/10)or(matMem[1,1]<>1/10)) then
					begin
						for cont1:=1 to 50 do
						begin
							for cont2:=1 to 50 do
							begin
								vetMem[cont2]:=1/10;
								matMem[cont1,cont2]:=1/10;
							end; 
						end;
						writeln('Memoria apagada!');
						writeln();
					end
					else if ((vetMem[1]=1/10)and(matMem[1,1]=1/10)) then
					begin
						writeln('A memoria ja esta vazia.');
						writeln();
					end;
				end;
		end;
	until(opcao=8); {Opção que sai do programa}


End.
