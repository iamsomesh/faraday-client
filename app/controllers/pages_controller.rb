class PagesController < ApplicationController
  def home
  end

  def create_post
    # faraday post to localhost:3001
    conn = Faraday.new(url: 'http://localhost:3001')

    response = conn.post do |req|
      req.url '/posts'
      req.headers['Content-Type'] = 'application/json'
      req.body = {
        post: 
        {
          title: params[:title],
          views: 0
        }}.to_json
    end
    JSON.parse(response.body)
    redirect_to root_path, notice: 'Post created'
  end
end
