library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.ram_init.all;
use work.components_all.all;


entity RAM_512x32 is port
(
      data	: in std_logic_vector(31 downto 0);
      address	: in std_logic_vector(8 downto 0);
      wren	: in std_logic;
		rden	: in std_logic;
      q		: out std_logic_vector(31 downto 0)
);
end entity;

architecture logic of RAM_512x32 is
signal ram_block : mem := initial_mem;

begin
process (wren, rden, address, data)
begin

if(wren = '1') then
	ram_block(to_integer(unsigned(address))) <= data;
elsif(rden = '1') then
	q <= ram_block(to_integer(unsigned(address)));
end if;
end process;
end architecture;