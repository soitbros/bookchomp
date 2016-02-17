class PostsController < ApplicationController

  def index
    @post = Post.new
    dbPosts = Post.all
    render json: {posts: dbPosts}
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

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
