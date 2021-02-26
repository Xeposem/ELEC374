library ieee;
use ieee.std_logic_1164.all;

entity conff_logic is port (
	C2_bits: in std_logic_vector(1 downto 0);
	Busmux_in: in std_logic_vector(31 downto 0);
	Con_in: in std_logic;
	Q: out std_logic;
);
end entity conff_logic;


architecture logic of conff_logic is 
signal Con_d: std_logic;
signal dec_out: std_logic_vector(3 downto 0);
