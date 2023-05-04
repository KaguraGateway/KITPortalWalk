class Admin::GraduationRequirementsController < Admin::ApplicationController
  def index
    @admission_years = AdmissionYear.all
  end

  def new
    p params
  end

  def create
    p params
    course_categories = params[:course_category]

    # TODO: ネスト深いのでリファクタリングする
    begin
        ActiveRecord::Base.transaction do
            # 入学年度を生成
            admission_year = AdmissionYear.create!(year: params[:admission_year].to_i)

            course_categories.each do |course_category_params|
                # 課程区分を生成
                course_category = CourseCategory.create!(admission_year: admission_year, title: course_category_params[:title])

                course_category_params[:subject_category].each do |subject_category_params|
                    # 科目区分を生成
                    subject_category = SubjectCategory.create!(course_category: course_category, title: subject_category_params[:title])

                    subject_category_params[:subject_group].each do |subject_group_params|
                        # 科目を生成
                        SubjectGroup.create!(subject_category: subject_category, title: subject_group_params[:title], min_credit: subject_group_params[:min_credit].to_i)
                    end
                end
            end
        end
    rescue => e
        p e
        redirect_to admin_graduation_requirements_path, alert: "Graduation Requirements created failed"
    else
        redirect_to admin_graduation_requirements_path, notice: "Graduation Requirements created successfully"
    end
  end
end
