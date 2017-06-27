module GrapesortsHelper
  def grapesort_options()
    Grapesort.all.pluck('name')
  end
end
