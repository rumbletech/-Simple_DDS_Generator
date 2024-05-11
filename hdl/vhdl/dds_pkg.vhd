library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

package dds_pkg is

  function clog2(input : natural) return natural; 
  
end package dds_pkg;

package body dds_pkg is

  function clog2(input : natural) return natural is
    variable result : natural := 0;
  begin
    if input = 0 then
      return 0;
    else
      result := integer(ceil(log2(real(input))));
      return result;
    end if;
  end function clog2;

end package body dds_pkg;