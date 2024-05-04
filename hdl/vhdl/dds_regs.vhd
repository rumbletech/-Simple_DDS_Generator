-- VHDL entity declaration
entity YourEntityName is
  generic (
    -- Declare your generics here
    GENERIC_NAME_1  : data_type_1 := default_value_1;
    GENERIC_NAME_2  : data_type_2 := default_value_2;
    -- Add more generics as needed
  );
  port (
    -- Declare your ports here
    PORT_NAME_1 : in  data_type_1;
    PORT_NAME_2 : out data_type_2;
    -- Add more ports as needed
  );
end entity YourEntityName;

-- VHDL architecture definition
architecture YourArchitectureName of YourEntityName is
  -- Declare your internal signals and variables here
  
begin
  -- Write your architecture implementation here
  
end architecture YourArchitectureName;