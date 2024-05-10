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
    
	clk_i      : in  std_logic;
	rst_i      : in  std_logic;
	-- PORTA ( ACCESS FROM SW )    --
	pa_rwr_i   : in  std_logic; 
	pa_en_i    : in  std_logic;
	pa_addr_i  : in  std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0);
    pa_data_i  : in  std_logic_vector(C_LUT_WIDTH-1 downto 0);
	pa_data_o  : out std_logic_vector(C_LUT_WIDTH-1 downto 0);
 	-- PORTB ( ACCESS FROM LOGIC ) --
	pb_en_i    : in std_logic;
	pb_r_i     : in  std_logic;
	pb_addr_i  : in  std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0);
	pb_data_o  : out std_logic_vector(C_LUT_WIDTH-1 downto 0)
	
	
  );
end entity dds_lut;

architecture implementation of dds_lut is

  type lut is array (natural range <>) of std_logic_vector(C_LUT_WIDTH-1 downto 0);
  signal pb_reg_out : std_logic_vector( C_LUT_WIDTH-1 downto 0 ) := ( others => '0' );
  signal pa_reg_out : std_logic_vector( C_LUT_WIDTH-1 downto 0 ) := ( others => '0' );
  signal dpram : lut(C_LUT_DEPTH-1 downto 0) := ( others => ( others => '0' ) );
 
begin

-- PA READ/WRITE PORT --
PA: process ( clk_i ) is begin 

	if ( clk_i'event and clk_i = '1' ) then 
		if ( rst_i = '1' ) then 
			pa_reg_out <= ( others => '0' );
		else 	
			if ( pa_en_i = '1' ) then 
				if ( pa_rwr_i = '1' ) then 
					dpram(to_integer(unsigned(pa_addr_i))) <= pa_data_i;
				else 
					pa_reg_out <=  dpram(to_integer(unsigned(pa_addr_i)));
				end if;
			else 
				pa_reg_out <= pa_reg_out;
			end if;
		end if;
	end if;
end process PA;

-- PB READ ONLY PORT --
PB: process ( clk_i ) is begin 

	if ( clk_i'event and clk_i = '1' ) then 
		if ( rst_i = '1' ) then 
			pb_reg_out <= ( others => '0' );
		else 
			if ( pb_en_i = '1' ) then 
				if ( pb_r_i = '1' ) then 
					pb_reg_out <= dpram(to_integer(unsigned(pb_addr_i)));
				else 
					pb_reg_out <= pb_data_o;
				end if;
			else 
				pb_reg_out <= pb_data_o;
			end if;
		end if;
	end if;
end process PB;


pb_data_o <= pb_reg_out;
pa_data_o <= pa_reg_out;			

end architecture implementation;