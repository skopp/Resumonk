class ResumesController < ApplicationController
  before_filter :correct_user, except: [:short_link]
  before_filter :pro_user, only: [:info]
  
  # GET /resume
  # GET /resume.json
  layout :selected_layout, only: [:show]
  def selected_layout
    current_user.resumes.find(params[:id]).layout || "application"
  end
  
  # GET /resume/new
  # GET /resume/new.json
  def new
    unless session[:rtoken].nil?
     client = LinkedIn::Client.new(ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'])
      if session[:atoken].nil?
        pin = params[:oauth_verifier]
        atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
        session[:atoken] = atoken
        session[:asecret] = asecret
      else
        client.authorize_from_access(session[:atoken], session[:asecret])
      end
      @linkedin_user = client.profile
      @location = client.profile(:fields => %w(location))
      @summary = client.profile(:fields => %w(summary))
      @url = client.profile(:fields => %w(member_url_resources))
      @profile = client.profile(:fields => %w(positions educations skills))
      
      @resume = current_user.resumes.build if signed_in?


        @resume.educations.build
        @resume.experiences.build
        @resume.skills.build

        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @resume }
        end
    else
    
    
    
    @resume = current_user.resumes.build if signed_in?
    
    
    @resume.educations.build
    @resume.experiences.build
    @resume.skills.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resume }
    end
  end
  end

  # GET /resume/1
  # GET /resume/1.json
  def show
    @resume = current_user.resumes.find(params[:id])
    layout = current_user.resumes.find(params[:id]).layout || "application"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resume }
      format.pdf do
        render :pdf => "file_name",
        :layout   => "resumes/#{layout}.pdf.erb",
        :template => "resumes/pdf_layouts/show.html.erb",
        :wkhtmltopdf  => Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s,
      end
    end
  end

  # GET /resume/1/edit
  def edit
    @resume = current_user.resumes.find(params[:id])
  end

  # POST /resume
  # POST /resume.json
  def create
    @resume = current_user.resumes.build(params[:resume])

    respond_to do |format|
      if @resume.save
        format.html { redirect_to show_template_path(current_user, @resume) , notice: 'Resume was successfully created.' }
        format.json { render json: @resume, status: :created, location: @resume }
      else
        format.html { render action: "new" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resume/1
  # PUT /resume/1.json
  def update
    @resume = current_user.resumes.find(params[:id])

    respond_to do |format|
      if @resume.update_attributes(params[:resume])
        format.html { redirect_to show_template_path(current_user, @resume), notice: 'Resume was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume/1
  # DELETE /resume/1.json
  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end
  
  # Show Download and share links
  def show_links
    @resume = current_user.resumes.find(params[:id])
  end
  
  # Choose Template
  def show_template
    @resume = current_user.resumes.find(params[:id])
  end
  
  def choose_template
    @resume = current_user.resumes.find(params[:id])
    @resume.layout = params[:resume][:layout]
    if @resume.save!
      redirect_to show_links_path(current_user, @resume)
    else
      render 'show_template'
    end
  end
  
  def short_link
    @resume = Resume.where(short_link: params[:short_link]).first
    layout = @resume.layout || "application"
    Visit.register(@resume.id, get_remote_ip(request.env))
        
        
    respond_to do |format|
      format.html {  render layout: @resume.layout }# show.html.erb
      format.pdf do
        render :pdf => "file_name",
        :layout   => "resumes/#{layout}.pdf.erb",
        :template => "resumes/pdf_layouts/show.html.erb",
        :wkhtmltopdf  => Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s,
      end
    end
  end
  
  
  def info
      @resume = Resume.find(params[:id])
      unless @resume
        flash[:error] = 'This resume is not defined yet'
      else
        @num_of_days = (params[:num_of_days] || 15).to_i
        @count_days_bar = Visit.count_days_bar(params[:id], @num_of_days)
        chart = Visit.count_country_chart(params[:id], params[:map] || 'world')
        @count_country_map = chart[:map]
        @count_country_bar = chart[:bar]
        @country_map = chart[:country_map]
      end
  end
    

  private
      def correct_user
        user = User.find(params[:user_id])
        redirect_to root_path unless current_user?(user)
      end
      
      def pro_user
        user = User.find(params[:user_id])
        redirect_to user unless user.pro == true
      end
      
      def get_remote_ip(env)
        if addr = request.remote_ip
          addr.split(',').first.strip
        else
          env['REMOTE_ADDR']
        end
      end
end
