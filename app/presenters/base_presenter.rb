class BasePresenter

  def initialize(street, count, kind=nil)
    @street = street
    @count  = count
    @kind   = kind
  end

  private
  attr_reader :street, :count, :kind
end
