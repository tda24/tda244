varietywine_change_new = ->
  if($("#barrel_varietywine_id").length > 0)
    alert("Сначала выберите форму редактирования.\nКнопка (Выбрать существующую/редактировать)")
  else
    elem = $("#varietywine-change")
    data = elem.attr("data-content-new")
    elem.attr("data-content-new", elem.html())
    elem.html(data)
    window.datepicker_activation_by_item(elem)
  false


varietywine_change_exist = ->
  elem1 = $("#barrel_varietywine_attributes_id")
  elem2 = $("#barrel_varietywine_id")
  if(elem1.length == 0 && elem2.length == 0)
    alert("Сначала выберите форму редактирования.\nКнопка (Cоздать/редактировать)")
  else
    elem = $("#varietywine-change")
    data = elem.attr("data-content-exist")
    elem.attr("data-content-exist", elem.html())
    elem.html(data)
    window.datepicker_activation_by_item(elem)
  false

all_activities = ->
  $("#varietywine-change-new-btn").click varietywine_change_new
  $("#varietywine-change-exist-btn").click varietywine_change_exist
  # 
  # Нужную траницу определяем по её url - "barrels/new"
  if(location.href.indexOf("barrels/new") != -1)
    $("#varietywine-change-new-btn").add("#varietywine-change-exist-btn").remove()
    varietywine_change_new()

$(document).ready all_activities
$(document).on 'page:load', all_activities
