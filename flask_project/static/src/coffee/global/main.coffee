
$ ->
	margins = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
	for margin in margins
		$container = $(".grid-container:first").clone().insertAfter($(".grid-container:last"))
		$container.css
			padding: margin
		$container.find('.margins').html(margin)