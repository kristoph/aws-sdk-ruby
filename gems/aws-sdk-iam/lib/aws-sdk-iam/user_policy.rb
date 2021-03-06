# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/master/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws::IAM
  class UserPolicy

    extend Aws::Deprecations

    # @overload def initialize(user_name, name, options = {})
    #   @param [String] user_name
    #   @param [String] name
    #   @option options [Client] :client
    # @overload def initialize(options = {})
    #   @option options [required, String] :user_name
    #   @option options [required, String] :name
    #   @option options [Client] :client
    def initialize(*args)
      options = Hash === args.last ? args.pop.dup : {}
      @user_name = extract_user_name(args, options)
      @name = extract_name(args, options)
      @data = options.delete(:data)
      @client = options.delete(:client) || Client.new(options)
    end

    # @!group Read-Only Attributes

    # @return [String]
    def user_name
      @user_name
    end

    # @return [String]
    def name
      @name
    end
    alias :policy_name :name

    # The policy document.
    # @return [String]
    def policy_document
      data.policy_document
    end

    # @!endgroup

    # @return [Client]
    def client
      @client
    end

    # Loads, or reloads {#data} for the current {UserPolicy}.
    # Returns `self` making it possible to chain methods.
    #
    #     user_policy.reload.data
    #
    # @return [self]
    def load
      resp = @client.get_user_policy(
        user_name: @user_name,
        policy_name: @name
      )
      @data = resp.data
      self
    end
    alias :reload :load

    # @return [Types::GetUserPolicyResponse]
    #   Returns the data for this {UserPolicy}. Calls
    #   {Client#get_user_policy} if {#data_loaded?} is `false`.
    def data
      load unless @data
      @data
    end

    # @return [Boolean]
    #   Returns `true` if this resource is loaded.  Accessing attributes or
    #   {#data} on an unloaded resource will trigger a call to {#load}.
    def data_loaded?
      !!@data
    end

    # @!group Actions

    # @example Request syntax with placeholder values
    #
    #   user_policy.delete()
    # @param [Hash] options ({})
    # @return [EmptyStructure]
    def delete(options = {})
      options = options.merge(
        user_name: @user_name,
        policy_name: @name
      )
      resp = @client.delete_user_policy(options)
      resp.data
    end

    # @example Request syntax with placeholder values
    #
    #   user_policy.put({
    #     policy_document: "policyDocumentType", # required
    #   })
    # @param [Hash] options ({})
    # @option options [required, String] :policy_document
    #   The policy document.
    #
    #   The [regex pattern][1] used to validate this parameter is a string of
    #   characters consisting of any printable ASCII character ranging from
    #   the space character (\\u0020) through end of the ASCII character range
    #   as well as the printable characters in the Basic Latin and Latin-1
    #   Supplement character set (through \\u00FF). It also includes the
    #   special characters tab (\\u0009), line feed (\\u000A), and carriage
    #   return (\\u000D).
    #
    #
    #
    #   [1]: http://wikipedia.org/wiki/regex
    # @return [EmptyStructure]
    def put(options = {})
      options = options.merge(
        user_name: @user_name,
        policy_name: @name
      )
      resp = @client.put_user_policy(options)
      resp.data
    end

    # @!group Associations

    # @return [User]
    def user
      User.new(
        name: @user_name,
        client: @client
      )
    end

    # @deprecated
    # @api private
    def identifiers
      {
        user_name: @user_name,
        name: @name
      }
    end
    deprecated(:identifiers)

    private

    def extract_user_name(args, options)
      value = args[0] || options.delete(:user_name)
      case value
      when String then value
      when nil then raise ArgumentError, "missing required option :user_name"
      else
        msg = "expected :user_name to be a String, got #{value.class}"
        raise ArgumentError, msg
      end
    end

    def extract_name(args, options)
      value = args[1] || options.delete(:name)
      case value
      when String then value
      when nil then raise ArgumentError, "missing required option :name"
      else
        msg = "expected :name to be a String, got #{value.class}"
        raise ArgumentError, msg
      end
    end

    class Collection < Aws::Resources::Collection; end
  end
end
