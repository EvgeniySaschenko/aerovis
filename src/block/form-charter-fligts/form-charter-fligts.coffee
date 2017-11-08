$(document).ready ()->
	$('.form-charter-fligts__select_region__item').on 'click', (e) ->
		$(this).parent().children().removeClass('active')
		$(this).addClass('active')


	# Отправка сообщения
	$('.form-charter-fligts__button_send').on 'click', (e) ->

		# Удалить класс no-valid
		$('.no-valid').removeClass('no-valid')

		# Убрать все уведомления
		$('.form-charter-fligts .notice.active').removeClass('active')

		# Проверка обязательных полей input
		required= true
		$('.form-charter-fligts [required]').each( (i, e) ->
			if !$(e).val()
				required= false
				$(e).addClass('no-valid')
		)

		# Проверка E-mail
		if !$('.form-charter-fligts__input_mail').val().match(/^[-._a-z0-9]+@(?:[a-z0-9][-a-z0-9]+\.)+[a-z]{2,6}$/ig)
			required= false
			$('.form-charter-fligts__input_mail').addClass('no-valid')

		# Проверка полей region
		region_of= $('.form-charter-fligts__select_region__item.active[data-name-of]').data('name-of')
		region_in= $('.form-charter-fligts__select_region__item.active[data-name-in]').data('name-in')

		if !region_of
			$('.form-charter-fligts__select_region__item[data-name-of]').parent().addClass('no-valid')
			required= false

		if !region_in
			$('.form-charter-fligts__select_region__item[data-name-in]').parent().addClass('no-valid')
			required= false

		# recaptcha
		if !$('.form-charter-fligts').serialize().match(/[^]{1,}g-recaptcha-response=[^]{1,}/ig)
			required= false

		e.preventDefault()
		
		#AJAX
		if required 
			data = $('.form-charter-fligts').serialize() + '&region_of=' + region_of + '&region_in=' + region_in;
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