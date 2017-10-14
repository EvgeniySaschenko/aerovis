$(document).ready ()->
	$('.slider_header').slick({
		dots: true
		autoplay: true
		autoplaySpeed: 2500
	})

	$('.slider_about').slick({
		dots: true,
		lazyLoad: 'ondemand',
		slidesToShow: 3,
		slidesToScroll: 1
	})