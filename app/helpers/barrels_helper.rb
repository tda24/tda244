module BarrelsHelper
  def new_varietywine_form(form)
    form.fields_for(:varietywine, Varietywine.new) do |fr|
      render('barrels/one_varietywine_form', fr: fr)
    end
  end
end
