class LendingHistoriesController < ApplicationController
  def index
    if params[:borrower_name].present?
      @lending_histories = LendingHistory.where(borrower_name: params[:borrower_name]).order(borrowed_at: :desc)
    else
      @lending_histories = LendingHistory.order(borrowed_at: :desc)
    end
  end
end
