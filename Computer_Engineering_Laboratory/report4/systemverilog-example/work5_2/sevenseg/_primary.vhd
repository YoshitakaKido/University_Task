library verilog;
use verilog.vl_types.all;
entity sevenseg is
    port(
        data            : in     vl_logic_vector(3 downto 0);
        segments        : out    vl_logic_vector(6 downto 0)
    );
end sevenseg;
