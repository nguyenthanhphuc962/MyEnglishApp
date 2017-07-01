class ExamsController < ApplicationController
	def new
		@exam = Exam.new
	end

	def show
		@exam = Exam.find(params[:id])
	end

	def index 
		@exams = Exam.all
	end

	def create
		@exam = Exam.new(exam_params)
		if @exam.save
			flash[:success] = "Exeam created!"
			redirect_to new_exam_question_path(@exam)
		else
			render 'new'

		end


	end

	def edit

	end

	private

		def exam_params
			params.require(:exam).permit(:name, :time)
		end

		









end
