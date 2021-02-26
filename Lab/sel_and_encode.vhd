library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sel_and_encode is port (
	IR_in: in std_logic_vector(31 downto 0);
	Gra: in std_logic;
	Grb: in std_logic;
	Rin: in std_logic;
	Rout: in std_logic;
	BAout: in std_logic;
	C_extended: out std_logic_vector(31 downto 0);
	R_in: out std_logic_vector(15 downto 0);
	R_out: out std_logic_vector(15 downto 0)
);
end entity sel_and_encode;

architecture logic of sel_and_encode is 
signal a, b, c : std_logic_vector(3 downto 0);
signal dec_in: std_logic_vector (3 downto 0);
signal dec_out: std_logic_vector (3 downto 0);
begin 

a(3)<= IRin(26) and Gra;
a(2)<= IRin(25) and Gra;
a(1)<= IRin(24) and Gra;
a(0)<= IRin(23) and Gra;

b(3)<= IRin(22) and Grb;
b(2)<= IRin(21) and Grb;
b(1)<= IRin(20) and Grb;
b(0)<= IRin(19) and Grb;

c(3)<= IRin(18) and Grc;
c(2)<= IRin(17) and Grc;
c(1)<= IRin(16) and Grc;
c(0)<= IRin(15) and Grc;

dec_in<= (a or b or c);

with dec_in select 
dec_out <= "0000000000000000" when "0000",
			  "0000000000000010" when "0001", 
			  "0000000000000100" when "0010",
			  "0000000000001000" when "0011",
			  "0000000000010000" when "0100",
			  "0000000000100000" when "0101",
			  "0000000001000000" when "0110",
			  "0000000010000000" when "0111",
			  "0000000100000000" when "1000",
			  "0000001000000000" when "1001",
			  "0000010000000000" when "1010",
			  "0000100000000000" when "1011",
			  "0001000000000000" when "1100",
			  "0010000000000000" when "1101", 
			  "0100000000000000" when "1110",
			  "1000000000000000" when others;
			  
R_in(15) <= Rin and dec_out(15);
R_in(14) <= Rin and dec_out(14);
R_in(13) <= Rin and dec_out(13);
R_in(12) <= Rin and dec_out(12);
R_in(11) <= Rin and dec_out(11);
R_in(10) <= Rin and dec_out(10);
R_in(9) <= Rin and dec_out(9);
R_in(8) <= Rin and dec_out(8);
R_in(7) <= Rin and dec_out(7);
R_in(6) <= Rin and dec_out(6);
R_in(5) <= Rin and dec_out(5);
R_in(4) <= Rin and dec_out(4);
R_in(3) <= Rin and dec_out(3);
R_in(2) <= Rin and dec_out(2);
R_in(1) <= Rin and dec_out(1);
R_in(0) <= Rin and dec_out(0);

R_out(15) <= dec_out(15) and (Rout or BAout);
R_out(14) <= dec_out(14) and (Rout or BAout);
R_out(13) <= dec_out(13) and (Rout or BAout);
R_out(12) <= dec_out(12) and (Rout or BAout);
R_out(11) <= dec_out(11) and (Rout or BAout);
R_out(10) <= dec_out(10) and (Rout or BAout);
R_out(9) <= dec_out(9) and (Rout or BAout);
R_out(8) <= dec_out(8) and (Rout or BAout);
R_out(7) <= dec_out(7) and (Rout or BAout);
R_out(6) <= dec_out(6) and (Rout or BAout);
R_out(5) <= dec_out(5) and (Rout or BAout);
R_out(4) <= dec_out(4) and (Rout or BAout);
R_out(3) <= dec_out(3) and (Rout or BAout);
R_out(2) <= dec_out(2) and (Rout or BAout);
R_out(1) <= dec_out(1) and (Rout or BAout);
R_out(0) <= dec_out(0) and (Rout or BAout);

C_extended <= std_logic_vector(resize(signed(IR_in(18 downto 0)), C_extended'length));

end architecture logic;