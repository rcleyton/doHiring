class RecruitersDashboard::CommentsController < RecruitersDashboardController
  def create
    @candidature = Candidature.find(params[:candidature_id])
    @comment = @candidature.comments.create(comment_params)
    if @comment.save
      redirect_to root_path
    else 
      puts @comment.errors.full_messages
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :recruiter_profile_id, :applicant_profile_id)
  end
end