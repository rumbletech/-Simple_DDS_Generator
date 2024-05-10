library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use dds.dds_pkg.all;

entity dds_gen is
  generic (
    C_LUT_WIDTH  	: INTEGER := 32;   -- Selects LUT/DAC Resolution --
    C_LUT_DEPTH  	: INTEGER := 1024; -- Selects LUT/Sample Depth( How Many Sample Points. ) --
	C_PHA_ACC_WIDTH : INTEGER := 64;   -- Selects Width of the Phase Accumulator --
	C_DA_WIDTH  	: INTEGER := 16    -- Selects DAC Resolution --
  );	
  port (
  
    clk_sys_i  : in  std_logic; -- System Clock used for writing registers and LUT --
	rst_sys_i  : in  std_logic;
	clk_ds_i   : in  std_logic; -- Desampling Clock used for phase accumulation logic --
	reg_sel_i  : in  std_logic; -- Register select --
    reg_addr_i : in  std_logic_vector(3 downto 0);  -- Register address --	
	reg_data_i : in  std_logic_vector(31 downto 0); -- Register data --
	lut_sel_i  : in  std_logic; -- LUT select --
	lut_addr_i : in  std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0); -- LUT address --
	lut_data_i : in  std_logic_vector(C_LUT_WIDTH-1 downto 0); -- LUT data --
	rwr_i      : in  std_logic; -- Read/Write signal -- 
	dac_o      : out std_logic_vector(C_DA_WIDTH-1 downto 0) -- Output of the module , Synthesized Wave --
	
  );
end entity dds_gen;

architecture implementation of dds_gen is

signal reg_sel             : std_logic := '0';
signal reg_rwr             : std_logic := '0';
signal reg_addr            : std_logic_vector(1 downto 0) := ( others => '0' );
signal reg_data_to         : std_logic_vector(31 downto 0) := ( others => '0' );
signal reg_data_from       : std_logic_vector(31 downto 0) := ( others => '0' );

signal ctrl_tune           : std_logic_vector(63 downto 0) := ( others => '0' );
signal ctrl_start          : std_logic := '0';

signal lut_pa_rwr          : std_logic := '0';
signal lut_pa_en           : std_logic := '0';
signal lut_pa_addr         : std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0) := ( others => '0' );
signal lut_pa_data_from    : std_logic_vector(C_LUT_WIDTH-1 downto 0) := ( others => '0' );
signal lut_pa_data_to      : std_logic_vector(C_LUT_WIDTH-1 downto 0) := ( others => '0' );

signal lut_pb_r            : std_logic := '0';
signal lut_pb_en           : std_logic := '0';
signal lut_pb_addr         : std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0) := ( others => '0' );
signal lut_pb_data_from    : std_logic_vector(C_LUT_WIDTH-1 downto 0) := ( others => '0' );
  
begin


 LUT : entity dds.dds_lut
	generic map (
		C_LUT_WIDTH   => C_LUT_WIDTH,
		C_LUT_DEPTH   => C_LUT_DEPTH	
	);
    port map (
   
		clk_i      => clk_sys_i,
		rst_i      => rst_sys_i,
		pa_rwr_i   => lut_pa_rwr,
		pa_en_i    => lut_pa_en,
		pa_addr_i  => lut_pa_addr,
		pa_data_i  => lut_pa_data_to,
		pa_data_o  => lut_pa_data_from,
		pb_en_i    => lut_pb_en,
		pb_r_i     => lut_pb_r,
		pb_addr_i  => lut_pb_addr,
		pb_data_o  => lut_pb_data_from
    );
	
 CTRL_REGS : entity dds.dds_regs
    port map (
		clk_i  		=> clk_sys_i,
		rst_i  		=> rst_sys_i,
		sel_i  		=> reg_sel,
		rwr_i  		=> reg_rwr,
		addr_i 		=> reg_addr,
		data_i 		=> reg_data_to,
		data_o 		=> reg_data_from,	
		tune_o      => ctrl_tune,
		start_o     => ctr_start
    );
	
 CORE : entity dds.dds_core
	generic map(
		C_LUT_DEPTH        => C_LUT_DEPTH,
		C_PHA_ACC_WIDTH    => C_PHA_ACC_WIDTH
	);
  port (
		clk_sys_i    => clk_sys_i,
		rst_sys_i    => rst_sys_i,
		clk_ds_i     => '0',
		tune_i       => ctrl_tune,
		start_i      => ctr_start,
		lut_addr_o   => lut_pb_addr,
		lut_r_o      => lut_pb_r,
		lut_r_en_o   => lut_pb_en
  );

  
end architecture implementation;