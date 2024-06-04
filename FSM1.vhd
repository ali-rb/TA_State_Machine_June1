----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:29:47 06/01
-- Design Name: 
-- Module Name:    FSM1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM1 is
port (
		clk,rst,inp : in std_logic;
		outp 			:out std_logic_vector(1 downto 0)
		);

end FSM1;

architecture Behavioral of FSM1 is

type state is (st1 , st2 , st3 , st4);
signal pr_state , nx_state : state;
signal temp_out: std_logic_vector(1 downto 0);

begin

 p1_seq: process (clk , rst)
begin
	if rst='1' then pr_state<=st1;
	elsif (clk'event and clk='1') then pr_state<=nx_state;
	end if;
	outp<=temp_out;
 end process;

p2_comb: process (inp,pr_state)
begin
case pr_state is 

when st1 =>
		if inp='1' then nx_state<=st2;
		else nx_state<=st1;
		end if;
	temp_out<="00";

when st2 =>
		if inp='0' then nx_state<=st3;
		else nx_state<=st4;
		end if;
	temp_out<="01";

when st3 =>
		if inp='1' then nx_state<=st4;
		else nx_state<=st3;
		end if;
	temp_out<="10";

when st4 =>
		if inp='1' then nx_state<=st1;
		else nx_state<=st2;
		end if;
	temp_out<="11";
	
when others =>
	nx_state<=st1;
	temp_out<="00";
	
end case;
end process;
end Behavioral;