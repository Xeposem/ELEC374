library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.components_all.all;

entity datapath is port (
clk: in std_logic;
encoderin: in std_logic_vector(31 downto 0);
register_enable: in std_logic_vector(31 downto 0);
Mdatain: in std_logic_vector(31 downto 0);
MDR_Read: in std_logic;
ALU_sel: in std_logic_vector(4 downto 0);
PC_plus: in std_logic;

in_port: in std_logic_vector (31 downto 0);
out_port: in std_logic_vector (31 downto 0);



BusMuxOut: out std_logic_vector(31 downto 0);
R2out	: out std_logic_vector(31 downto 0);
R4out	: out std_logic_vector(31 downto 0);
R5out	: out std_logic_vector(31 downto 0);
HIout	: out std_logic_vector(31 downto 0);
LOout	: out std_logic_vector(31 downto 0);
IRout	: out std_logic_vector(31 downto 0);
Zout: out std_logic_vector(63 downto 0)
);
end entity;

architecture behav of datapath is

--signal in_port, out_port: std_logic_vector(31 downto 0);
signal BusMuxIn_R0: std_logic_vector(31 downto 0);
signal BusMuxIn_R1: std_logic_vector(31 downto 0);
signal BusMuxIn_R2: std_logic_vector(31 downto 0);
signal BusMuxIn_R3: std_logic_vector(31 downto 0);
signal BusMuxIn_R4: std_logic_vector(31 downto 0);
signal BusMuxIn_R5: std_logic_vector(31 downto 0);
signal BusMuxIn_R6: std_logic_vector(31 downto 0);
signal BusMuxIn_R7: std_logic_vector(31 downto 0);
signal BusMuxIn_R8: std_logic_vector(31 downto 0);
signal BusMuxIn_R9: std_logic_vector(31 downto 0);
signal BusMuxIn_R10: std_logic_vector(31 downto 0);
signal BusMuxIn_R11: std_logic_vector(31 downto 0);
signal BusMuxIn_R12: std_logic_vector(31 downto 0);
signal BusMuxIn_R13: std_logic_vector(31 downto 0);
signal BusMuxIn_R14: std_logic_vector(31 downto 0);
signal BusMuxIn_R15: std_logic_vector(31 downto 0);
signal BusMuxIn_HI: std_logic_vector(31 downto 0);
signal BusMuxIn_LO: std_logic_vector(31 downto 0);
signal BusMuxIn_Zhigh: std_logic_vector(31 downto 0);
signal BusMuxIn_Zlow: std_logic_vector(31 downto 0);
signal BusMuxIn_PC: std_logic_vector(31 downto 0);
signal BusMuxIn_MDR: std_logic_vector(31 downto 0);
signal BusMuxIn_Inport: std_logic_vector(31 downto 0);
signal C_sign_extended: std_logic_vector(31 downto 0);
signal internalBusMuxOut: std_logic_vector(31 downto 0);
signal clr: std_logic;
signal default_zeros: std_logic_vector(31 downto 0);
signal overflow: std_logic;
signal MARout: std_logic_vector(31 downto 0);
signal IIRout: std_logic_vector(31 downto 0);


signal RAM_read: std_logic;
signal RAM_write: std_logic;
signal baout: std_logic;
signal Gra: std_logic;
signal Grc: std_logic;
signal Rin: std_logic;
signal Rout: std_logic;
signal conff_out: std_logic;
signal Rin: std_logic;
signal Rout: std_logic;



begin
default_zeros <= (others =>'0');
clr<='1';

Register0: R0 port map (internalBusMuxOut, register_enable(0),clr, clk, baout, BusMuxIn_R0);


R1	: register32bit port map (internalBusMuxOut, register_enable(1),clr, clk, BusMuxIn_R1); -- input, enable, clr, clk, out
R2 : register32bit port map (internalBusMuxOut, register_enable(2),clr, clk, BusMuxIn_R2);
R3 : register32bit port map (internalBusMuxOut, register_enable(3),clr, clk, BusMuxIn_R3);
R4 : register32bit port map (internalBusMuxOut, register_enable(4),clr, clk, BusMuxIn_R4);
R5 : register32bit port map (internalBusMuxOut, register_enable(5),clr, clk, BusMuxIn_R5);
R6 : register32bit port map (internalBusMuxOut, register_enable(6),clr, clk, BusMuxIn_R6);
R7 : register32bit port map (internalBusMuxOut, register_enable(7),clr, clk, BusMuxIn_R7);
R8 : register32bit port map (internalBusMuxOut, register_enable(8),clr, clk, BusMuxIn_R8);
R9 : register32bit port map (internalBusMuxOut, register_enable(9),clr, clk, BusMuxIn_R9);
R10: register32bit port map (internalBusMuxOut, register_enable(10),clr, clk,BusMuxIn_R10);
R11: register32bit port map (internalBusMuxOut, register_enable(11),clr, clk,BusMuxIn_R11);
R12: register32bit port map (internalBusMuxOut, register_enable(12),clr, clk,BusMuxIn_R12);
R13: register32bit port map (internalBusMuxOut, register_enable(13),clr, clk,BusMuxIn_R13);
R14: register32bit port map (internalBusMuxOut, register_enable(14),clr, clk,BusMuxIn_R14);
R15: register32bit port map (internalBusMuxOut, register_enable(15),clr, clk,BusMuxIn_R15);
HI : register32bit port map (internalBusMuxOut, register_enable(16),clr, clk,BusMuxIn_HI);
LO : register32bit port map (internalBusMuxOut, register_enable(17),clr, clk,BusMuxIn_LO);
PC : register32bit port map (internalBusMuxOut, register_enable(18),clr, clk,BusMuxIn_PC);

IR	: register32bit port map (internalBusMuxOut, register_enable(19),clr, clk, IIRout);

MD_R: MDR port map(MDR_Read, register_enable(20), clr, clk, internalBusMuxOut, Mdatain, BusMuxIn_MDR);
MAR: register32bit port map (internalBusMuxOut, register_enable(21), clr, clk, MARout);

alu_datapath : ALU_path port map (clk, clr, register_enable(22), register_enable(23),internalBusMuxOut, 
internalBusMuxOut, PC_plus, ALU_sel, overflow, BusMuxIn_Zlow, BusMuxIn_Zhigh);

inport_register: register32bit port map ( in_port, register_enable(24),clr,clk, BusMuxIn_Inport);
outport_register: register32bit port map (internalBusMuxOut,register_enable(25), clr, clk, out_port);


confflogic: conff_logic port map (clk, clr, IIRout(22 downto 19), internalBusMuxOut, register_enable(26), conff_out);

Ram: Ram512x32 port map (clk, BusMuxIn_MDR, MARout(8 downto 0), Ram_read, MARout(8 downto 0),Ram_write, Mdatain );

select_and_encode: sel_and_encode port map (IIRout, Gra, Grb, Rin, Rout, baout, C_sign_extended, encoderin(15 downto 0), register_enable(15 downto 0));


datapathBus : the_bus port map (BusMuxIn_R0,BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, 
BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11,BusMuxIn_R12, BusMuxIn_R13, 
BusMuxIn_R14, BusMuxIn_R15, BusMuxIn_HI, BusMuxIn_LO, BusMuxIn_Zhigh,BusMuxIn_Zlow, BusMuxIn_PC, BusMuxIn_MDR, BusMuxIn_Inport,C_sign_extended, 
default_zeros, default_zeros, default_zeros, default_zeros, default_zeros, default_zeros, default_zeros, default_zeros, encoderin, internalBusMuxOut);

BusMuxOut <= internalBusMuxOut;

R0out <= BusMuxIn_R0;
R1out <= BusMuxIn_R1;
R2out <= BusMuxIn_R2;
R3out <= BusMuxIn_R3;
R4out <= BusMuxIn_R4;
R5out <= BusMuxIn_R5;
R6out <= BusMuxIn_R6;
R7out <= BusMuxIn_R7;
R8out <= BusMuxIn_R8;
R9out <= BusMuxIn_R9;
R10out <= BusMuxIn_R10;
R11out <= BusMuxIn_R11;
R12out <= BusMuxIn_R12;
R13out <= BusMuxIn_R13;
R14out <= BusMuxIn_R14;
R15out <= BusMuxIn_R15;
HIout <= BusMuxIn_HI;
LOout <= BusMuxIn_LO;
Zout(63 downto 32) <= BusMuxIn_Zhigh;
Zout(31 downto 0) <= BusMuxIn_Zlow;
IRout <= IIRout;
end architecture;