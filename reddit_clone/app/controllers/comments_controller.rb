class CommentsController < ApplicationController

    def new 
    end 
    
    def create 
        @comment = Comment.new(comment_params)
        @comment.author_id = current_user.id 
        @comment.parent_comment_id = params[:comment][:parent_comment_id]
        if @comment.save 
            redirect_to post_url(@comment.post)
        else
            flash[:errors] = @comment.errors.full_messages
            render :new
        end
    end 

    def show 
        @comment = Comment.find(params[:id])
    end

    private 
    def comment_params
        params.require(:comment).permit(:content, :post_id)
    end

end
