class BlogPosts::CoverImagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_blog_post

    include ActionView::RecordIdentifier # include dom_id method identifier
  
    def destroy
      @blog_post.cover_image.purge_later
      # redirect_to edit_blog_post_path(@blog_post)
      respond_to do |format|
        # format.turbo_stream { render "blog_posts/cover_image/remove_image", 
        #   locals: {cover_image_id: "cover_image_#{@blog_post.id}" , flash_notice: "Cover image was successfully removed from your data!" }
        # }
        format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@blog_post, :cover_image))}
        format.html {redirect_to edit_blog_post_path(@blog_post) }
    end
    end

    private

    def set_blog_post
        @blog_post = BlogPost.find(params[:blog_post_id]) if user_signed_in? 
        # rescue ActiveRecord::RecordNotFound
        #     redirect_to blog_posts_path
        #     flash[:danger] = "This Blog Post with id = #{params[:id]} doesnt exsists!"
    end
  
end