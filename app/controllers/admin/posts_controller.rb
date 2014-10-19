class Admin::PostsController < Admin::ApplicationController

  before_action :set_post, only: ['show','edit','update','destroy']

  def index
    @posts = Post.all.ultimate.sort_date_desc.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to [:admin,@post], notice: 'Post criado!' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [:admin,@post], notice: 'Post atualizado!' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice:'Post deletado!'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :text, :image, :author)
  end

end
