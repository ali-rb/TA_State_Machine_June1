----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:19:14 06/01 
-- Design Name: 
-- Module Name:    FSM2 - Behavioral 
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

entity FSM2 is
port (
		clk,rst,in1 : in std_logic;
		out1 			:out std_logic_vector(2 downto 0)
		);
end FSM2;

architecture Behavioral of FSM2 is

type state is(s0,s1,s2,s3,s4); 

 signal pr_state,nx_state :state; 
 signal temp_out1 : STD_LOGIC_VECTOR (2 downto 0);
 
Begin
 
 p1:process(clk,rst) 

begin

	if rst='1' then pr_state<=s0;
		elsif(clk 'event and clk ='1') then
		pr_state<=nx_state; 
		out1<=temp_out1; 
	end if; 
 end process;

 p2:process(pr_state,in1) 
begin 
	case pr_state is 
		
		when s0=> 
		if in1='1' then nx_state<=s1; temp_out1<="001"; else 
			nx_state<=s4; temp_out1<="101"; 
		end if;
		
		
		when s1=> 
		if in1='1' then nx_state<= s4; temp_out1<="110"; else
			nx_state<=s2; temp_out1<="100"; 
		end if;
		
		
		when s2=> 
		if in1='1' then nx_state<= s3; temp_out1<="111"; else
			nx_state<= s4; temp_out1<="011"; 
		end if; 
		
		
		when s3=> 
		if in1='1' then nx_state<= s1; temp_out1<="001"; else
			nx_state<=s0; temp_out1<="000"; 
		end if;
		
		
		when s4=> 
		if in1='1' then nx_state<=s3; temp_out1<="110"; else
			nx_state<=s0; temp_out1<="000"; 
		end if;
		
		when others=> nx_state<=s0; temp_out1<="000"; 
	end case; 
 end process; 
end Behavioral;