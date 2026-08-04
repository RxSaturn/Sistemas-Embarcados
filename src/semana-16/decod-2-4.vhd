library ieee;

entity decod_2_4 is

	port(entr : in bit_vector(1 downto 0);
		  saidas : out bit_vector (3 downto 0);
		  enable : in bit);
		  
end decod_2_4;

architecture funcionamento of decod_2_4 is 

begin

	--Sensitivity list
	process(entr,enable)
	
	begin
	
		if enable = '1' then
		
			case entr is
			
				when "00" => saidas <= "0001";
				when "01" => saidas <= "0010";
				when "10" => saidas <= "0100";
				when "11" => saidas <= "1000";
				
			end case;
				
		else
		
			saidas <= "0000";
	
		end if;
	
	end process;

end funcionamento;