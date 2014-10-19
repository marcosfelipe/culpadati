class HintsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.hint = 1
    respond_to do |format|
      if @post.save
        format.html { redirect_to '/', notice: 'Obrigado! Gif enviado!' }
      else
        format.html { render action: 'new' }
      end
    end

  end


  private

  def post_params
    params.require(:post).permit(:title, :text, :image, :author)
  end


end
