# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ($) ->
	$(".box").on "click", ->
    $(this).find(".use").trigger("click")
    
  $("form.resume_form").sisyphus({
    onSave:  ->
      console.log("saved")
      $(".saved-notification").fadeIn("fast").delay(1000).fadeOut("fast")
  });
  
  
  
  $(".remove_field").live "click", ->
    $(this).prev("input[type='hidden']").val("true")
    $(this).closest(".fields").hide()
    return false
    
  
  if($(".alert-box").is(":visible"))
    $(".alert-box").delay(3000).slideUp("slow")
  
  
		
  # Resume templates
  if($("section.templates").length)
    $form = $("#choose_template")
    $form.find(":radio").hide()
    
    # Choose theme
    $form.find(".use").each ->
      $(this).click ->
        # alert("foo")
        $form.find(".active").removeClass("active")
        $(this).parents(".box").addClass("active").find(":radio").attr("checked", true)
        $("#loading").show()
        $(".templates_wrapper").delay(200).slideUp(2000, ->
          $("#loading").hide()
          $(".layout_order").slideDown(1000)
          $( "#sortable_list" ).sortable(
            update: -> 
              $("#layout_order_text_field").val($(this).find("li").text().toLowerCase())
            placeholder: "ui-state-highlight"
          );
         	$( "#sortable_list" ).disableSelection();
        )
       
        return false
      
    # Preview template
    $form.find(".preview").each ->
      $(this).click ->
        theme = $(this).data("template")
        $("." + theme + "_modal").reveal()
        return false 
        

    