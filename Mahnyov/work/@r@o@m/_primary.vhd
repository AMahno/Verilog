library verilog;
use verilog.vl_types.all;
entity ROM is
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end ROM;
