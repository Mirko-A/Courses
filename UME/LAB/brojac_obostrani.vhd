----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2021 10:22:53 AM
-- Design Name: 
-- Module Name: brojac_obostrani - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity brojac_obostrani is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           updown : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR(9 downto 0);
           counter_value: in STD_LOGIC_VECTOR(9 downto 0);
           load : in STD_LOGIC);
end brojac_obostrani;

architecture Behavioral of brojac_obostrani is
signal count_s: std_logic_vector(9 downto 0) := (others => '0');

begin

    count: process(clk) is 
    begin
        if(clk'event and clk = '1') then
            if(load = '1') then 
                count_s <= counter_value;
            else
                if (enable = '1') then
                    if (updown = '1') then
                        count_s <= count_s + 1;
                    else 
                        count_s <= count_s - 1;
                    end if;
                end if;
            end if;
        end if;    
    end process;
    
    q <= count_s;
end Behavioral;
