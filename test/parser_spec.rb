require 'minitest/autorun'
require './lib/lang/parser.tab.rb'

describe Parser do

  before :each do
    @parser = Parser.new
  end

  describe "parse" do

    it "should recognize the empty program" do
      @parser.parse("").must_equal Nodes.new []
    end

    it "should recognize {method} {url}" do
      nodes = Nodes.new([UrlMethod.new("get", "/users/{user_id}/{name}/show/foo")])
      @parser.parse("get /users/{user_id}/{name}/show/foo").must_equal nodes
    end

    it "should recognize path params" do
      code = """
        post /users/{user_id}/foo/bar/{baz}
        @path {string} user_id
        @path {boolean:optional} baz
      """
      nodes = Nodes.new([
        UrlMethod.new("post","/users/{user_id}/foo/bar/{baz}"), [
          [PathNode.new(TypeNode.new("string", true), "user_id")],
          [PathNode.new(TypeNode.new("boolean", false), "baz")]
        ]
      ])
      @parser.parse(code).must_equal nodes
    end

    it "should recognize single path params" do
      code = """
      delete /users/{id}
      @path {int} id
      """
      nodes = Nodes.new [
        UrlMethod.new("delete", "/users/{id}"), [
          [PathNode.new(TypeNode.new("int", true), "id")]
        ]
      ]
      @parser.parse(code).must_equal nodes
    end

  end

end