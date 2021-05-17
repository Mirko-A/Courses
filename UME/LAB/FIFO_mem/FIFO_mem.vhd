----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2021 11:13:17 PM
-- Design Name: 
-- Module Name: FIFO_mem - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFO_mem is
    Port ( clk : in STD_LOGIC;
           full_o : out STD_LOGIC;
           empty_o : out STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR(15 downto 0);
           write_en : in STD_LOGIC;
           read_en : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR(15 downto 0));
end FIFO_mem;

architecture Behavioral of FIFO_mem is
type reg_banka_t is array(0 to 15)
                of STD_LOGIC_VECTOR(15 downto 0);
signal reg_banka_s: reg_banka_t := (others => (others => '0'));

signal w_address: STD_LOGIC_VECTOR(3 downto 0) := conv_std_logic_vector(0, 4);
signal r_address: STD_LOGIC_VECTOR(3 downto 0) := conv_std_logic_vector(0, 4);
signal mem_count: STD_LOGIC_VECTOR(3 downto 0) := conv_std_logic_vector(0, 4);
signal full_s: STD_LOGIC := '0';
signal empty_s: STD_LOGIC := '0';

begin
                
    clk_process: process(clk) is
    begin      
       
        if(clk'event and clk = '1') then
            if (reset = '1') then
                reg_banka_s <= (others => (others => '0'));
                mem_count <= conv_std_logic_vector(0, 4);
                w_address <= conv_std_logic_vector(0, 4);
                r_address <= conv_std_logic_vector(0, 4);
            else
                if (write_en = '1') then -- upis
                    if (full_s = '0') then
                        reg_banka_s(conv_integer(w_address)) <= data_in;
                        w_address <= w_address + 1;
                        mem_count <= mem_count + 1; -- broj popunjenih mesta u memoriji ++
                    end if;  
                end if;  
                if (read_en = '1') then -- citanje
                    if (empty_s = '0') then
                        data_out <= reg_banka_s(conv_integer(r_address));
                        reg_banka_s(conv_integer(r_address)) <= conv_std_logic_vector(0, 16);
                        r_address <= r_address + 1;
                        mem_count <= mem_count - 1; -- broj popunjenih mesta u memoriji --
                    end if;
                end if;
            end if;
       end if;
    end process;
    
    mem_count_process: process(mem_count) is 
    begin 
    
        if(conv_integer(mem_count) = 15) then
            full_s <= '1';
        elsif(conv_integer(mem_count) = 0) then
            empty_s <= '1';
        else
            full_s <= '0';        
            empty_s <= '0';
        end if;   

    end process;
        
    full_o <= full_s;
    empty_o <= empty_s;
    
end Behavioral;
