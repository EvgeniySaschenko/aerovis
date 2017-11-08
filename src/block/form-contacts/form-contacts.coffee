$(document).ready ()->
	# Отправка сообщения
	$('.form-contacts__button_send').on 'click', (e) ->

		# Удалить класс no-valid
		$('.no-valid').removeClass('no-valid')

		# Убрать все уведомления
		$('.form-contacts .notice.active').removeClass('active')

		# Проверка обязательных полей required
		required= true
		$('.form-contacts [required]').each( (i, e) ->
			if !$(e).val()
				required= false
				$(e).addClass('no-valid')
		)

		# Проверка E-mail
		if !$('.form-contacts__input_mail').val().match(/^[-._a-z0-9]+@(?:[a-z0-9][-a-z0-9]+\.)+[a-z]{2,6}$/ig)
			required= false
			$('.form-contacts__input_mail').addClass('no-valid')

		# recaptcha
		# recaptcha
		if !$('.form-contacts').serialize().match(/[^]{1,}g-recaptcha-response=[^]{1,}/ig)
			required= false

		e.preventDefault()

		#AJAX
		if required
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