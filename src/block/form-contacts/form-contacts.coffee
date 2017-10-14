$(document).ready ()->
	# Отправка сообщения
	$('.form-contacts__button_send').on 'click', (e) ->
		name_user= $('.form-contacts__input_name').val()
		mail= $('.form-contacts__input_mail').val()
		message= $('.form-contacts__textarea_message').val()

		#AJAX
		if name_user && mail && message
			e.preventDefault()
			data = $('.form-contacts').serialize();
			$.ajax(
				type: 'POST'
				url: '/action.php?action=contacts'
				data: data
				
				success: (data) ->
					$('.form-contacts .notice_success').addClass('active')
					$('.form-contacts__textarea_message').val('')
				error: (xhr, str) ->
					$('.form-contacts .notice_error').addClass('active')
			)
		else
			$('.form-contacts .notice_help').addClass('active')