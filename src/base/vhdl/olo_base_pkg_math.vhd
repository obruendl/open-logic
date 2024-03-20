------------------------------------------------------------------------------
--  Copyright (c) 2018 by Paul Scherrer Institute, Switzerland
--  Copyright (c) 2024 by Oliver Bründler
--  All rights reserved.
--  Authors: Oliver Bruendler, Benoit Stef
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Description
------------------------------------------------------------------------------
-- Package containing mathematchis functions


------------------------------------------------------------------------------
-- Libraries
------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.math_real.all;

library work;
    use work.olo_base_pkg_array.all;

------------------------------------------------------------------------------
-- Package Header
------------------------------------------------------------------------------
package olo_base_pkg_math is

    function log2(arg : in natural) return natural;

    function log2ceil(arg : in natural) return natural;

    function isPower2(arg : in natural) return boolean;

    function max(a : in integer;
                 b : in integer) return integer;

    function min(a : in integer;
                 b : in integer) return integer;

    function max(a : in real;
                 b : in real) return real;

    function min(a : in real;
                 b : in real) return real;

    -- choose t if s=true else f
    function choose(s : in boolean;
                    t : in std_logic;
                    f : in std_logic) return std_logic;

    function choose(s : in boolean;
                    t : in std_logic_vector;
                    f : in std_logic_vector) return std_logic_vector;

    function choose(s : in boolean;
                    t : in integer;
                    f : in integer) return integer;

    function choose(s : in boolean;
                    t : in string;
                    f : in string) return string;

    function choose(s : in boolean;
                    t : in real;
                    f : in real) return real;

    function choose(s : in boolean;
                    t : in unsigned;
                    f : in unsigned) return unsigned;

    function choose(s : in boolean;
                    t : in boolean;
                    f : in boolean) return boolean;

    function choose(s : in boolean;
                    t : in t_areal;
                    f : in t_areal) return t_areal;

    -- count occurence of a value inside an array
    function count(a : in t_ainteger;
                   v : in integer) return integer;

    function count(a : in t_abool;
                   v : in boolean) return integer;

    function count(a : in std_logic_vector;
                   v : in std_logic) return integer;

    -- conversion function int to slv
    function toUslv(input : integer;
                    len   : integer) return std_logic_vector;

    function toSslv(input : integer;
                    len   : integer) return std_logic_vector;

    function toStdl(input : integer range 0 to 1) return std_logic;

    -- conversion function slv to int
    function fromUslv(input : std_logic_vector) return integer;

    function fromSslv(input : std_logic_vector) return integer;

    function fromStdl(input : std_logic) return integer;

    -- convert string to real
    function fromString(input : string) return real;

    -- convert string  to real array
    function fromString(input : string) return t_areal;


    -- get max/min from array type interger /real
    function maxArray(a : in t_ainteger) return integer;

    function maxArray(a : in t_areal) return real;

    function minArray(a : in t_ainteger) return integer;

    function minArray(a : in t_areal) return real;

end package;

------------------------------------------------------------------------------
-- Package Body
------------------------------------------------------------------------------
package body olo_base_pkg_math is

    -- *************************************************************************
    -- Helpers
    -- *************************************************************************
    -- Coun the number of elements in a array string (separated by ",")
    function count_array_str_elements(input : string) return natural is
        variable count : natural := 1;
        variable idx   : integer := input'low;
    begin
        while idx <= input'high loop
            if input(idx) = ',' then
                count := count + 1;
            end if;
            idx := idx + 1;
        end loop;
        return count;
    end function;

    -- *************************************************************************
    -- Public Functions
    -- *************************************************************************

    -- *** Log2 integer ***
    function log2(arg : in natural) return natural is
        variable v : natural := arg;
        variable r : natural := 0;
    begin
        while v > 1 loop
            v := v / 2;
            r := r + 1;
        end loop;
        return r;
    end function;

    -- *** Log2Ceil integer ***
    function log2ceil(arg : in natural) return natural is
    begin
        if arg = 0 then
            return 0;
        end if;
        return log2(arg * 2 - 1);
    end function;

    -- *** isPower2 ***
    function isPower2(arg : in natural) return boolean is
    begin
        if log2(arg) = log2ceil(arg) then
            return true;
        else
            return false;
        end if;
    end function;

    -- *** Max ***
    function max(a : in integer;
                 b : in integer) return integer is
    begin
        if a > b then
            return a;
        else
            return b;
        end if;
    end function;

    function max(a : in real;
                 b : in real) return real is
    begin
        if a > b then
            return a;
        else
            return b;
        end if;
    end function;

    -- *** Min ***
    function min(a : in integer;
                 b : in integer) return integer is
    begin
        if a > b then
            return b;
        else
            return a;
        end if;
    end function;

    function min(a : in real;
                 b : in real) return real is
    begin
        if a > b then
            return b;
        else
            return a;
        end if;
    end function;

    -- *** Choose (std_logic) ***
    function choose(s : in boolean;
                    t : in std_logic;
                    f : in std_logic) return std_logic is
    begin
        if s then
            return t;
        else
            return f;
        end if;
    end function;

    -- *** Choose (std_logic_vector) ***
    function choose(s : in boolean;
                    t : in std_logic_vector;
                    f : in std_logic_vector) return std_logic_vector is
    begin
        if s then
            return t;
        else
            return f;
        end if;
    end function;

    -- *** Choose (integer) ***
    function choose(s : in boolean;
                    t : in integer;
                    f : in integer) return integer is
    begin
        if s then
            return t;
        else
            return f;
        end if;
    end function;

    -- *** Choose (string) ***
    function choose(s : in boolean;
                    t : in string;
                    f : in string) return string is
    begin
        if s then
            return t;
        else
            return f;
        end if;
    end function;

    -- *** Choose (real) ***
    function choose(s : in boolean;
                    t : in real;
                    f : in real) return real is
    begin
        if s then
            return t;
        else
            return f;
        end if;
    end function;

    -- *** Choose (unsigned) ***
    function choose(s : in boolean;
                    t : in unsigned;
                    f : in unsigned) return unsigned is
    begin
        if s then
            return t;
        else
            return f;
        end if;
    end function;

    -- *** Choose (boolean) ***
    function choose(s : in boolean;
                    t : in boolean;
                    f : in boolean) return boolean is
    begin
        if s then
            return t;
        else
            return f;
        end if;
    end function;

    -- *** Choose (t_areal) ***
    function choose(s : in boolean;
                    t : in t_areal;
                    f : in t_areal) return t_areal is
    begin
        if s then
            return t;
        else
            return f;
        end if;
    end function;

    -- *** count (integer) ***
    function count(a : in t_ainteger;
                   v : in integer) return integer is
        variable cnt_v : integer := 0;
    begin
        for idx in a'low to a'high loop
            if a(idx) = v then
                cnt_v := cnt_v + 1;
            end if;
        end loop;
        return cnt_v;
    end function;

    -- *** count (bool) ***
    function count(a : in t_abool;
                   v : in boolean) return integer is
        variable cnt_v : integer := 0;
    begin
        for idx in a'low to a'high loop
            if a(idx) = v then
                cnt_v := cnt_v + 1;
            end if;
        end loop;
        return cnt_v;
    end function;

    -- *** count (std_logic) ***
    function count(a : in std_logic_vector;
                   v : in std_logic) return integer is
        variable cnt_v : integer := 0;
    begin
        for idx in a'low to a'high loop
            if a(idx) = v then
                cnt_v := cnt_v + 1;
            end if;
        end loop;
        return cnt_v;
    end function;

    -- *** integer to unsigned slv  ***
    function toUslv(input : integer;
                    len   : integer) return std_logic_vector is
    begin
        return std_logic_vector(to_unsigned(input, len));
    end function;

    -- *** integer to signed slv  ***
    function toSslv(input : integer;
                    len   : integer) return std_logic_vector is
    begin
        return std_logic_vector(to_signed(input, len));
    end function;

    -- *** integer to stdl ***
    function toStdl(input : integer range 0 to 1) return std_logic is
    begin
        if input = 1 then
            return '1';
        else
            return '0';
        end if;
    end function;

    -- *** integer from unsigned slv  ***
    function fromUslv(input : std_logic_vector) return integer is
    begin
        return to_integer(unsigned(input));
    end function;

    -- *** integer from signed slv  ***
    function fromSslv(input : std_logic_vector) return integer is
    begin
        return to_integer(signed(input));
    end function;

    -- *** integer from stdl ***
    function fromStdl(input : std_logic) return integer is
    begin
        assert input = '0' or input = '1' report "fromStdl(): Illegal argument" severity error;
        if input = '0' then
            return 0;
        else
            return 1;
        end if;
    end function;

    -- convert string to real
    function fromString(input : string) return real is
        constant Nbsp_c       : character := character'val(160);
        variable Idx_v        : integer   := input'low;
        variable IsNeg_v      : boolean   := false;
        variable ValInt_v     : integer   := 0;
        variable ValFrac_v    : real      := 0.0;
        variable FracDigits_v : integer   := 0;
        variable Exp_v        : integer   := 0;
        variable ExpNeg_v     : boolean   := false;
        variable ValAbs_v     : real      := 0.0;
    begin
        -- skip leading white-spaces (space, non-breaking space or horizontal tab)
        while (Idx_v <= input'high) and (input(Idx_v) = ' ' or input(Idx_v) = Nbsp_c or input(Idx_v) = HT) loop
            Idx_v := Idx_v + 1;
        end loop;

        -- Check sign
        if (Idx_v <= input'high) and ((input(Idx_v) = '-') or (input(Idx_v) = '+')) then
            IsNeg_v := (input(Idx_v) = '-');
            Idx_v   := Idx_v + 1;
        end if;

        -- Parse Integer
        while (Idx_v <= input'high) and (input(Idx_v) <= '9') and (input(Idx_v) >= '0') loop
            ValInt_v := ValInt_v * 10 + (character'pos(input(Idx_v)) - character'pos('0'));
            Idx_v    := Idx_v + 1;
        end loop;

        -- Check decimal point
        if (Idx_v <= input'high) then
            if input(Idx_v) = '.' then
                Idx_v := Idx_v + 1;

                -- Parse Fractional
                while (Idx_v <= input'high) and (input(Idx_v) <= '9') and (input(Idx_v) >= '0') loop
                    ValFrac_v    := ValFrac_v * 10.0 + real((character'pos(input(Idx_v)) - character'pos('0')));
                    FracDigits_v := FracDigits_v + 1;
                    Idx_v        := Idx_v + 1;
                end loop;
            end if;
        end if;

        -- Check exponent
        if (Idx_v <= input'high) then
            if (input(Idx_v) = 'E') or (input(Idx_v) = 'e') then
                Idx_v := Idx_v + 1;
                -- Check sign
                if (Idx_v <= input'high) and ((input(Idx_v) = '-') or (input(Idx_v) = '+')) then
                    ExpNeg_v := (input(Idx_v) = '-');
                    Idx_v    := Idx_v + 1;
                end if;

                -- Parse Integer
                while (Idx_v <= input'high) and (input(Idx_v) <= '9') and (input(Idx_v) >= '0') loop
                    Exp_v := Exp_v * 10 + (character'pos(input(Idx_v)) - character'pos('0'));
                    Idx_v := Idx_v + 1;
                end loop;
                if ExpNeg_v then
                    Exp_v := -Exp_v;
                end if;
            end if;
        end if;

        -- Return
        ValAbs_v := (real(ValInt_v) + ValFrac_v / 10.0**real(FracDigits_v)) * 10.0**real(Exp_v);
        if IsNeg_v then
            return -ValAbs_v;
        else
            return ValAbs_v;
        end if;
    end function;

    -- convert string to real array
    function fromString(input : string) return t_areal is
        variable arr      : t_areal(0 to count_array_str_elements(input) - 1) := (others => 0.0);
        variable aIdx     : natural                                           := 0;
        variable startIdx : natural                                           := 1;
        variable endIdx   : natural                                           := 1;
        variable idx      : natural                                           := input'low;
    begin
        while idx <= input'high loop
            if input(idx) = ',' then
                endIdx    := idx - 1;
                arr(aIdx) := fromString(input(startIdx to endIdx));
                aIdx      := aIdx + 1;
                startIdx  := idx + 1;
            end if;
            idx := idx + 1;
        end loop;
        if startIdx <= input'high then
            arr(aIdx) := fromString(input(startIdx to input'high));
        end if;
        return arr;
    end function;

    --*** get the maximum out of an array of integer ***
    function maxArray(a : in t_ainteger) return integer is
        variable max_v : integer := 0;
    begin
        for idx in a'low to a'high loop
            if max(max_v, a(idx)) > max_v then
                max_v := a(idx);
            end if;
        end loop;
        return max_v;
    end function;

    --*** get the maximum out of an array of real ***
    function maxArray(a : in t_areal) return real is
        variable max_v : real := 0.0;
    begin
        for idx in a'low to a'high loop
            if max(max_v, a(idx)) > max_v then
                max_v := a(idx);
            end if;
        end loop;
        return max_v;
    end function;

    --*** get the minimum out of an array of integer ***
    function minArray(a : in t_ainteger) return integer is
        variable min_v : integer := 0;
    begin
        for idx in a'low to a'high loop
            if min(min_v, a(idx)) < min_v then
                min_v := a(idx);
            end if;
        end loop;
        return min_v;
    end function;

    --*** get the minimum out of an array of real ***
    function minArray(a : in t_areal) return real is
        variable min_v : real := 0.0;
    begin
        for idx in a'low to a'high loop
            if min(min_v, a(idx)) < min_v then
                min_v := a(idx);
            end if;
        end loop;
        return min_v;
    end function;

end olo_base_pkg_math;
