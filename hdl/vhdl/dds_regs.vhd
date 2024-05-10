library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use dds.dds_pkg.all;

entity dds_regs is
  port (
	clk_i   : in  std_logic;
	rst_i   : in  std_logic;
	sel_i   : in  std_logic;
	rwr_i   : in  std_logic;
	addr_i  : in  std_logic_vector(1 downto 0);
	data_i  : in  std_logic_vector(31 downto 0);
	data_o  : out std_logic_vector(31 downto 0);
	tune_o  : out std_logic_vector(63 downto 0);
	start_o : out std_logic
		
  );
end entity dds_regs;

architecture implementation of dds_regs is
  
  constant REG_CTRL_ADDR    : std_logic_vector(1 downto 0) := "00";
  constant REG_TUNE0_ADDR   : std_logic_vector(1 downto 0) := "00";
  constant REG_TUNE1_ADDR   : std_logic_vector(1 downto 0) := "00";
  constant REG_UNUSED1_ADDR : std_logic_vector(1 downto 0) := "00";
  
  constant BIT_START_INDEX     : INTEGER := 31;
  constant BIT_UNUSED30_INDEX  : INTEGER := 30;
  constant BIT_UNUSED29_INDEX  : INTEGER := 29;
  constant BIT_UNUSED28_INDEX  : INTEGER := 28;  
  constant BIT_UNUSED27_INDEX  : INTEGER := 27;  
  constant BIT_UNUSED26_INDEX  : INTEGER := 26;  
  constant BIT_UNUSED25_INDEX  : INTEGER := 25;
  constant BIT_UNUSED24_INDEX  : INTEGER := 24;
  constant BIT_UNUSED23_INDEX  : INTEGER := 23;
  constant BIT_UNUSED22_INDEX  : INTEGER := 22;
  constant BIT_UNUSED21_INDEX  : INTEGER := 21;
  constant BIT_UNUSED20_INDEX  : INTEGER := 20;
  constant BIT_UNUSED19_INDEX  : INTEGER := 19;
  constant BIT_UNUSED18_INDEX  : INTEGER := 18;
  constant BIT_UNUSED17_INDEX  : INTEGER := 17;
  constant BIT_UNUSED16_INDEX  : INTEGER := 16;
  constant BIT_UNUSED15_INDEX  : INTEGER := 15;
  constant BIT_UNUSED14_INDEX  : INTEGER := 14;
  constant BIT_UNUSED13_INDEX  : INTEGER := 13;
  constant BIT_UNUSED12_INDEX  : INTEGER := 12;
  constant BIT_UNUSED11_INDEX  : INTEGER := 11;
  constant BIT_UNUSED10_INDEX  : INTEGER := 10;
  constant BIT_UNUSED09_INDEX  : INTEGER := 9;
  constant BIT_UNUSED08_INDEX  : INTEGER := 8;
  constant BIT_UNUSED07_INDEX  : INTEGER := 7;
  constant BIT_UNUSED06_INDEX  : INTEGER := 6;
  constant BIT_UNUSED05_INDEX  : INTEGER := 5;
  constant BIT_UNUSED04_INDEX  : INTEGER := 4;
  constant BIT_UNUSED03_INDEX  : INTEGER := 3;
  constant BIT_UNUSED02_INDEX  : INTEGER := 2;
  constant BIT_UNUSED01_INDEX  : INTEGER := 1;
  constant BIT_UNUSED00_INDEX  : INTEGER := 0;

  signal : reg_read       : std_logic_vector(31 downto 0) := ( others => '0' );
  signal : reg_ctrl       : std_logic_vector(31 downto 0) := ( others => '0' );
  signal : reg_tuning_0   : std_logic_vector(31 downto 0) := ( others => '0' );
  signal : reg_tuning_1   : std_logic_vector(31 downto 0) := ( others => '0' ); 
  signal : reg_unused_1   : std_logic_vector(31 downto 0) := ( others => '0' ); 

begin
  
process ( clk_i ) is begin
	if( clk_i'event = and clk_i = '1' ) then 
		if ( rst_i = '1' ) then 
			reg_read      <= ( others => '0' );
			reg_control   <= ( others => '0' );
			reg_tuning_0 <= ( others => '0' );
			reg_tuning_1  <= ( others => '0' );
			reg_unused_1  <= ( others => '0' );
		else 
			if ( sel_i = '1' ) then 
				if ( rwr_i = '1' ) then 
					case( addr_i ) is			
						when REG_CTRL_ADDR    => reg_control <= data_i;
						when REG_TUNE0_ADDR   => reg_tuning_0 <= data_i;
						when REG_TUNE1_ADDR   => reg_tuning_1 <= data_i;
						when REG_UNUSED1_ADDR => reg_unused_1 <= data_i;
					end case;
				else
					case( addr_i ) is			
						when REG_CTRL_ADDR    => reg_read <= reg_control;
						when REG_TUNE0_ADDR   => reg_read <= reg_tuning_0;
						when REG_TUNE1_ADDR   => reg_read <= reg_tuning_1;
						when REG_UNUSED1_ADDR => reg_read <= reg_unused_1;
					end case;
				end if;
			else 
				reg_read <= reg_read;
				reg_control <= reg_control;
				reg_tuning_0 <= reg_tuning_0;
				reg_tuning_1 <= reg_tuning_1;
				reg_unused_1 <= reg_unused_1;
				
			end if;
		end if;
	end if;
end process;


tune_o <= reg_tuning_1 & reg_tuning_0;
start_o  <= reg_ctrl(BIT_START_INDEX);				
					
  
end architecture implementation;