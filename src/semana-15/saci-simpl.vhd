library ieee;

--Entradas e saídas
entity SACI_simpl is

	port(U1,U2,C : in bit;
		  E : buffer bit;
		  LA,LV : out bit);
end SACI_simpl;

--Lógica
architecture funcionamento of SACI_simpl is

signal entradas : bit_vector(2 downto 0);
signal saidas : bit_vector(1 downto 0);  --E e LV

begin

	--Monta um vetor de entradas: Linhas na tabela-verdade.
	entradas <= U1&U2&C;
	
	with entradas select
	
		saidas <= "10" when "000" | "001" | "101",
		          "00" when "010" | "011" | "100",
					 "01" when "110" | "111";
					 
	E <= saidas(1);
	LV <= saidas(0);
	
	--Se 'E' tivesse sido declarado como saída (out), não poderia
	--ser atribuído a 'LA'. O buffer tem a função de 'copiar' uma
	-- saída para a outra.
	LA <= E;
	
end funcionamento;