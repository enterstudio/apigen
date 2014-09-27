require './lib/endpoint.rb'
require './lib/lang/parser.tab.rb'
require './lib/lang/nodes.rb'
require './lib/lang/path_param.rb'
require './lib/lang/header.rb'
require './lib/lang/query_param.rb'
require './lib/lang/request_param.rb'

class ApigenCompiler

  def initialize()
    @parser = Parser.new
  end

  def compile(code)
    nodes = @parser.parse(code)
    url_method_node = nodes.url_method
    method = HttpMethod.create(url_method_node.method.to_sym)
    url = url_method_node.url
    name = nodes.name_node.name
    endpoint = Endpoint.new url: url, method: method, name: name

    nodes.query_nodes.each do |query_node|
      type = query_node.type.type
      endpoint.put_query_param(QueryParam.new name: query_node.name, type: type)
    end

    nodes.path_nodes.each do |path_nodes|
      type = path_nodes.type.type
      endpoint.put_path_param(PathParam.new name: path_nodes.name, type: type)
    end

    nodes.header_nodes.each do |header_node|
      endpoint.put_header(Header.new name: header_node.name, value: header_node.value)
    end

    return endpoint
  end

end
