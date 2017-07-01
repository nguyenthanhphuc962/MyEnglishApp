class ChoicesController < ApplicationController
	before_action :find_question
	before_action :find_exam
	def new 
		@choice = Choice.new
	end

	def create
		@choice = Choice.new(choice_params)
		@choice.question_id = @question.id
		if @choice.save 
			flash[:success] = "Choice added"
			redirect_to new_exam_question_choice_path(@exam, @question)
		else
			render 'new'
		end

	end

	private

		def choice_params
			params.require(:choice).permit(:content, :is_correct)
		end

		def find_question
			@question = Question.find(params[:question_id])
		end

		def find_exam
			@exam = Exam.find(params[:exam_id])
		end

end
