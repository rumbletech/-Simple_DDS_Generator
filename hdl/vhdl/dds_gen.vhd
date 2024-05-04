library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use dds.dds_pkg.all;

entity dds_gen is
  generic (
    C_LUT_WIDTH  : INTEGER := 32;   -- Selects LUT Resolution --
    C_LUT_DEPTH  : INTEGER := 1024; -- Selects LUT Depth --
	C_DAC_WIDTH  : INTEGER := 16    -- Selects DAC Resolution --
  );
  port (
  
    clk_sys_i  : in  std_logic; -- System Clock used for writing registers and LUT --
	clk_ds_i   : in  std_logic; -- Desampling Clock used for phase accumulation logic --
	reg_sel_i  : in  std_logic; -- Register select --
    reg_addr_i : in  std_logic_vector(3 downto 0);  -- Register address --	
	reg_data_i : in  std_logic_vector(31 downto 0); -- Register data --
	lut_sel_i  : in  std_logic; -- LUT select --
	lut_addr_i : in  std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0); -- LUT address --
	lut_data_i : in  std_logic_vector(C_LUT_WIDTH-1 downto 0); -- LUT data --
	rwr_i      : in  std_logic; -- Read/Write signal -- 
	dac_o      : out std_logic_vector(C_DAC_WIDTH-1 downto 0) -- Output of the module , Synthesized Wave --
	
  );
end entity dds_gen;

architecture implementation of dds_gen is


  
begin




  
end architecture implementation;