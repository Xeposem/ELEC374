LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY ror32 IS
	PORT
	(
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		distance		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END ror32;


ARCHITECTURE SYN OF ror32 IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC ;



	COMPONENT lpm_clshift
	GENERIC (
		lpm_shifttype		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL;
		lpm_widthdist		: NATURAL
	);
	PORT (
			data	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			direction	: IN STD_LOGIC ;
			distance	: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			result	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	sub_wire1    <= '1';
	result    <= sub_wire0(31 DOWNTO 0);

	LPM_CLSHIFT_component : LPM_CLSHIFT
	GENERIC MAP (
		lpm_shifttype => "ROTATE",
		lpm_type => "LPM_CLSHIFT",
		lpm_width => 32,
		lpm_widthdist => 5
	)
	PORT MAP (
		data => data,
		direction => sub_wire1,
		distance => distance,
		result => sub_wire0
	);



END SYN;