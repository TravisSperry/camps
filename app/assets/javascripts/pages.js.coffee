# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$(document).ready ->
		myCookie = document.cookie.replace(/(?:(?:^|.*;\s*)summerpopup\s*\=\s*([^;]*).*$)|^.*$/, "$1")
		#alert(myCookie)
		if !myCookie
			setTimeout ->
				$("#signUpModal").modal('show')
				date = new Date()
				date.setTime date.getTime() + (24 * 60 * 60 * 1000)
				exp = "; expires=" + date.toGMTString()
				document.cookie = "summerpopup=true" + exp
			, 15000

	#document.cookie = 'summerpopup' + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;'