Unit Testes;
(*Unit que solicita entrada de dados e os testam de acordo com seus tipos e intervalos; Responsável: Felipe Botelho Nunes da Silva; Data: 17/01/2016*) 

Interface
	procedure testElem(var elem:integer);
	procedure test0ou1(var valor:integer;posicao:integer);
	procedure test1a8(var opcao:integer);
	procedure testSouN(var opcao:char);
	procedure testvetInt(var valor:longint;posicao:integer);
	procedure testmatInt(var valor:longint;posicao1,posicao2:integer);
	procedure test1ou2(var opcao:integer);

Implementation
	
	Procedure testElem(var elem:integer); (*Procedimento para testar se o valor inserido é inteiro menor ou igual a 50 e maior ou igual a 1*) 
	Var 
	erro:integer; {Variável que controlará presença de erro. Quando igual a 0 representa ausência de erro, quando igual a 1 representa a presença de erro }
	Begin
		erro:=0; {Inicialização da variável}
		repeat
			{$i-}
			readln(elem);
			if (ioresult<>0) then
			begin
				writeln('O valor inserido nao e um numero inteiro, digite novamente outro valor:');
				erro:=1;
			end
			else if (elem>50) then
			begin
				writeln('O valor inserido e maior que 50, digite novamente outro valor:');
				erro:=1; 
			end
			else if (elem<1) then
			begin
				writeln('O valor inserido e menor que 1, digite novamente outro valor:');
				erro:=1;
			end
			else
			begin
				erro:=0;
			end;
		until(erro=0); {Repitir até que não haja erro}
		{$i+}
			
	End;

	Procedure test0ou1(var valor:integer;posicao:integer); (*Procedimento para testar se o valor inserido é 0 ou 1*)
	Var 
	erro:integer; {Variável que controlará presença de erro. Quando igual a 0 representa ausência de erro, quando igual a 1 representa a presença de erro}
	Begin
		erro:=0; {Inicialização da variável}
		repeat
			{$i-}
			readln(valor);
			if (ioresult<>0) then
			begin
				writeln('O valor inserido e diferente de 0 ou 1. Insira outro valor para a posicao ',posicao,':');
				erro:=1;
			end
			else if((valor=0) or (valor=1)) then
			begin
				erro:=0;
			end
			else if ((valor<>0) or (valor<>1)) then
			begin
				writeln('O valor inserido e diferente de 0 ou 1. Insira outro valor para a posicao ',posicao,':');
				erro:=1;
			end;
		until(erro=0); {Repitir até que não haja erro}
		{$i+}
	End;

	Procedure test1a8(var opcao:integer); (*Procedimento para testar se o valor inserido é inteiro maior ou igual a 1 e menor ou igual a 8*)
	Var
		erro:integer; {Variável que controlará presença de erro. Quando igual a 0 representa ausência de erro, quando igual a 1 representa a presença de erro}
	Begin
		erro:=0; {Inicialização da variável}
		repeat
			{$i-}
			readln(opcao);
			if (ioresult<>0) then
			begin
				writeln('Valor invalido, digite novamente outro valor:');
				erro:=1;
			end
			else if (opcao>8) then
			begin
				writeln('Valor invalido, digite novamente outro valor:');
				erro:=1;
			end
			else if (opcao<1) then
			begin
				writeln('Valor invalido, digite novamente outro valor:');
				erro:=1;
			end
			else
			begin
				erro:=0;
			end;
			
			if (erro=1) then {Reapresentará o menu}
			begin
				writeln('Digite 1 para calcular o AND entre dois vetores binarios.');
				writeln('Digite 2 para calcular o OR entre dois vetores binarios.');
				writeln('Digite 3 para calcular o XOR entre dois vetores binarios.');
				writeln('Digite 4 para ordenar um vetor');
				writeln('Digite 7 para apagar o vetor memoria.');
				writeln('Digite 8 para sair.');
				writeln('Escolha uma das opcoes acima:');
			end;
			writeln();
		until(erro=0); {Repitir até que não haja erro}
		{$i+}
	end;

	Procedure testSouN(var opcao:char); (*Procedimento para testar se o valor inserido é "s"(sim) ou "n"(não)*)
	Var
		erro:integer; {Variável que controlará presença de erro. Quando igual a 0 representa ausência de erro, quando igual a 1 representa a presença de erro}
	Begin
		erro:=0; {Inicialização da variável}
		repeat
			{$i-}
			readln(opcao);
			if (ioresult<>0) then
			begin
				writeln('Valor invalido. Digite s(sim) ou n(nao):');
				erro:=1;
			end
			else if((opcao='s') or (opcao='n')) then
			begin
				erro:=0;
			end
			else if ((opcao<>'s') or (opcao<>'n')) then
			begin
				writeln('Valor invalido. Digite s(sim) ou n(nao)');
				erro:=1;
			end;
		until(erro=0); {Repitir até que não haja erro}
		{$i+}
	End;

	Procedure testvetInt(var valor:longint;posicao:integer); (*Procedimenti para testar se o valor inserido em um vetor é inteiro*)
	Var
		erro:integer; {Variável que controlará presença de erro. Quando igual a 0 representa ausência de erro, quando igual a 1 representa a presença de erro}
	Begin
		erro:=0; {Inicialização da variável}
		repeat
			{$i-}
			readln(valor);
			if (ioresult<>0) then
			begin
				writeln('O valor nao e inteiro. Digite outro valor para posicao ',posicao,':');
				erro:=1;
			end
			else
			begin
				erro:=0;
			end;
		until(erro=0); {Repitir até que não haja erro}
		{$i+}
	End;

	Procedure testmatInt(var valor:longint;posicao1,posicao2:integer); (*Procedimento para testar se o valor inserido em uma matriz é inteiro*)
	Var
		erro:integer; {Variável que controlará presença de erro. Quando igual a 0 representa ausência de erro, quando igual a 1 representa a presença de erro}
	Begin
		erro:=0; {Inicialização da variável}
		repeat
			{$i-}
			readln(valor);
			if (ioresult<>0) then
			begin
				writeln('O valor nao e inteiro. Digite outro valor para posicao ',posicao1,', ',posicao2,':');
				erro:=1;
			end
			else
			begin
				erro:=0;
			end;
		until(erro=0); {Repetir até que não haja erro}
		{$i+}
	End;

	Procedure test1ou2(var opcao:integer); (*Procedimento para testar se o valor informado é 1 ou 2*)
	Var 
		erro:integer; {Variável que controlará presença de erro. Quando igual a 0 representa ausência de erro, quando igual a 1 representa a presença de erro}
	Begin
		erro:=0; {Inicialização da variável}
		repeat
			{$i-}
			readln(opcao);
			if (ioresult<>0) then
			begin
				writeln('O valor inserido e diferente de 1 ou 2. Tente novamente:');
				erro:=1;
			end
			else if((opcao=1) or (opcao=2)) then
			begin
				erro:=0;
			end
			else if ((opcao<>1) or (opcao<>2)) then
			begin
				writeln('O valor inserido e diferente de 1 ou 2. Tente novamente:');
				erro:=1;
			end;
		until(erro=0); {Repetir até que não haja erro}
		{$i+}
	End;

End.
