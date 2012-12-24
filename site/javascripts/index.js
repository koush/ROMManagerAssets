$(document).ready(function() {
	$.get('/api/backup', function(data) {
		$.get('views/backup.jade', function(backupTemplate) {
			console.log(data);
			if (!data || !data.backup || !data.backup.length) {
				$('#backup-count').text("0 backups found.");
				return;
			}
			$('#backup-count').text(data.backup.length + " backups found.");
			$.each(data.backup, function(index, backup) {
				if (backup.date)
					backup.date_string = new Date(backup.date).toLocaleString();
				else
					backup.date_string = '';
				jade.render(backupTemplate, {
					backup: backup
				}, function(err, data) {
					$('#backups').append($(data));
				});
			});
		});
	});
});
