Library ieee;
Use ieee.std_logic_1164.ALL;
Use ieee.std_logic_arith.ALL;
Use ieee.std_logic_unsigned.ALL;

entity register64bit is Port(
D : in std_logic_vector (63 downto 0);
ld : in std_logic; 
clr : in std_logic;
clk : in std_logic;
Q0: out std_logic_vector (31 downto 0);
Q1: out std_logic_vector (31 downto 0)
); 

end entity register64bit; --for register Z


architecture behav of register64bit is 
begin
	process(clk, clr)
		begin
			if clr = '0' then --active low
				Q0<= (others=>'0');
				Q1<= (others=>'0');
			elsif (clk'event and clk ='1') then
            if ld = '1' then
                Q0 <= D(31 downto 0);
					 Q1 <= D(63 downto 32);
            end if;
        end if;
    end process;
end behav;