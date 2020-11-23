class ExceptionCore < StandardError
  def self.except(error)
    raise error if error.should_raise

    error
  end
end