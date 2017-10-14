$(document).ready ()->
	$('.form-charter-fligts__select_region__item').on 'click', (e) ->
		$('.form-charter-fligts__select_region__item').removeClass('active')
		$(this).addClass('active')

	# Отправка сообщения
	$('.form-charter-fligts__button_send').on 'click', (e) ->
		name_user= $('.form-charter-fligts__input_name').val()
		mail= $('.form-charter-fligts__input_mail').val()
		region= $('.form-charter-fligts__select_region__item.active').data('name')
		message= $('.form-charter-fligts__textarea_message').val()

		# Убрать все уведомления
		$('.form-charter-fligts .notice.active').removeClass('active')
		#AJAX
		if name_user && mail && region && message
			e.preventDefault()
			data = $('.form-charter-fligts').serialize() + '&region=' + region;
			$.ajax(
				type: 'POST'
				url: '/action.php?action=charter-fligts'
				data: data
				
				success: (data) ->
					$('.form-charter-fligts .notice_success').addClass('active')
					$('.form-charter-fligts__textarea_message').val('')
				error: (xhr, str) ->
					$('.form-charter-fligts .notice_error').addClass('active')
			)
		else
			$('.form-charter-fligts .notice_help').addClass('active')