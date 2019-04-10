class RailsAdminPgArray < RailsAdmin::Config::Fields::Base
  register_instance_option :formatted_value do
    value.join(',')
  end
end

class RailsAdminPgStringArray < RailsAdminPgArray
  def parse_input(params)
    name = params[name]
    name = name.split(',') if name.is_a?(::String)
    name
  end
end

class RailsAdminPgIntArray < RailsAdminPgArray
  def parse_input(params)
    name = params[name]
    return unless name.is_a?(::String)
    name = name.split(',').collect(&:to_i)
    name
  end
end

RailsAdmin::Config::Fields::Types.register(:pg_string_array, RailsAdminPgStringArray)
RailsAdmin::Config::Fields::Types.register(:pg_int_array, RailsAdminPgIntArray)
