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
	rst_sys_i  : in  std_logic;
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


signal lut_pa_rwr          : std_logic := '0';
signal lut_pa_en           : std_logic := '0';
signal lut_pa_addr         : std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0) := ( others => '0' );
signal lut_pa_data_from    : std_logic_vector(C_LUT_WIDTH-1 downto 0) := ( others => '0' );
signal lut_pa_data_to      : std_logic_vector(C_LUT_WIDTH-1 downto 0) := ( others => '0' );
signal lut_pb_r            : std_logic := '0';
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
		pb_en_i    => '1',
		pb_r_i     => lut_pb_r,
		pb_addr_i  => lut_pb_addr,
		pb_data_o  => lut_pb_data_from
    );

  
end architecture implementation;