class QuestionsController < ApplicationController
	before_action :find_exam
	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		@question.exam_id = @exam.id
		if @question.save
			flash[:success] = "Question added"
			redirect_to new_exam_question_choice_path(@exam, @question)
		else
			render 'new'
		end

	end


	private 

		def find_exam
			@exam = Exam.find(params[:exam_id])
		end

		def question_params
			params.require(:question).permit(:content)
		end
end
