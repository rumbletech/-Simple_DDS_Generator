library IEEE;
library DDS;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use DDS.dds_pkg.all;

entity dds_core is
  generic (
    C_LUT_DEPTH     :  INTEGER := 1024;  -- Selects LUT/Sampling Point Depth --
	C_LUT_WIDTH     :  INTEGER := 16;    -- Selects LUT Width/Resolution --
	C_DA_WIDTH      :  INTEGER := 16;    -- Selects actual DA width --
	C_PHA_ACC_WIDTH :  INTEGER := 32     -- Selects Phase Accumulator Width/Frequency Resolution --
  );
  port (
		clk_sys_i    : in std_logic; -- Currently System Clock , but this should be clocked by Desampling Clock --
		rst_sys_i    : in std_logic; -- Sys Reset --
		tune_i       : in std_logic_vector(C_PHA_ACC_WIDTH-1 downto 0); -- Tuning Word from regs/external --
		start_i      : in std_logic; -- Start from regs/external --
		lut_addr_o   : out std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0); -- Controls LUT addr --
		lut_data_i   : in  std_logic_vector(C_LUT_WIDTH-1 downto 0); -- DATA from LUT --
		lut_ren_o    : out std_logic; -- Controls LUT Read --	
		dac_data_o   : out std_logic_vector(C_DA_WIDTH-1 downto 0); -- DAC ITF Data --
		dac_valid_o  : out std_logic; -- DAC ITF Valid --
		cycle_cnt_o  : out std_logic -- Cycle End Indicator --
  );
end entity dds_core;

architecture implementation of dds_core is
  
signal pha_acc : std_logic_vector(C_PHA_ACC_WIDTH-1 downto 0) := ( others => '0' ); 
signal next_pha_acc : std_logic_vector(C_PHA_ACC_WIDTH-1 downto 0) := ( others => '0' );
signal start_s : std_logic := '0';

begin

lut_ren_o <= start_i; 
dac_valid_o <= start_s;
lut_addr_o <= pha_acc(C_PHA_ACC_WIDTH-1 downto C_PHA_ACC_WIDTH - clog2(C_LUT_DEPTH));
dac_data_o <= lut_data_i(C_LUT_WIDTH-1 downto C_LUT_WIDTH - C_DA_WIDTH );

process ( clk_sys_i ) begin 
	if( clk_sys_i'event and clk_sys_i = '1' ) then 
		if ( rst_sys_i = '1' ) then 
			pha_acc <= ( others => '0' );
		else 
			start_s <= start_i;
			if ( start_i = '1' ) then 
				pha_acc <= next_pha_acc;
			else
				pha_acc <= ( others => '0' );
			end if;
		end if;
	end if;
end process;

PHA_ACC_ADDER : entity DDS.dds_adder
	generic map ( 
		C_VEC_SIZE => C_PHA_ACC_WIDTH
	)
    port map (
		A_i 	=> 	pha_acc,
		B_i 	=> 	tune_i,
		C_i 	=> 	'0',
		C_o 	=> 	cycle_cnt_o,
		S_o 	=> 	next_pha_acc
    );

end architecture implementation;