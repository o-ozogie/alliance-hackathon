# frozen_string_literal: true

Dir.glob(File.expand_path('response/*', __dir__)).sort.each { |f| require_relative f }

module Response
  include UnauthorizedException
  include ForbiddenException
end