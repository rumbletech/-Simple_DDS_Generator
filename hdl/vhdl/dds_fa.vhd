library IEEE;
library DDS;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use DDS.dds_pkg.all;

entity dds_fa is
  port (
	A_i : in  std_logic;
	B_i : in  std_logic;
	C_i : in  std_logic;
	C_o : out std_logic;
	S_o : out std_logic
  );
end entity dds_fa;

architecture implementation of dds_fa is
begin

C_o <= ( A_i and B_i ) or (( A_i or B_i ) and C_i);
S_o <= A_i xor B_i xor C_i;

end architecture implementation;