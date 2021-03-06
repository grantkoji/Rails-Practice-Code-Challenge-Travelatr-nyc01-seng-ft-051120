class PostsController < ApplicationController

    def new 
        @post = Post.new
        @destinations = Destination.all
        @bloggers = Blogger.all
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            @destinations = Destination.all
            @bloggers = Blogger.all
            render :new
        end
    end

    def show 
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
        @destinations = Destination.all
        @bloggers = Blogger.all
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            @destinations = Destination.all
            @bloggers = Blogger.all
            render :new
        end
    end

    def like
        @post = Post.find(params[:id])
        @post.add_like
        @post.save
        redirect_to post_path(@post)
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end