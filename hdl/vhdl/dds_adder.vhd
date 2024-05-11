library IEEE;
library DDS;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use DDS.dds_pkg.all;

entity dds_adder is
 generic (
    C_VEC_SIZE : INTEGER := 64
  );	
  port (
	A_i : in  std_logic_vector(C_VEC_SIZE-1 downto 0);
	B_i : in  std_logic_vector(C_VEC_SIZE-1 downto 0);
	C_i : in  std_logic;
	C_o : out std_logic;
	S_o : out std_logic_vector(C_VEC_SIZE-1 downto 0)
  );
end entity dds_adder;

architecture implementation of dds_adder is

signal C_p : std_logic_vector(C_VEC_SIZE downto 0) := ( others => '0' );

begin

C_p(0) <= C_i;
C_o <= C_p(C_VEC_SIZE);

FA_GEN : for i in 0 to C_VEC_SIZE-1 generate begin
    FA: entity DDS.dds_fa
    port map (
		A_i 	=> 	A_i(i),
		B_i 	=> 	B_i(i),
		C_i 	=> 	C_p(i),
		C_o 	=> 	C_p(i+1),
		S_o 	=> 	S_o(i)
    );	
end generate FA_GEN;

end architecture implementation;