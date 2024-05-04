library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use dds.dds_pkg.all;

entity dds_lut is
  generic (
  
    C_LUT_WIDTH  : INTEGER := 32;   -- Selects LUT Resolution --
    C_LUT_DEPTH  : INTEGER := 1024  -- Selects LUT Depth --
	
  );
  port (
    
	clk_sys_i  : in  std_logic;
	clk_ds_i   : in  std_logic;
	-- PORTA ( ACCESS FROM SW )    --
	pa_en_i    : in  std_logic;
	pa_wr_i    : in  std_logic; 
	pa_addr_i  : in  std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0);
    pa_data_i  : in  std_logic_vector(C_LUT_WIDTH-1 downto 0);
 	-- PORTB ( ACCESS FROM LOGIC ) --
	pb_en_i    : in  std_logic;
	pb_r_i     : in  std_logic;
	pb_addr_i  : in  std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0);
	pb_data_o  : out std_logic_vector(C_LUT_WIDTH-1 downto 0)
	
	
  );
end entity dds_lut;

architecture implementation of dds_lut is
  
begin


  
end architecture implementation;