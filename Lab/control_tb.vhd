library ieee;
use ieee.std_logic_1164.all;
use work.components_all.all;
use work.ram_initialization.all;

entity control_tb is
end;

architecture logic of control_tb is
signal clk_tb : std_logic;
signal clr_tb : std_logic;
signal inport_tb	: std_logic_vector(31 downto 0);
signal outport_tb	: std_logic_vector(31 downto 0);
signal BusMuxOut_tb	: std_logic_vector(31 downto 0);
--signal R0out_tb			: std_logic_vector(31 downto 0);
--signal R1out_tb			: std_logic_vector(31 downto 0);
--signal R2out_tb			: std_logic_vector(31 downto 0);
--signal R3out_tb			: std_logic_vector(31 downto 0);
--signal R4out_tb			: std_logic_vector(31 downto 0);
--signal R5out_tb			: std_logic_vector(31 downto 0);
--signal R6out_tb			: std_logic_vector(31 downto 0);
--signal R7out_tb			: std_logic_vector(31 downto 0);
--signal R8out_tb			: std_logic_vector(31 downto 0);
--signal R9out_tb			: std_logic_vector(31 downto 0);
--signal R10out_tb		: std_logic_vector(31 downto 0);
--signal R11out_tb		: std_logic_vector(31 downto 0);
--signal R12out_tb		: std_logic_vector(31 downto 0);
--signal R13out_tb		: std_logic_vector(31 downto 0);
--signal R14out_tb		: std_logic_vector(31 downto 0);
--signal R15out_tb		: std_logic_vector(31 downto 0);
signal HIout_tb		: std_logic_vector(31 downto 0);
signal LOout_tb		: std_logic_vector(31 downto 0);
signal IRout_tb		: std_logic_vector(31 downto 0);
signal PCval_tb      : std_logic_vector(31 downto 0);
signal Zout_tb			: std_logic_vector(63 downto 0);
signal MDRval_tb		: std_logic_vector(31 downto 0);
signal MARval_tb		: std_logic_vector(31 downto 0);
signal reset_tb			: std_logic;
signal stop_tb			: std_logic;
signal run_tb			: std_logic;
signal stateout_tb	: state;
--signal RAMcontents_tb : memory;

component datapath port (
			clk: in std_logic;
			reset	: in std_logic;
			stop	: in std_logic;
			run	: out std_logic;
			state_out: out state;
	--		Content: out memory ;
			in_port: in std_logic_vector (31 downto 0);
			out_port: out std_logic_vector (31 downto 0);
			----------------------------------------------
			----3 general registers are shown here--------
			--------only for testing purposes ------------
			----- The full version will have 16 ----------
			------ which are not shown for concision------
			BusMuxOut: out std_logic_vector(31 downto 0);
	--		R0out	: out std_logic_vector(31 downto 0);
	--		R1out	: out std_logic_vector(31 downto 0);
	--		R2out	: out std_logic_vector(31 downto 0);
	--		R3out	: out std_logic_vector(31 downto 0);
	--		R4out	: out std_logic_vector(31 downto 0);
	--		R5out	: out std_logic_vector(31 downto 0);
	--		R6out	: out std_logic_vector(31 downto 0);
	--		R7out	: out std_logic_vector(31 downto 0);
	--		R8out	: out std_logic_vector(31 downto 0);
	--		R9out	: out std_logic_vector(31 downto 0);
	--		R10out : out std_logic_vector(31 downto 0);
	--		R11out : out std_logic_vector(31 downto 0);
	--		R12out : out std_logic_vector(31 downto 0);
	--		R13out : out std_logic_vector(31 downto 0);
	--		R14out : out std_logic_vector(31 downto 0);
	--		R15out : out std_logic_vector(31 downto 0);
			HIout	: out std_logic_vector(31 downto 0);
			LOout	: out std_logic_vector(31 downto 0);
			IRout	: out std_logic_vector(31 downto 0);
			Zout: out std_logic_vector(63 downto 0)
		
		
		
	);
end component;

begin
datapathTest : datapath port map (clk_tb, reset_tb, stop_tb, run_tb, stateout_tb, 
--RAMcontents_tb, 
inport_tb, outport_tb, BusMuxOut_tb, HIout_tb, LOout_tb, IRout_tb, Zout_tb);

clk_process: process
begin
	clk_tb <= '1', '0' after 10 ns;
	wait for 20 ns;
end process clk_process;


main: process
begin
	stop_tb <= '0';
	reset_tb <= '1';
	wait for 15 ns;
	reset_tb <= '0';
	wait for 5600 ns;
end process;
end architecture;	


