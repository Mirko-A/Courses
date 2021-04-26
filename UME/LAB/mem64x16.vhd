----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2021 09:50:59 AM
-- Design Name: 
-- Module Name: mem64x16 - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem64x16 is
    Port ( clk : in STD_LOGIC;
    
           address : in STD_LOGIC_VECTOR(5 downto 0);
           rdata : out STD_LOGIC_VECTOR(15 downto 0);
           wdata : in STD_LOGIC_VECTOR(15 downto 0);
           write : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           ce : in STD_LOGIC);
end mem64x16;

architecture Behavioral of mem64x16 is

    type mem_type_t is array(0 to 63)
                of STD_LOGIC_VECTOR(15 downto 0);
    signal ram_s: mem_type_t;            

begin
    
    write_process: process(clk) is 
    begin
    if(reset = '1') then 
        ram_s <= (others => (others => '0'));
    else if (clk'event and clk = '1') then
        if (enable = '1') then
            if(ce = '1') then
                if(write = '1') then
                    ram_s(conv_integer(address)) <= wdata;
                    -- write first
                    rdata <= wdata;
                else
                    rdata <= ram_s(conv_integer(address));
                end if;
            end if;
          end if;
       end if;
    end if;
    end process;

end Behavioral;
