class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_blog_post, except: [:index, :new, :create,]
    def index
        @blog_posts = BlogPost.all
    end

    def show
        # @blog_post = BlogPost.find(params[:id])
        # rescue ActiveRecord::RecordNotFound
        #     flash[:danger] = "This blog_post doesnt exsists!"
        #     redirect_to blog_posts_path
    end

    def new
        @blog_post = BlogPost.new
    end

    def create
        # binding.break
        @blog_post = BlogPost.new(blog_post_params)

        respond_to do |format|
            if @blog_post.save
                # format.html {redirect_to @blog_post}
                #format.turbo_stream {redirect_to @blog_post}
                format.html { redirect_to blog_post_url(@blog_post.id), notice: "Blog Post was successfully created." }
                #format.json { render :show, status: :created, location: @blog_post }
                #format.turbo_stream { render "users/create_stock" , locals: { stock_item: @stock }}
            else
           
                # format.html {render :new, status: :unprocessable_entity}
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @blog_post.errors, status: :unprocessable_entity }
            end
        end


        # respond_to do |format|
        #     if @post.save
        #       format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        #       format.json { render :show, status: :created, location: @post }
        #     else
        #       format.html { render :new, status: :unprocessable_entity }
        #       format.json { render json: @post.errors, status: :unprocessable_entity }
        #     end
        #   end

    end

    def edit
        # @blog_post = BlogPost.find(params[:id])
        # rescue ActiveRecord::RecordNotFound
        #     redirect_to blog_posts_path
        #     flash[:danger] = "This blog_post doesnt exsists!"
    end

    def update
        # @blog_post = BlogPost.find(params[:id])
        respond_to do |format|
            if @blog_post.update(blog_post_params)
                format.html { redirect_to blog_post_url(@blog_post.id), notice: "Blog Post was successfully updated!" }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @blog_post.errors, status: :unprocessable_entity }
            end
        end
    
    end

    def destroy
        # @blog_post = BlogPost.find(params[:id])
        @blog_post.destroy
        flash[:notice] = "The Blog Post was successfully deleted!"
        redirect_to blog_posts_path
    end

    private

    def set_blog_post
        @blog_post = BlogPost.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            redirect_to blog_posts_path
            flash[:danger] = "This Blog Post with id = #{params[:id]} doesnt exsists!"
    end

    def blog_post_params 
        params.require(:blog_post).permit(:title, :body)
    end

end