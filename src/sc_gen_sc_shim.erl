
-module(sc_gen_sc_shim).





-export([

    arg_list/1

]).





arg_list(N) ->

    sc_list:implode(",", [ "A" ++ integer_to_list(I) || I <- lists:seq(1, N) ]).
