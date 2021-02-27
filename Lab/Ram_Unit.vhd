library ieee;
use ieee.std_logic_1164.all;
use work.component_all.all;
entity Ram_Unit is port (
clk: in std_logic;
data_in: in std_logic_vector(31 downto 0);
read_addr: in std_logic_vector(8 downto 0);
read_en: in std_logic;
write_addr: in std_logic_vector(8 downto 0);
write_en: in std_logic;
output: out std_logic_vector(31 downto 0)
);
end entity Ram_Unit;

architecture structure of Ram_Unit is 

Unit: Ram512x32 port map (clk, data_in, read_addr, read_en, write_addr, write_en, output);
begin 

process(clk, write_en, read_en, data_in, read_addr, write_addr) is 
begin
	output<=(others=>'0');
	if (clk'event and clk = '1') then 
		if (write_en = '1') then 
			
