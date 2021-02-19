library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity shr32 is port(
	input0 : in std_logic_vector(31 downto 0);	
	input1 : in std_logic_vector(31 downto 0);	
	output : out std_logic_vector(31 downto 0)	
);
end entity shr32;

architecture logic of shr32 is
begin
output <= std_logic_vector(shift_right(unsigned(input0), to_integer(signed(input1)))); 
end architecture logic;