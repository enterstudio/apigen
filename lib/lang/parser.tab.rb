#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.12
# from Racc grammer file "".
#

require 'racc/parser.rb'


  require "./lib/lang/nodes.rb"
  require "./lib/lang/lexer.rb"

class Parser < Racc::Parser

module_eval(<<'...end parser.y/module_eval...', 'parser.y', 61)

  def parse(code, show_tokens=false)
    puts "parsing"
    @tokens = Lexer.new.tokenize(code) # Tokenize the code using our lexer
    puts @tokens.inspect if show_tokens
    do_parse # Kickoff the parsing process
  end

  def next_token
    @tokens = [] unless @tokens
    @tokens.shift
  end
...end parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    12,    11,    13,    12,    11,    13,    26,    25,    20,    15,
     4,    17,    17,    14,    21,    22,    23,    24,     5,    27,
    28 ]

racc_action_check = [
     3,     3,     3,     6,     6,     6,    21,    21,    13,     5,
     0,    11,    12,     4,    17,    18,    19,    20,     1,    26,
    27 ]

racc_action_pointer = [
     2,    18,   nil,    -3,     4,     9,     0,   nil,   nil,   nil,
   nil,     0,     1,    -4,   nil,   nil,   nil,     2,     3,     4,
     5,    -4,   nil,   nil,   nil,   nil,    13,     9,   nil ]

racc_action_default = [
    -1,   -16,    -2,    -3,   -16,   -16,    -4,    -5,    -7,    -8,
    -9,   -16,   -16,   -16,   -15,    29,    -6,   -16,   -16,   -16,
   -16,   -16,   -12,   -13,   -14,   -10,   -16,   -16,   -11 ]

racc_goto_table = [
     7,    18,    19,    16,     6,     3,     2,     1 ]

racc_goto_check = [
     5,     9,     9,     5,     4,     3,     2,     1 ]

racc_goto_pointer = [
   nil,     7,     6,     5,     1,    -3,   nil,   nil,   nil,   -10 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,     8,     9,    10,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 14, :_reduce_1,
  1, 14, :_reduce_2,
  1, 15, :_reduce_none,
  2, 15, :_reduce_none,
  1, 17, :_reduce_none,
  2, 17, :_reduce_none,
  1, 18, :_reduce_none,
  1, 18, :_reduce_none,
  1, 18, :_reduce_none,
  3, 22, :_reduce_10,
  5, 22, :_reduce_11,
  3, 19, :_reduce_12,
  3, 20, :_reduce_13,
  3, 21, :_reduce_14,
  2, 16, :_reduce_15 ]

racc_reduce_n = 16

racc_shift_n = 29

racc_token_table = {
  false => 0,
  :error => 1,
  :PARAM => 2,
  :QUERY => 3,
  :PATH => 4,
  :HEADER => 5,
  :OPTIONAL => 6,
  :TYPE => 7,
  :METHOD => 8,
  :URL => 9,
  :COLON => 10,
  :BRACE => 11,
  :IDENTIFIER => 12 }

racc_nt_base = 13

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "PARAM",
  "QUERY",
  "PATH",
  "HEADER",
  "OPTIONAL",
  "TYPE",
  "METHOD",
  "URL",
  "COLON",
  "BRACE",
  "IDENTIFIER",
  "$start",
  "program",
  "expressions",
  "method_with_url",
  "param_list",
  "param",
  "path_param",
  "query_param",
  "header_param",
  "type_structure" ]

Racc_debug_parser = true

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'parser.y', 20)
  def _reduce_1(val, _values, result)
     result = Nodes.new([]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 21)
  def _reduce_2(val, _values, result)
     result = val[0] 
    result
  end
.,.,

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

module_eval(<<'.,.,', 'parser.y', 37)
  def _reduce_10(val, _values, result)
     result = TypeNode.new val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 38)
  def _reduce_11(val, _values, result)
     result = TypeNode.new [1], [3] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 41)
  def _reduce_12(val, _values, result)
     result = PathParam.new(val[1], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 44)
  def _reduce_13(val, _values, result)
     result = QueryNode.new(val[1], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 47)
  def _reduce_14(val, _values, result)
     result = HeaderNode.new(val[1], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 50)
  def _reduce_15(val, _values, result)
     result = UrlMethod.new :method, :url 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser
