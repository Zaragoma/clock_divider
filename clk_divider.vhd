-- Engineer: Emre Kahraman
-- Create Date: 13.12.2020
-- Project Name: clk_divider
-- Target Devices: xc7a35tcpg236-1
-- Tool Versions: Vivado 2017.4
-- Description: Clock divider for 100mz on BASYS3 Board.
-- Revision: v0.0
-- Additional Comments:	Please do not delete these commands.

-- Librarys Begin
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
-- Librarys End

-- Entity Begin
entity clk_divider is
	Port 
	( 
		CLK 		: IN  STD_LOGIC;
		RST 		: IN  STD_LOGIC;
		CLK_100 	: OUT STD_LOGIC;
		CLK_50		: OUT STD_LOGIC;
		CLK_25		: OUT STD_LOGIC;
		CLK_12_5	: OUT STD_LOGIC
	);
end clk_divider;
-- Entity End

-- Design Begin
architecture Behavioral of clk_divider is

	--Internal Signals
	signal counter : std_logic_vector(3 downto 0) := (others => '0');

begin
	
	CLK_100 	<= counter(0);
	CLK_50 		<= counter(1);
	CLK_25 		<= counter(2);
	CLK_12_5 	<= counter(3);
	
	process(CLK, RST)
	begin
		if RST = '1' then
			counter <= (others => '0');
		
		elsif rising_edge(CLK) then	
			counter <= counter + 1;
		
		end if;
	end process; 
end Behavioral;
-- Design End
