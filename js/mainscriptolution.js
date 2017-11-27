sQuery.ajaxSetup({ 
    'beforeSend': function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript")
    }
})

$(document).ready( function() {

	if ($('#gig_title').length != 0) {
		updateGigTitleCharsCount();
		$('#gig_title').keyup(function(){
			updateGigTitleCharsCount();
		});
	};
	$('input[maxlength],textarea[maxlength]').keyup(function(){
		var max = parseInt($(this).attr('maxlength'));
		if($(this).val().length > max){
			$(this).val($(this).val().substr(0, $(this).attr('maxlength')));
		};
	});	
	function updateGigTitleCharsCount() {
		var used = $('#gig_title').val().length;
		$('.gigtitleused').html(used);
	};
	function updateGigDescCharsCount() {
		var used = $('#gig_description').val().length;
		$('.gigdescused').html(used);
	};
	$('a.select-all').click(function() {
		$('.checkbox').each(function(){
			$(this).attr('checked', true);
		});
		return false;
	});
	$('a.select-none').click(function() {
		unselectCheckboxes();
		return false;
	});
	$('a.select-active').click(function() {
		unselectCheckboxes();
		$('.checkbox.approved').each(function(){
			$(this).attr('checked', true);
		});
		return false;
	});
	$('a.select-suspended').click(function() {
		unselectCheckboxes();
		$('.checkbox.suspended').each(function(){
			$(this).attr('checked', true);
		});
		return false;
	});
	$('a.select-read').click(function() {
		unselectCheckboxes();
		$('.checkbox.read').each(function(){
			$(this).attr('checked', true);
		});
		return false;
	});
	$('a.select-unread').click(function() {
		unselectCheckboxes();
		$('.checkbox.unread').each(function(){
			$(this).attr('checked', true);
		});
		return false;
	});
	$('.btn-suspend').click(function() {
		if ($('.checkbox:checked').size() > 0) {
			$('#gigs_form').attr('action',base_url+'/manage_gigs?suspend=1');
			$('#gigs_form').submit();
		} else {
			return false;
		}
	});
	$('.btn-activate').click(function() {
		if ($('.checkbox:checked').size() > 0) {
			$('#gigs_form').attr('action',base_url+'/manage_gigs?activate=1');
			$('#gigs_form').submit();
		} else {
			return false;
		}
	});
	$('.btn-delete').click(function() {
		if ($('.checkbox:checked').size() > 0) {
			$('#gigs_form').attr('action',base_url+'/manage_gigs?delete=1');
			$('#gigs_form').submit();
		} else {
			return false;
		}
	});
	function unselectCheckboxes() {
		$('.checkbox').each(function(){
			$(this).attr('checked', false);
		});
	};
	$('#conversations_quick_navigation').change(function(){
      if ($(this).val() != "Quick navigation") {
        window.location = base_url + '/inbox?' + $(this).val();
      }
    });
})