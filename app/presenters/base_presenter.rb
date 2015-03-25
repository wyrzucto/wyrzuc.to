class BasePresenter

  def initialize(street, count)
    @street = street
    @count  = count
  end

  private
  attr_reader :street, :count
end
