-module(gleam@regexp).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([compile/2, from_string/1, check/2, split/2, scan/2, replace/3]).
-export_type([regexp/0, match/0, compile_error/0, options/0]).

-type regexp() :: any().

-type match() :: {match, binary(), list(gleam@option:option(binary()))}.

-type compile_error() :: {compile_error, binary(), integer()}.

-type options() :: {options, boolean(), boolean()}.

-file("/Users/louis/src/gleam/regexp/src/gleam/regexp.gleam", 56).
-spec compile(binary(), options()) -> {ok, regexp()} | {error, compile_error()}.
compile(Pattern, Options) ->
    gleam_regexp_ffi:compile(Pattern, Options).

-file("/Users/louis/src/gleam/regexp/src/gleam/regexp.gleam", 93).
-spec from_string(binary()) -> {ok, regexp()} | {error, compile_error()}.
from_string(Pattern) ->
    compile(Pattern, {options, false, false}).

-file("/Users/louis/src/gleam/regexp/src/gleam/regexp.gleam", 112).
-spec check(regexp(), binary()) -> boolean().
check(Regexp, String) ->
    gleam_regexp_ffi:check(Regexp, String).

-file("/Users/louis/src/gleam/regexp/src/gleam/regexp.gleam", 130).
-spec split(regexp(), binary()) -> list(binary()).
split(Regexp, String) ->
    gleam_regexp_ffi:split(Regexp, String).

-file("/Users/louis/src/gleam/regexp/src/gleam/regexp.gleam", 190).
-spec scan(regexp(), binary()) -> list(match()).
scan(Regexp, String) ->
    gleam_regexp_ffi:scan(Regexp, String).

-file("/Users/louis/src/gleam/regexp/src/gleam/regexp.gleam", 216).
-spec replace(regexp(), binary(), binary()) -> binary().
replace(Pattern, String, Substitute) ->
    gleam_regexp_ffi:replace(Pattern, String, Substitute).
