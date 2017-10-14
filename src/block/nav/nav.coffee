$(document).ready ()->
	url = document.location.href
	$('.nav__link').each (index, element) =>
		page = $(element).data('page')
		if(url.indexOf(page) + 1)
			$(element).addClass('active')

	togglerNav = (classNav, minWidthScreen) ->
		widthScreen = $(window).width()
		$(classNav).on 'click', ->
			toggler = $(this)
			nav = toggler.parent()
			active = toggler.hasClass('active')
			if widthScreen >= minWidthScreen
				toggler.removeClass 'active'
			if active
				toggler.removeClass 'active'
				nav.removeClass 'active'
			else
				toggler.addClass 'active'
				nav.addClass 'active'

	togglerNav('.toggler-nav', 1000)

	# Ширина пунктов меню
	widthNavList =  ()->
		winWidth = window.innerWidth
		contWidth= $('.container').width()
		if winWidth <= 1000
			$('.header .nav__list').css('width', contWidth + 'px')

	$(window).resize( ()->
		widthNavList()
	)

	widthNavList()