require_relative './header.rb'
require_relative './method.rb'
require_relative './path_param.rb'
require_relative './query_param.rb'

class Endpoint

  # the type of request, can be one of
  # :simple, :multipart or :form_url_encoded
  attr_reader :request_type

  # The method or http verb, an instance of Method
  attr_reader :method

  # The request url. It can contain path params.
  # Example: /users/{{user_id}}/show
  attr_reader :url

  # Path params are obtained by parsing the url.
  # All params are delimited by {{ and }} so for example
  # /users/{{user_id}}/cars/{{car_id}}/show has 2 path_params
  # the first one is user_id and the second one is car_id
  # TODO: Implement type enforcing
  # You can optionally enforce the path_param's type using the
  # following syntax {{param_name:type}} where type can be one of
  # string, int, float, double or boolean
  attr_reader :path_params

  # Url params are those that belong to the url in the form of queries
  # i.e. /users?user_name=bob contains the user_name query param
  attr_reader :query_params

  # An array of Header objects, each header is an http header key/value pair
  attr_reader :headers

  # a readable identifier for this endpoint (in underscored_lower_case format)
  # i.e. register_users
  attr_reader :name

  # A map of parameters
  attr_reader :request_params

  # Initializes a new endpoint
  # @param {String} name
  # @param {String} url
  # @param {Method} method the http method
  def initialize(name: require_name, url: require_url, method: Method.get)

    @name = name
    @url = url
    @method = method

    @path_params = PathParam.fromUrl(@url)
    @query_params = {}
    @headers = {}
    @fields = {}

  end

  def put_field(field, type = :string)
    raise ArgumentError, "field #{field} must be of type String" unless String == field.class
    @fields[field] = type
  end

  def put_header(header, value)
    @headers[header] = value
  end

  def put_query(name, value)
    @query_params[name] = value
  end

end

