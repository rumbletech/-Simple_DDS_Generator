library IEEE;
library DDS;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use DDS.dds_pkg.all;

entity dds_gen is
  generic (
    C_LUT_WIDTH  	: INTEGER := 32;   -- Selects LUT/DAC Resolution --
    C_LUT_DEPTH  	: INTEGER := 1024; -- Selects LUT/Sample Depth( How Many Sample Points. ) --
	C_PHA_ACC_WIDTH : INTEGER := 32;   -- Selects Width of the Phase Accumulator , Max is 32 bits --
	C_DA_WIDTH  	: INTEGER := 16    -- Selects DAC Resolution --
  );	
  port (
  
    clk_sys_i   : in  std_logic; -- System Clock used for writing registers and LUT --
	rst_sys_i   : in  std_logic;
	reg_sel_i   : in  std_logic; -- Register select --
	reg_rwr_i   : in  std_logic; -- Read/Write reg signal -- 
    reg_addr_i  : in  std_logic_vector(1 downto 0);  -- Register address --	
	reg_data_i  : in  std_logic_vector(31 downto 0); -- Register data --
	reg_data_o  : out std_logic_vector(31 downto 0); -- Register read data --
	lut_sel_i   : in  std_logic; -- LUT select --
	lut_addr_i  : in  std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0); -- LUT address --
	lut_data_i  : in  std_logic_vector(C_LUT_WIDTH-1 downto 0); -- LUT data --
	lut_data_o  : out std_logic_vector(C_LUT_WIDTH-1 downto 0); -- LUT read data --
	lut_rwr_i   : in  std_logic; -- Read/Write LUT signal -- 	
	dac_data_o  : out std_logic_vector(C_DA_WIDTH-1 downto 0); -- Output of the module , Synthesized Wave --
	dac_valid_o : out std_logic
	
  );
end entity dds_gen;

architecture implementation of dds_gen is

signal ctrl_tune           : std_logic_vector(31 downto 0) := ( others => '0' );
signal ctrl_start          : std_logic := '0';
signal lut_pb_r            : std_logic := '0';
signal lut_pb_en           : std_logic := '0';
signal lut_pb_addr         : std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0) := ( others => '0' );
signal lut_pb_data         : std_logic_vector(C_LUT_WIDTH-1 downto 0) := ( others => '0' );
  
begin


 LUT : entity DDS.dds_lut
	generic map (
		C_LUT_WIDTH   => C_LUT_WIDTH,
		C_LUT_DEPTH   => C_LUT_DEPTH	
	)
    port map (
   
		clk_i      => clk_sys_i,
		rst_i      => rst_sys_i,
		pa_rwr_i   => lut_rwr_i,
		pa_en_i    => lut_sel_i,
		pa_addr_i  => lut_addr_i,
		pa_data_i  => lut_data_i,
		pa_data_o  => lut_data_o,
		pb_en_i    => lut_pb_en,
		pb_r_i     => lut_pb_r,
		pb_addr_i  => lut_pb_addr,
		pb_data_o  => lut_pb_data
    );
	
 CTRL_REGS : entity DDS.dds_regs
    port map (
		clk_i  		=> clk_sys_i,
		rst_i  		=> rst_sys_i,
		sel_i  		=> reg_sel_i,
		rwr_i  		=> reg_rwr_i,
		addr_i 		=> reg_addr_i,
		data_i 		=> reg_data_i,
		data_o 		=> reg_data_o,	
		tune_o      => ctrl_tune,
		start_o     => ctrl_start
    );
	
 CORE : entity DDS.dds_core
	generic map(
		C_LUT_DEPTH        => C_LUT_DEPTH,
		C_LUT_WIDTH        => C_LUT_WIDTH,
		C_DA_WIDTH         => C_DA_WIDTH,
		C_PHA_ACC_WIDTH    => C_PHA_ACC_WIDTH
	)
    port map (
		clk_sys_i    => clk_sys_i,
		rst_sys_i    => rst_sys_i,
		tune_i       => ctrl_tune,
		start_i      => ctrl_start,
		lut_addr_o   => lut_pb_addr,
		lut_data_i   => lut_pb_data,
		lut_r_o      => lut_pb_r,
		lut_r_en_o   => lut_pb_en,
		dac_data_o   => dac_data_o,
		dac_valid_o  => dac_valid_o
  );

  
end architecture implementation;