library ieee;
use ieee.std_logic_1164.all;

entity R0 is port(
	input: in std_logic_vector (31 downto 0);
	R0in: in std_logic;
	clr: in std_logic;
	clk: in std_logic;
	BAout: in std_logic;
	output : out std_logic_vector (31 downto 0);
);
end entity R0;

architecture logic of R0 is 
signal Q: std_logic_vector (31 downto 0);
variable I: std_logic_vector (31 downto 0);
begin 

process(clk, clr)
		begin
			if clr = '0' then 
				Q<= (others=>'0');
			elsif (clk'event and clk='1') then
            if ld = '1' then
                Q <= input;
            end if;
        end if;
    end process;

for index in 0 to input'length-1 loop 
	I(index):= (Q(index) and (not BAout));
end loop;

output<= I;

end architecture logic;

	

