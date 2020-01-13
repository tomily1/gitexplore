# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def index
    @result = fetch_result(formatted_query_params) if query_params[:q]
  end

  private

  def fetch_result(search_params)
    github = Github.new
    Rails.cache.fetch(search_params, expires_in: 3.minutes) do
      github.search(search_params)
    end
  end

  def formatted_query_params
    query = query_params[:q].gsub(/\s+/m, ' ').strip.split(' ').join('+')
    query + '&page=' + page_param(query_params[:page]).to_s
  end

  def page_param(param)
    page = param.to_i || 1

    page >= 1 || page <= 100 ? page : 1
  end

  def query_params
    params.permit(:q, :page)
  end
end
