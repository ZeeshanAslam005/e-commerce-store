class BuyerPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
    binding.pry
  end

  def authorized?
    binding.pry
    @user.buyer?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
