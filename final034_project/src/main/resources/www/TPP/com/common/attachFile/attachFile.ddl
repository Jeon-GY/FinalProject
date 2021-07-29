drop table fm_ppt_attach;
drop table f_attach_file;

create table f_attach_file(
	uuid					char(36)			primary key,
	saved_folder_path		varchar2(1000),
	pure_file_name			varchar2(100),
	multi_media_type		varchar2(10)
);

create table fm_ppt_attach(
	ppt_for_sale_id			varchar2(1000),
	uuid					char(36),
	primary key(ppt_for_sale_id, uuid)
);
