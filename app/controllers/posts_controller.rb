class PostsController < ApplicationController

  def index
    @posts = Post.all.ultimate.sort_date_desc.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    set_post
  end

  def random
    @post = Post.find(Post.get_random)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

end
