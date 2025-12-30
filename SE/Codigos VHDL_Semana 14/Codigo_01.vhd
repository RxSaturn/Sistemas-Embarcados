library ieee;

--Entradas e saídas
entity SACI is

	port(U1,U2,C : in bit;
		  E : buffer bit;
		  LA,LV : out bit);
end SACI;

--Lógica
architecture funcionamento of SACI is

signal p1,p2,p3,p4,p5 : bit;

begin

	p1 <= not(U1) and not(U2) and not(C);
	p2 <= not(U1) and not(U2) and C;
	p3 <= U1 and not(U2) and C;
	
	p4 <= U1 and U2 and not(C);
	p5 <= U1 and U2 and C;

	E <= p1 or p2 or p3;
	LV <= p4 or p5;
	
	--Se 'E' tivesse sido declarado como saída (out), não poderia
	--ser atribuído a 'LA'. O buffer tem a função de 'copiar' uma
	-- saída para a outra.
	LA <= E;
	
end funcionamento;