jQuery(function($) {
	
	$(document).on('click', '.deletePost', (function() {
		var current_post_li = $(this).parents('li')[0];

			$.ajax({
				url: '/posts/'+$(current_post_li).attr('post_id'),
				type: 'POST',
				data: {_method: 'DELETE'},
				success: function() {
					$(current_post_li).fadeOut(300);
				}
			});

	}));

	$(document).on('click', '#new_post', (function() {
		$.ajax({
			url: '/posts/new',
			success: function() {
					$('#new_post').slideUp(50);
					$('#post_form').slideDown(300);
			}
		});
	}));

});