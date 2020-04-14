create or replace view mlr_legacy_data.logged_actions_vw as 
select 
	la.agency_code, 
	la.site_number, 
	date_trunc('second',la.change_timestamp) as change_timestamp, 
	la.change_action, 
	la.changed_field, 
	la.old_value, 
	la.new_value
from (select row_data -> 'agency_cd' as agency_code, 
		row_data -> 'site_no' as site_number, 
		action_tstamp_stm change_timestamp,
		action as change_action,
		skeys(changed_fields)  as changed_field,
		row_data -> skeys(changed_fields) as old_value, 
		svals(changed_fields) as new_value
		from audit.logged_actions
		where action = 'U'
		union
		select row_data -> 'agency_cd' as agency_code, 
		row_data -> 'site_no' as site_number, 
		action_tstamp_stm change_timestamp,
		action as change_action,
		null  as changed_field,
		null as old_value, 
		null as new_value
		from audit.logged_actions
		where action = 'I'
		) la
