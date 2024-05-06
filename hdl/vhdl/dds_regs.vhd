-- VHDL entity declaration
entity dds_regs is
  generic (

  );
  port (
	clk_i  : in  std_logic;
	rst_i  : in  std_logic;
	sel_i  : in  std_logic;
	rwr_i  : in  std_logic;
	addr_i : in  std_logic_vector(1 downto 0);
	data_i : in  std_logic_vector(31 downto 0);
	data_o : out std_logic_vector(31 downto 0);
	
  );
end entity dds_regs;

architecture implementation of dds_regs is
  
  constant REG_CTRL_ADDR    : std_logic_vector(1 downto 0) := "00";
  constant REG_FREQ_ADDR    : std_logic_vector(1 downto 0) := "00";
  constant REG_UNUSED0_ADDR : std_logic_vector(1 downto 0) := "00";
  constant REG_UNUSED1_ADDR : std_logic_vector(1 downto 0) := "00";

  signal : reg_read       : std_logic_vector(31 downto 0) := ( others => '0' );
  signal : reg_ctrl       : std_logic_vector(31 downto 0) := ( others => '0' );
  signal : reg_freq       : std_logic_vector(31 downto 0) := ( others => '0' );
  signal : reg_unused_0   : std_logic_vector(31 downto 0) := ( others => '0' ); 
  signal : reg_unused_1   : std_logic_vector(31 downto 0) := ( others => '0' ); 

  
begin
  
process ( clk_i ) is begin
	if( clk_i'event = and clk_i = '1' ) then 
		if ( rst_i = '1' ) then 
			reg_read      <= ( others => '0' );
			reg_control   <= ( others => '0' );
			reg_frequency <= ( others => '0' );
			reg_unused_0  <= ( others => '0' );
			reg_unused_1  <= ( others => '0' );
		else 
			if ( sel_i = '1' ) then 
				if ( rwr_i = '1' ) then 
					case( addr_i ) is			
						when REG_CTRL_ADDR => reg_control <= data_i;
						when REG_FREQ_ADDR => reg_freq <= data_i;
						when REG_UNUSED0_ADDR => reg_unused_0 <= data_i;
						when REG_UNUSED1_ADDR => reg_unused_1 <= data_i;
					end case;
				else
					case( addr_i ) is			
						when REG_CTRL_ADDR => reg_read <= reg_control;
						when REG_FREQ_ADDR => reg_read <= reg_freq;
						when REG_UNUSED0_ADDR => reg_read <= reg_unused_0;
						when REG_UNUSED1_ADDR => reg_read <= reg_unused_1;
					end case;
				end if;
			else 
				reg_read <= reg_read;
				reg_control <= reg_control;
				reg_freq <= reg_freq;
				reg_unused_0 <= reg_unused_0;
				reg_unused_1 <= reg_unused_1;
				
			end if;
		end if;
	end if;
end process;
				
					
  
end architecture implementation;