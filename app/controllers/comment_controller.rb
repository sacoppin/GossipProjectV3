class CommentsController < ApplicationController
def create
  @gossip = Gossip.find(params[:gossip_id])
  @comment = Comment.new(content: params[:content], gossip_id: @gossip.id)
  @comment.user_id = current_user.id
end

def new
  @gossip = Gossip.find(params[:gossip_id]) 
  @comment = Comment.new
end

end