class ChipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chips = policy_scope(Chip)
  end

end
