class CommentsController < ApplicationController
	before_action :postf
	def index
		
		@comments =postf.comments
		
	end
	def index
		@comments = @post.comments
	end

	def new
		@comment = @post.comments.new
	end

	def create
		@comment = @post.comments.new(comment_params)
		if @comment.save
			redirect_to post_comments_path(@post),
		notice: "Comentário gravado com sucesso!"
		else
			render :new
		end
	end

	def destroy
		@comment= @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_comments_path(@post), alert: "Receita apagada com sucesso!"
	end

	private
		def comment_params
		params.require(:comment).permit(:name, :comment)
		end

		def postf
			@post = Post.friendly.find(params[:post_id])
		end
end
