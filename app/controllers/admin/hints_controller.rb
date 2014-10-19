class Admin::HintsController < Admin::ApplicationController

  before_action :set_post, :only => [:show, :destroy, :update]

  def index
    @posts = Post.all.hint.sort_date_desc.paginate(:page => params[:page], :per_page => 10)
  end

  def destroy
    @post.destroy
    redirect_to admin_hints_path, notice:'Sugestão deletada!'
  end

  def show
  end

  def update
    @post.hint = 0
    @post.save
    redirect_to admin_hints_path, notice:'Post criado!'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end



end
