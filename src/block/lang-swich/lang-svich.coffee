$(document).ready ()->
	arrLang= $('.header .lang-swich__link')
	url= document.location.href
	$.each( arrLang, ( k, v ) ->
		lang= $(v).data('lang')
		partUrl= url.split('/')
		if !partUrl[4]
			partUrl[4]= 'about-us'
		href= partUrl[0] + '//' + partUrl[2] + '/' + lang + '/' + partUrl[4]
		$(v).attr('href', href)
	)