jQuery(function($) {
	
	$('.deleteAction').click(function() {
		var current_comment_li = $(this).parents('li')[0];

			$.ajax({
				url: '/comments/'+$(current_comment_li).attr('comment_id'),
				type: 'POST',
				data: {_method: 'DELETE'},
				success: function() {
					$(current_comment_li).fadeOut(200);
				}
			});

	});

});