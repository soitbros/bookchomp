class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    post = Post.create( post_params )
    path = params[:post][:image].path
    text = File.read(path)
    tokenizer = Punkt::SentenceTokenizer.new(text)
    result    = tokenizer.sentences_from_text(text, :output => :sentences_text)
    post.body = result
    post.save
    redirect_to root_path
  end

  def chomp
    @post = Post.find(params[:id])
    render json: {post: @post.body.sample(@post.body.length*(size(params[:size])))}
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def size(size_param)
    case size_param
    when 'taste'
      0.01
    when 'nibble'
      0.05
    when 'bite'
      0.1
    when 'appetizer'
      0.2
    when 'entree'
      0.4
    when 'feast'
      0.5
    when 'buffet'
      0.75
    else
      1
    end
  end
end
