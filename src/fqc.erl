-module(fqc).

-export([not_empty/1, maybe_oneof/2, non_blank_string/0]).

not_empty(G) ->
    ?SUCHTHAT(X, G, X /= [] andalso X /= <<>>).

non_blank_string() ->
    not_empty(?LET(X,list(lower_char()), list_to_binary(X))).

%% Generate a lower 7-bit ACSII character that should not cause any problems
%% with utf8 conversion.
lower_char() ->
    %%choose(16#20, 16#7f).
    choose($a, $z).

maybe_oneof(L, T) ->
    ?LET(E, ?SUCHTHAT(E, T, not lists:member(E, L)), oneof([E | L])).
