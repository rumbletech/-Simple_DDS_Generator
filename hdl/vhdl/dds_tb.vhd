-- Generic TestBench for the Core --

library IEEE;
library DDS;
use DDS.dds_pkg.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_dds_gen is
end tb_dds_gen;

architecture tb of tb_dds_gen is
    -- Simulation Parameters --
    
    constant CLK_HPERIOD : time := 10 ns;
	signal test_wf : std_logic_vector(15 downto 0);
	
	type t_d256_w16 is array (0 to 255) of std_logic_vector(15 downto 0);

	constant sine_d256_w16 : t_d256_w16 := (
        x"8000", x"8324", x"8647", x"896a", x"8c8b", x"8fab", x"92c7", x"95e1",
        x"98f8", x"9c0b", x"9f19", x"a223", x"a527", x"a826", x"ab1f", x"ae10",
        x"b0fb", x"b3de", x"b6b9", x"b98c", x"bc56", x"bf17", x"c1cd", x"c47a",
        x"c71c", x"c9b3", x"cc3f", x"cebf", x"d133", x"d39a", x"d5f5", x"d842",
        x"da82", x"dcb3", x"ded7", x"e0eb", x"e2f1", x"e4e8", x"e6cf", x"e8a6",
        x"ea6d", x"ec23", x"edc9", x"ef5e", x"f0e2", x"f254", x"f3b5", x"f504",
        x"f641", x"f76b", x"f884", x"f989", x"fa7c", x"fb5c", x"fc29", x"fce3",
        x"fd89", x"fe1d", x"fe9c", x"ff09", x"ff61", x"ffa6", x"ffd8", x"fff5",
        x"ffff", x"fff5", x"ffd8", x"ffa6", x"ff61", x"ff09", x"fe9c", x"fe1d",
        x"fd89", x"fce3", x"fc29", x"fb5c", x"fa7c", x"f989", x"f884", x"f76b",
        x"f641", x"f504", x"f3b5", x"f254", x"f0e2", x"ef5e", x"edc9", x"ec23",
        x"ea6d", x"e8a6", x"e6cf", x"e4e8", x"e2f1", x"e0eb", x"ded7", x"dcb3",
        x"da82", x"d842", x"d5f5", x"d39a", x"d133", x"cebf", x"cc3f", x"c9b3",
        x"c71c", x"c47a", x"c1cd", x"bf17", x"bc56", x"b98c", x"b6b9", x"b3de",
        x"b0fb", x"ae10", x"ab1f", x"a826", x"a527", x"a223", x"9f19", x"9c0b",
        x"98f8", x"95e1", x"92c7", x"8fab", x"8c8b", x"896a", x"8647", x"8324",
        x"8000", x"7cdb", x"79b8", x"7695", x"7374", x"7054", x"6d38", x"6a1e",
        x"6707", x"63f4", x"60e6", x"5ddc", x"5ad8", x"57d9", x"54e0", x"51ef",
        x"4f04", x"4c21", x"4946", x"4673", x"43a9", x"40e8", x"3e32", x"3b85",
        x"38e3", x"364c", x"33c0", x"3140", x"2ecc", x"2c65", x"2a0a", x"27bd",
        x"257d", x"234c", x"2128", x"1f14", x"1d0e", x"1b17", x"1930", x"1759",
        x"1592", x"13dc", x"1236", x"10a1", x"0f1d", x"0dab", x"0c4a", x"0afb",
        x"09be", x"0894", x"077b", x"0676", x"0583", x"04a3", x"03d6", x"031c",
        x"0276", x"01e2", x"0163", x"00f6", x"009e", x"0059", x"0027", x"000a",
        x"0000", x"000a", x"0027", x"0059", x"009e", x"00f6", x"0163", x"01e2",
        x"0276", x"031c", x"03d6", x"04a3", x"0583", x"0676", x"077b", x"0894",
        x"09be", x"0afb", x"0c4a", x"0dab", x"0f1d", x"10a1", x"1236", x"13dc",
        x"1592", x"1759", x"1930", x"1b17", x"1d0e", x"1f14", x"2128", x"234c",
        x"257d", x"27bd", x"2a0a", x"2c65", x"2ecc", x"3140", x"33c0", x"364c",
        x"38e3", x"3b85", x"3e32", x"40e8", x"43a9", x"4673", x"4946", x"4c21",
        x"4f04", x"51ef", x"54e0", x"57d9", x"5ad8", x"5ddc", x"60e6", x"63f4",
        x"6707", x"6a1e", x"6d38", x"7054", x"7374", x"7695", x"79b8", x"7cdb"
    );


    -- Module Declarations --
	
    constant C_LUT_WIDTH   : integer := 16;
    constant C_LUT_DEPTH   : integer := 256;
    constant C_DA_WIDTH    : integer := 16;
	constant C_REG_ITF_EN  : integer := 0;
	constant C_INT_LUT_EN  : integer := 1;
	  
    constant REG_CTRL_ADDR    : std_logic_vector(1 downto 0) := "00";
    constant REG_TUNE_ADDR   : std_logic_vector(1 downto 0) := "01";
    constant REG_UNUSED0_ADDR   : std_logic_vector(1 downto 0) := "10";
    constant REG_UNUSED1_ADDR : std_logic_vector(1 downto 0) := "11";

    signal clk_sys_i   : std_logic;
    signal rst_sys_i   : std_logic;
    signal reg_sel_i   : std_logic;
    signal reg_addr_i  : std_logic_vector (1 downto 0);
    signal reg_data_i  : std_logic_vector (31 downto 0);
    signal reg_data_o  : std_logic_vector (31 downto 0);
    signal lut_sel_i   : std_logic;
    signal lut_addr_i  : std_logic_vector (clog2(C_LUT_DEPTH)-1 downto 0);
    signal lut_data_i  : std_logic_vector (C_LUT_WIDTH-1 downto 0);
    signal lut_data_o  : std_logic_vector (C_LUT_WIDTH-1 downto 0);
    signal reg_rwr_i   : std_logic;
    signal lut_rwr_i   : std_logic;
    signal dac_data_o  : std_logic_vector (C_DA_WIDTH-1 downto 0);
	signal dac_valid_o : std_logic;
	signal cycle_cnt_o : std_logic;
	signal ext_trig_i  : std_logic;
	signal ext_tune_i  : std_logic_vector(31 downto 0);
	signal ext_lut_addr_o : std_logic_vector(clog2(C_LUT_DEPTH)-1 downto 0);
	signal ext_lut_data_i : std_logic_vector(C_LUT_WIDTH-1 downto 0);
	signal ext_lut_ren_o  : std_logic;
    

begin

    DUT : entity DDS.dds_gen
     generic map (
					C_REG_ITF_EN => C_REG_ITF_EN,
					C_INT_LUT_EN => C_INT_LUT_EN,
                    C_LUT_WIDTH  => C_LUT_WIDTH,
                    C_LUT_DEPTH  => C_LUT_DEPTH,
                    C_DA_WIDTH   => C_DA_WIDTH
     )
    port map (clk_sys_i   => clk_sys_i,
              rst_sys_i   => rst_sys_i,
              reg_sel_i   => reg_sel_i,
              reg_addr_i  => reg_addr_i,
              reg_data_i  => reg_data_i,
              reg_data_o  => reg_data_o,
              lut_sel_i   => lut_sel_i,
              lut_addr_i  => lut_addr_i,
              lut_data_i  => lut_data_i,
              lut_data_o  => lut_data_o,
              reg_rwr_i   => reg_rwr_i,
              lut_rwr_i   => lut_rwr_i,
              dac_data_o  => dac_data_o,
			  dac_valid_o => dac_valid_o,
			  cycle_cnt_o => cycle_cnt_o,
			  ext_trig_i  => ext_trig_i,
			  ext_tune_i  => ext_tune_i,
			  ext_lut_addr_o => ext_lut_addr_o,
			  ext_lut_data_i => ext_lut_data_i,
			  ext_lut_ren_o  => ext_lut_ren_o);

    clock_gen : process
    begin
        while (true) loop
            clk_sys_i <= '0';
            wait for CLK_HPERIOD ;
            clk_sys_i <= '1';
            wait for CLK_HPERIOD ;
        end loop;
    end process;
	
    wf_gen : process
	variable i : integer range 0 to 255;
    begin
		while(true) loop
			test_wf <= sine_d256_w16(i);
			wait for 2*CLK_HPERIOD ;     
			i := (i + 1) MOD 256;
		end loop;
    end process;	
    
    stimuli : process
    
    procedure WriteReg( addr : in std_logic_vector(1 downto 0); data : in std_logic_vector(31 downto 0) ) is
        begin
            reg_addr_i <= addr;
            reg_data_i <= data;
            reg_sel_i <= '1';
            reg_rwr_i <= '1';       
            wait for 2*CLK_HPERIOD ;        
            reg_data_i <= ( others => '0' );
            reg_rwr_i <= '0';
            reg_sel_i <= '0';
    end procedure;
    
    
    procedure ReadReg( addr : in std_logic_vector(1 downto 0) ) is
        begin
            reg_addr_i <= addr;
            reg_sel_i <= '1';
            reg_rwr_i <= '0';       
            wait for 2*CLK_HPERIOD ;        
            reg_addr_i <= ( others => '0' );
            reg_rwr_i <= '0';
            reg_sel_i <= '0';
    end procedure;
    
    
    procedure CheckReg( addr : in std_logic_vector(1 downto 0); data: in std_logic_vector(31 downto 0)) is
        begin
            WriteReg(addr,data);
            wait for 2*CLK_HPERIOD ;        
            ReadReg(addr);
            assert reg_data_o = data
                report "RegisterCheck Fail at addr = " & integer'image(to_integer(unsigned(addr))) &
                       " expected data = " & integer'image(to_integer(unsigned(data))) & 
                       " found = " & integer'image(to_integer(unsigned(reg_data_o))) severity error;
                       
            report "RegisterCheck Success at addr = " & integer'image(to_integer(unsigned(addr))) severity note;
    end procedure;
	
	procedure WriteSine is
        begin
			lut_rwr_i <= '1';
			lut_sel_i <= '1';
			for i in 0 to C_LUT_DEPTH-1 loop
			
				lut_data_i <= sine_d256_w16(i);
				lut_addr_i <= std_logic_vector(to_unsigned(i,lut_addr_i'length));
				wait for 2*CLK_HPERIOD ;        

			end loop;
			lut_rwr_i <= '0';
			lut_sel_i <= '0';
			
    end procedure;
	
	procedure TEST_1 is
        begin
			-- EDIT Adapt initialization as needed
			reg_sel_i <= '0';
			ext_trig_i <= '0';
			ext_tune_i <= (others => '0');
			ext_lut_data_i <= (others => '0');
			reg_addr_i <= (others => '0');
			reg_data_i <= (others => '0');
			lut_sel_i <= '0';
			lut_addr_i <= (others => '0');
			lut_data_i <= (others => '0');
			reg_rwr_i <= '0';		
			lut_rwr_i <= '0';
	
			-- Reset generation
			rst_sys_i <= '1';
			wait for 100 ns;
			rst_sys_i <= '0';
			wait for 100 ns;
			-- EDIT Add stimuli here
			CheckReg(REG_CTRL_ADDR,X"10000000");
			wait for 2*CLK_HPERIOD ;        
			CheckReg(REG_TUNE_ADDR,X"20000000");
			wait for 2*CLK_HPERIOD ;        
			CheckReg(REG_UNUSED0_ADDR,X"40000000");
			wait for 2*CLK_HPERIOD ;        
			CheckReg(REG_UNUSED1_ADDR,X"80000000");
			wait for 2*CLK_HPERIOD ;      
	
			CheckReg(REG_CTRL_ADDR,X"00000000");
			wait for 2*CLK_HPERIOD ;        
			CheckReg(REG_TUNE_ADDR,X"00000000");
			wait for 2*CLK_HPERIOD ;        
			CheckReg(REG_UNUSED0_ADDR,X"00000000");
			wait for 2*CLK_HPERIOD ;        
			CheckReg(REG_UNUSED1_ADDR,X"00000000");
			wait for 2*CLK_HPERIOD ;     
			-- Write Sine Table into LUT --
			WriteSine;
			wait for 2*CLK_HPERIOD ;
			-- Write Tunning Word  and Start Synthesis --
			CheckReg(REG_TUNE_ADDR,X"00001004");
			wait for 2*CLK_HPERIOD ; 		
			CheckReg(REG_CTRL_ADDR,X"80000000");
			wait for 2*CLK_HPERIOD ;   	
			
    end procedure;
	
	procedure TEST_2 is
        begin
			-- EDIT Adapt initialization as needed
			reg_sel_i <= '0';
			ext_trig_i <= '0';
			ext_tune_i <= (others => '0');
			ext_lut_data_i <= (others => '0');
			reg_addr_i <= (others => '0');
			reg_data_i <= (others => '0');
			lut_sel_i <= '0';
			lut_addr_i <= (others => '0');
			lut_data_i <= (others => '0');
			reg_rwr_i <= '0';		
			lut_rwr_i <= '0';
	
			-- Reset generation
			rst_sys_i <= '1';
			wait for 100 ns;
			rst_sys_i <= '0';
			wait for 100 ns;
			-- Write Sine Table into LUT --
			WriteSine;
			wait for 2*CLK_HPERIOD ;
			-- Write Tunning Word  and Start Synthesis --
			ext_tune_i <= X"00001004";
			ext_trig_i <= '1';		
			wait for 2*CLK_HPERIOD ;
			
    end procedure;
	
    begin
		TEST_2;
        wait;
    end process;

end tb;
