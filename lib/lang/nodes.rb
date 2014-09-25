class Nodes < Struct.new :nodes; end

class TypeNode < Struct.new :type, :required; end

class QueryNode < Struct.new :type, :name; end

class HeaderNode < Struct.new :name, :value; end

class UrlMethod < Struct.new :method, :url; end

class PathParam < Struct.new :type, :name; end

