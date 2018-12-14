class Admin::VariantsController < ApplicationController
  before_action :set_admin_variant, only: [:show, :edit, :update, :destroy]

  # GET /admin/variants
  # GET /admin/variants.json
  def index
    @admin_variants = Admin::Variant.all
  end

  # GET /admin/variants/1
  # GET /admin/variants/1.json
  def show
  end

  # GET /admin/variants/new
  def new
    @admin_variant = Admin::Variant.new
  end

  # GET /admin/variants/1/edit
  def edit
  end

  # POST /admin/variants
  # POST /admin/variants.json
  def create
    @admin_variant = Admin::Variant.new(admin_variant_params)

    respond_to do |format|
      if @admin_variant.save
        format.html { redirect_to @admin_variant, notice: 'Variant was successfully created.' }
        format.json { render :show, status: :created, location: @admin_variant }
      else
        format.html { render :new }
        format.json { render json: @admin_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/variants/1
  # PATCH/PUT /admin/variants/1.json
  def update
    respond_to do |format|
      if @admin_variant.update(admin_variant_params)
        format.html { redirect_to @admin_variant, notice: 'Variant was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_variant }
      else
        format.html { render :edit }
        format.json { render json: @admin_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/variants/1
  # DELETE /admin/variants/1.json
  def destroy
    @admin_variant.destroy
    respond_to do |format|
      format.html { redirect_to admin_variants_url, notice: 'Variant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_variant
      @admin_variant = Admin::Variant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_variant_params
      params.fetch(:admin_variant, {})
    end
end
