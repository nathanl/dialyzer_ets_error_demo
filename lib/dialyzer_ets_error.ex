defmodule DialyzerEtsError do
  @moduledoc """
  Documentation for `DialyzerEtsError`.
  """

  @spec table_exists?(name :: atom()) :: boolean()
  def table_exists?(name) when is_atom(name) do
    # because of the code
    #
    # `-opaque tid()         :: reference().`
    # in https://github.com/erlang/otp/blob/8e62b1781a8083301aae272162946414d9af4906/lib/stdlib/src/ets.erl#L57
    #
    # this code produces
    #
    # lib/dialyzer_ets_error.ex:7:no_return
    # Function table_exists?/1 has no local return.
    # ________________________________________________________________________________
    # Please file a bug in https://github.com/jeremyjh/dialyxir/issues with this message.
    #
    # Unknown error occurred: %FunctionClauseError{args: nil, arity: 1, clauses: nil, function: :format_long, kind: nil, module: Dialyxir.Warnings.OpaqueTypeTest}
    #
    #
    # Legacy warning:
    # lib/dialyzer_ets_error.ex:9: The type test is_reference('undefined' | ets:tid()) breaks the opacity of the term 'undefined' | ets:tid()
    name
    |> :ets.whereis()
    |> is_reference()

    # Dialyzer likes this OK
    # :ets.whereis(name) != :undefined
  end
end
