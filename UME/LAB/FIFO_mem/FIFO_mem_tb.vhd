----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2021 12:05:45 PM
-- Design Name: 
-- Module Name: FIFO_mem_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFO_mem_tb is
--  Port ( );
end FIFO_mem_tb;

architecture Behavioral of FIFO_mem_tb is

signal clk_s: STD_LOGIC;
signal full_s: STD_LOGIC; 
signal empty_s: STD_LOGIC;
signal reset_s: STD_LOGIC := '0';
signal write_en_s: STD_LOGIC := '0';
signal read_en_s: STD_LOGIC := '0';

signal data_in_s: STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal data_out_s: STD_LOGIC_VECTOR(15 downto 0);

begin
    
    FIFO_mem_test: entity work.FIFO_mem(Behavioral)
                    port map(
                        clk => clk_s,
                        full_o => full_s,
                        empty_o => empty_s,
                        reset => reset_s,
                        data_in => data_in_s,
                        data_out => data_out_s,
                        write_en => write_en_s,
                        read_en => read_en_s
                    );
    clk_gen: process
    begin
        clk_s <= '0', '1' after 50ns;
        wait for 100ns;
    end process;
    
     
    
    test_process: process
    begin
        wait until clk_s = '1';
        wait until clk_s = '1';
        data_in_s <= conv_std_logic_vector(2, 16);
        write_en_s <= '1';
        wait until clk_s = '1';
        wait until clk_s = '1';
        data_in_s <= conv_std_logic_vector(4, 16);
        wait until clk_s = '1';
        wait until clk_s = '1';
        wait until clk_s = '1';
        data_in_s <= conv_std_logic_vector(3, 16);
        wait until clk_s = '1';
        wait until clk_s = '1';
        write_en_s <= '0';
        read_en_s <= '1';
        wait until clk_s = '1';
        data_in_s <= conv_std_logic_vector(5, 16);
        wait until clk_s = '1';
        wait until clk_s = '1';
        wait until clk_s = '1';
        data_in_s <= conv_std_logic_vector(6, 16);
        wait until clk_s = '1';
        wait until clk_s = '1';
        read_en_s <= '0';
        write_en_s <= '1';
        wait until clk_s = '1';
        wait until clk_s = '1';
        data_in_s <= conv_std_logic_vector(3, 16);
        wait until clk_s = '1';
        wait until clk_s = '1';
        wait until clk_s = '1';
        wait until clk_s = '1';
        reset_s <= '0';
        wait until clk_s = '1';
        wait until clk_s = '1';
        wait until clk_s = '1';
        wait until clk_s = '1';
        data_in_s <= conv_std_logic_vector(0, 16);
        wait until clk_s = '1';
        wait until clk_s = '1';
        wait until clk_s = '1';
        wait until clk_s = '1';
        write_en_s <= '0';
        read_en_s <= '1';
        wait until clk_s = '1';
        wait until clk_s = '1';
        
        wait until clk_s = '1';
        wait until clk_s = '1';
        
        wait until clk_s = '1';
        wait until clk_s = '1';
        read_en_s <= '0';       
                               
        wait;
    end process;
    
end Behavioral;
