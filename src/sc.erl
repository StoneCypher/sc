
-module(sc).



-export([

  % Module exports for sc_list:
  between/2,
  extrema/1,
  foldl0/2,
  foldr0/2,
  implode/2,
  key_duplicate/1,
  max/1,
  min/1,

  % Module exports for sc_math:
  absolute_difference/2,
  ceil/1,
  ceiling/1,
  distance/2,
  eq_within/3,
  floor/1,
  gcd/2,
  gcd_i/2,
  lcm/2,
  list_product/1,
  list_product/2,
  range_scale/1,

  % Module exports for crap_json:
  escape_char/1,
  escape_string/1,
  test/0,
  test/1,
  to_json/1,

  % Module exports for sc_anscombes_quartet:
  aq/0,

  % Module exports for sc_fisher_iris:
  class/0,
  data/0,
  labels/0

]).



% Module forwards for sc_list:
between(A1,A2)    -> sc_list:between(A1,A2).
extrema(A1)       -> sc_list:extrema(A1).
foldl0(A1,A2)     -> sc_list:foldl0(A1,A2).
foldr0(A1,A2)     -> sc_list:foldr0(A1,A2).
implode(A1,A2)    -> sc_list:implode(A1,A2).
key_duplicate(A1) -> sc_list:key_duplicate(A1).
max(A1)           -> sc_list:max(A1).
min(A1)           -> sc_list:min(A1).

% Module forwards for sc_math:
absolute_difference(A1,A2) -> sc_math:absolute_difference(A1,A2).
ceil(A1)                   -> sc_math:ceil(A1).
ceiling(A1)                -> sc_math:ceiling(A1).
distance(A1,A2)            -> sc_math:distance(A1,A2).
eq_within(A1,A2,A3)        -> sc_math:eq_within(A1,A2,A3).
floor(A1)                  -> sc_math:floor(A1).
gcd(A1,A2)                 -> sc_math:gcd(A1,A2).
gcd_i(A1,A2)               -> sc_math:gcd_i(A1,A2).
lcm(A1,A2)                 -> sc_math:lcm(A1,A2).
list_product(A1)           -> sc_math:list_product(A1).
list_product(A1,A2)        -> sc_math:list_product(A1,A2).
range_scale(A1)            -> sc_math:range_scale(A1).

% Module forwards for crap_json:
escape_char(A1)   -> crap_json:escape_char(A1).
escape_string(A1) -> crap_json:escape_string(A1).
test()            -> crap_json:test().
test(A1)          -> crap_json:test(A1).
to_json(A1)       -> crap_json:to_json(A1).

% Module forwards for sc_anscombes_quartet:
aq() -> sc_anscombes_quartet:aq().

% Module forwards for sc_fisher_iris:
class()  -> sc_fisher_iris:class().
data()   -> sc_fisher_iris:data().
labels() -> sc_fisher_iris:labels().
