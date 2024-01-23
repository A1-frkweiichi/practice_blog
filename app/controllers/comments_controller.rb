class CommentsController < ApplicationController
  before_action :set_entry, only: [:create]
  before_action :set_comment, only: [:approve]

  def create
    @comment = @entry.comments.build(comment_params)
    @comment.status = 'unapproved'
    if @comment.save
      redirect_to [@entry.blog, @entry], notice: 'Comment was successfully created.'
    else
      render 'entries/show'
    end
  end

  def approve
    @comment.update(status: 'approved')
    redirect_to [@comment.entry.blog, @comment.entry], notice: 'Comment was approved.'
  end

  private

  def set_entry
    @entry = Entry.find(params[:entry_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
