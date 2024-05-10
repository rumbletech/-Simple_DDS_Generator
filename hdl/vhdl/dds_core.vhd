library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use dds.dds_pkg.all;

entity dds_core is
  generic (
    C_LUT_DEPTH     :  INTEGER := 1024;  -- Selects LUT/Sampling Point Depth --
	C_PHA_ACC_WIDTH :  INTEGER := 64
  );
  port (
		clk_sys_i    : in std_logic; -- Currently System Clock , but this should be clocked by Desampling Clock --
		rst_sys_i    : in std_logic; -- Sys Reset --
		clk_ds_i     : in std_logic; -- Desampling Clock --
		tune_i       : in std_logic_vector(C_PHA_ACC_WIDTH-1 downto 0); -- Tuning Word from regs --
		start_i      : in std_logic;
		lut_addr_o   : out std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0); -- Controls LUT addr --
		lut_r_o      : out std_logic; -- Controls LUT Read --
		lut_r_en_o   : out std_logic  -- Controls LUT Enable --	
  );
end entity dds_core;

architecture implementation of dds_core is
  
signal pha_acc : std_logic_vector(C_PHA_ACC_WIDTH-1 downto 0) := ( others => '0' ); 
signal next_pha_acc : std_logic_vector(C_PHA_ACC_WIDTH-1 downto 0) := ( others => '0' );

begin

lut_r_o <= start_i;
lut_r_en_o <= start_i; 
lut_addr_o <= pha_acc(clog2(C_LUT_DEPTH)-1 downto 0);

process ( clk_sys_i ) begin 
	if( clk_sys_i'event and clk_sys_i = '1' ) then 
		if ( rst_sys_i = '1' ) then 
			pha_acc <= ( others => '0' );
		else 
			if ( start_i = '1' ) then 
				pha_acc <= next_pha_acc;
			else
				pha_acc <= ( others => '0' );
			end if;
		end if;
	end if;
end process;

entity dds.dds_adder
	generic map ( 
		C_VEC_SIZE => C_PHA_ACC_WIDTH
	);
    port map (
		A_i 	=> 	pha_acc,
		B_i 	=> 	tune_i,
		C_i 	=> 	'0',
		C_o 	=> 	open,
		S_o 	=> 	next_pha_acc
    );

end architecture implementation;