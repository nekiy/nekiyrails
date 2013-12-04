class PostsController < ApplicationController
	def new
  @post = Post.new
end
 
def create
  @post = Post.new(post_params)
 
  if @post.save
    redirect_to @post
  else
    render 'new'
  end
end
 #________________________
def show
  @post = Post.find(params[:id])
end
#___________________-
http_basic_authenticate_with name: "nikola", password: "12345", except: [:index, :show]

def index
  @posts = Post.all
end
#_________________________
def edit
  @post = Post.find(params[:id])
end
#Update
def update
  @post = Post.find(params[:id])
 
  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit'
  end
end
#Destoy
def destroy
  @post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
end
 
	private
  	def post_params
    params.require(:post).permit(:title, :text)
  	end
	end