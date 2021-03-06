USE [nubuilder4]
GO
/****** Object:  Table [dbo].[zzzzsys_php]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_php](
	[zzzzsys_php_id] [nvarchar](25) NOT NULL,
	[sph_code] [nvarchar](300) NULL,
	[sph_description] [nvarchar](300) NULL,
	[sph_group] [nvarchar](100) NULL,
	[sph_php] [nvarchar](max) NULL,
	[sph_run] [nvarchar](20) NULL,
	[sph_zzzzsys_form_id] [nvarchar](25) NULL,
	[sph_system] [nvarchar](1) NULL,
	[sph_global] [nvarchar](1) NULL,
	[sph_hide] [nvarchar](1) NULL,
 CONSTRAINT [PK_zzzzsys_php_zzzzsys_php_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_php_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_select]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_select](
	[zzzzsys_select_id] [nvarchar](25) NOT NULL,
	[sse_description] [nvarchar](300) NULL,
	[sse_json] [nvarchar](max) NULL,
	[sse_sql] [nvarchar](max) NULL,
	[sse_edit] [nvarchar](1) NULL,
	[sse_system] [nvarchar](1) NULL,
 CONSTRAINT [PK_zzzzsys_select_zzzzsys_select_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_select_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[zzzzsys_object_list]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[zzzzsys_object_list] ([zzzzsys_object_list_id])
AS 
   SELECT TABLES.TABLE_NAME AS zzzzsys_object_list_id
   FROM information_schema.TABLES
   WHERE TABLES.TABLE_CATALOG = db_name()
GO
/****** Object:  View [dbo].[zzzzsys_report_data]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[zzzzsys_report_data] 
AS 


   SELECT CONCAT(N'PROCEDURE:', zzzzsys_php.zzzzsys_php_id) AS id, zzzzsys_php.sph_code AS code, zzzzsys_php.sph_description AS description
   FROM dbo.zzzzsys_php
   WHERE zzzzsys_php.sph_system <> '1' AND charindex(N'#TABLE_ID#', zzzzsys_php.sph_php) > 0
    UNION
   SELECT CONCAT(N'SQL:', zzzzsys_select.zzzzsys_select_id) AS id, N'nuSQL' AS code, zzzzsys_select.sse_description AS description
   FROM dbo.zzzzsys_select
   WHERE zzzzsys_select.sse_system IS NULL OR zzzzsys_select.sse_system = ''
    UNION
   SELECT CONCAT(N'TABLE:', zzzzsys_object_list.zzzzsys_object_list_id) AS id, N'nuTABLE' AS code, zzzzsys_object_list.zzzzsys_object_list_id AS description
   FROM dbo.zzzzsys_object_list
GO
/****** Object:  Table [dbo].[zzzzsys_form]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_form](
	[zzzzsys_form_id] [nvarchar](25) NOT NULL,
	[sfo_type] [nvarchar](300) NULL,
	[sfo_code] [nvarchar](300) NULL,
	[sfo_description] [nvarchar](300) NULL,
	[sfo_table] [nvarchar](300) NULL,
	[sfo_primary_key] [nvarchar](300) NULL,
	[sfo_browse_redirect_form_id] [nvarchar](300) NULL,
	[sfo_browse_row_height] [int] NULL,
	[sfo_browse_rows_per_page] [int] NULL,
	[sfo_browse_sql] [nvarchar](max) NULL,
	[sfo_javascript] [nvarchar](max) NULL,
 CONSTRAINT [PK_zzzzsys_form_zzzzsys_form_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_form_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_report]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_report](
	[zzzzsys_report_id] [nvarchar](25) NOT NULL,
	[sre_code] [nvarchar](300) NULL,
	[sre_description] [nvarchar](300) NULL,
	[sre_group] [nvarchar](100) NULL,
	[sre_zzzzsys_php_id] [nvarchar](25) NULL,
	[sre_zzzzsys_form_id] [nvarchar](25) NULL,
	[sre_layout] [nvarchar](max) NULL,
 CONSTRAINT [PK_zzzzsys_report_zzzzsys_report_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[zzzzsys_run_list]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[zzzzsys_run_list] (
   [id], 
   [run], 
   [code], 
   [description])
AS 
   SELECT zzzzsys_form.zzzzsys_form_id AS id, N'Form' AS run, zzzzsys_form.sfo_code AS code, zzzzsys_form.sfo_description AS description
   FROM dbo.zzzzsys_form
    UNION
   SELECT zzzzsys_report.zzzzsys_report_id AS id, N'Report' AS run, zzzzsys_report.sre_code AS code, zzzzsys_report.sre_description AS description
   FROM dbo.zzzzsys_report
    UNION
   SELECT TOP (1000000) zzzzsys_php.zzzzsys_php_id AS id, N'Procedure' AS run, zzzzsys_php.sph_code AS code, zzzzsys_php.sph_description AS description
   FROM dbo.zzzzsys_php
   WHERE zzzzsys_php.sph_system  <> 1
      ORDER BY code
GO
/****** Object:  Table [dbo].[zzzzsys_access]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_access](
	[zzzzsys_access_id] [nvarchar](25) NOT NULL,
	[sal_code] [nvarchar](50) NULL,
	[sal_description] [nvarchar](200) NULL,
	[sal_zzzzsys_form_id] [nvarchar](25) NULL,
 CONSTRAINT [PK_zzzzsys_access_zzzzsys_access_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_access_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_access_form]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_access_form](
	[zzzzsys_access_form_id] [nvarchar](25) NOT NULL,
	[slf_zzzzsys_access_id] [nvarchar](25) NULL,
	[slf_zzzzsys_form_id] [nvarchar](25) NULL,
	[slf_add_button] [nvarchar](1) NULL,
	[slf_save_button] [nvarchar](1) NULL,
	[slf_delete_button] [nvarchar](1) NULL,
	[slf_clone_button] [nvarchar](1) NULL,
	[slf_new_button] [nvarchar](1) NULL,
	[slf_print_button] [nvarchar](1) NULL,
	[slf_data_mode] [nvarchar](2) NULL,
 CONSTRAINT [PK_zzzzsys_access_form_zzzzsys_access_form_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_access_form_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_access_php]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_access_php](
	[zzzzsys_access_php_id] [nvarchar](25) NOT NULL,
	[slp_zzzzsys_access_id] [nvarchar](25) NULL,
	[slp_zzzzsys_php_id] [nvarchar](25) NULL,
 CONSTRAINT [PK_zzzzsys_access_php_zzzzsys_access_php_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_access_php_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_access_report]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_access_report](
	[zzzzsys_access_report_id] [nvarchar](25) NOT NULL,
	[sre_zzzzsys_access_id] [nvarchar](25) NULL,
	[sre_zzzzsys_report_id] [nvarchar](25) NULL,
 CONSTRAINT [PK_zzzzsys_access_report_zzzzsys_access_report_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_access_report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_browse]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_browse](
	[zzzzsys_browse_id] [nvarchar](25) NOT NULL,
	[sbr_zzzzsys_form_id] [nvarchar](25) NULL,
	[sbr_title] [nvarchar](100) NULL,
	[sbr_display] [nvarchar](512) NULL,
	[sbr_align] [nchar](1) NULL,
	[sbr_format] [nvarchar](300) NULL,
	[sbr_order] [int] NULL,
	[sbr_width] [int] NULL,
 CONSTRAINT [PK_zzzzsys_browse_zzzzsys_browse_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_browse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_cloner]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_cloner](
	[zzzzsys_cloner_id] [nvarchar](25) NOT NULL,
	[clo_form_source] [nvarchar](25) NULL,
	[clo_form_dest] [nvarchar](25) NULL,
	[clo_tabs] [nvarchar](1000) NULL,
	[clo_dump] [smallint] NULL,
	[clo_objects] [smallint] NULL,
	[clo_subforms_include] [smallint] NULL,
	[clo_subforms] [nvarchar](1000) NULL,
	[clo_iframe_forms_include] [smallint] NULL,
	[clo_iframe_forms] [nvarchar](max) NULL,
	[clo_new_pks] [smallint] NULL,
	[clo_notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_zzzzsys_cloner_zzzzsys_cloner_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_cloner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_code_snippet]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_code_snippet](
	[zzzzsys_code_snippet_id] [nvarchar](25) NOT NULL,
	[cot_code] [nvarchar](50) NULL,
	[cot_description] [nvarchar](max) NULL,
	[cot_url] [nvarchar](500) NULL,
	[cot_source_code] [nvarchar](max) NULL,
	[cot_language] [nvarchar](20) NULL,
	[cot_scope] [nvarchar](50) NULL,
	[cot_updated_on] [datetime] NULL,
 CONSTRAINT [PK_zzzzsys_code_snippet_zzzzsys_code_snippet_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_code_snippet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_debug]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_debug](
	[zzzzsys_debug_id] [nvarchar](25) NOT NULL,
	[deb_message] [nvarchar](max) NULL,
	[deb_added] [int] NULL,
 CONSTRAINT [PK_zzzzsys_debug_zzzzsys_debug_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_debug_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_event]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_event](
	[zzzzsys_event_id] [nvarchar](25) NOT NULL,
	[sev_zzzzsys_object_id] [nvarchar](25) NULL,
	[sev_event] [nvarchar](100) NULL,
	[sev_javascript] [nvarchar](3000) NULL,
 CONSTRAINT [PK_zzzzsys_event_zzzzsys_event_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_file]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_file](
	[zzzzsys_file_id] [nvarchar](25) NOT NULL,
	[sfi_code] [nvarchar](300) NULL,
	[sfi_description] [nvarchar](300) NULL,
	[sfi_group] [nvarchar](300) NULL,
	[sfi_json] [nvarchar](max) NULL,
	[sfi_system] [nchar](1) NULL,
 CONSTRAINT [PK_zzzzsys_file_zzzzsys_file_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_file_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_format]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_format](
	[zzzzsys_format_id] [nvarchar](25) NOT NULL,
	[srm_type] [nvarchar](10) NULL,
	[srm_format] [nvarchar](300) NULL,
	[srm_currency] [nvarchar](25) NULL,
 CONSTRAINT [PK_zzzzsys_format_zzzzsys_format_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_format_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_info]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_info](
	[zzzzsys_info_id] [nvarchar](25) NOT NULL,
	[inf_code] [nvarchar](255) NULL,
	[inf_details] [nvarchar](255) NULL,
 CONSTRAINT [PK_zzzzsys_info_zzzzsys_info_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_note]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_note](
	[zzzzsys_note_id] [nvarchar](25) NOT NULL,
	[not_title] [nvarchar](60) NOT NULL,
	[not_content] [nvarchar](max) NULL,
	[not_updated_on] [datetime] NOT NULL,
	[not_zzzzsys_note_category_id] [nvarchar](25) NULL,
 CONSTRAINT [PK_zzzzsys_note_zzzzsys_note_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_note_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_note_category]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_note_category](
	[zzzzsys_note_category_id] [nvarchar](25) NOT NULL,
	[noc_name] [nvarchar](1000) NULL,
 CONSTRAINT [PK_zzzzsys_note_category_zzzzsys_note_category_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_note_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_object]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_object](
	[zzzzsys_object_id] [nvarchar](25) NOT NULL,
	[sob_all_zzzzsys_form_id] [nvarchar](25) NULL,
	[sob_all_table] [nvarchar](300) NULL,
	[sob_all_type] [nvarchar](20) NULL,
	[sob_all_id] [nvarchar](300) NULL,
	[sob_all_label] [nvarchar](1000) NULL,
	[sob_all_zzzzsys_tab_id] [nvarchar](25) NULL,
	[sob_all_order] [int] NULL,
	[sob_all_top] [int] NULL,
	[sob_all_left] [int] NULL,
	[sob_all_width] [int] NULL,
	[sob_all_height] [int] NULL,
	[sob_all_cloneable] [nvarchar](1) NULL,
	[sob_all_align] [nvarchar](10) NULL,
	[sob_all_validate] [nvarchar](1) NULL,
	[sob_all_access] [nvarchar](1) NULL,
	[sob_calc_formula] [nvarchar](3000) NULL,
	[sob_calc_format] [nvarchar](30) NULL,
	[sob_run_zzzzsys_form_id] [nvarchar](50) NULL,
	[sob_run_filter] [nvarchar](300) NULL,
	[sob_run_method] [nvarchar](1) NULL,
	[sob_run_id] [nvarchar](50) NULL,
	[sob_display_sql] [nvarchar](max) NULL,
	[sob_select_multiple] [nvarchar](1) NULL,
	[sob_select_2] [nvarchar](1) NULL,
	[sob_select_sql] [nvarchar](max) NULL,
	[sob_lookup_code] [nvarchar](50) NULL,
	[sob_lookup_description] [nvarchar](300) NULL,
	[sob_lookup_description_width] [nvarchar](4) NULL,
	[sob_lookup_autocomplete] [nvarchar](1) NULL,
	[sob_lookup_zzzzsys_form_id] [nvarchar](50) NULL,
	[sob_lookup_javascript] [nvarchar](max) NULL,
	[sob_lookup_php] [nvarchar](25) NULL,
	[sob_lookup_table] [nvarchar](500) NULL,
	[sob_subform_zzzzsys_form_id] [nvarchar](50) NULL,
	[sob_subform_foreign_key] [nvarchar](100) NULL,
	[sob_subform_add] [nvarchar](1) NULL,
	[sob_subform_delete] [nvarchar](1) NULL,
	[sob_subform_type] [nvarchar](10) NULL,
	[sob_subform_table] [nvarchar](300) NULL,
	[sob_input_count] [bigint] NULL,
	[sob_input_format] [nvarchar](30) NULL,
	[sob_input_type] [nvarchar](30) NULL,
	[sob_input_javascript] [nvarchar](max) NULL,
	[sob_input_datalist] [nvarchar](max) NULL,
	[sob_html_code] [nvarchar](max) NULL,
	[sob_html_chart_type] [nvarchar](70) NULL,
	[sob_html_javascript] [nvarchar](1000) NULL,
	[sob_html_title] [nvarchar](70) NULL,
	[sob_html_vertical_label] [nvarchar](70) NULL,
	[sob_html_horizontal_label] [nvarchar](70) NULL,
	[sob_image_zzzzsys_file_id] [nvarchar](25) NULL,
 CONSTRAINT [PK_zzzzsys_object_zzzzsys_object_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_object_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_select_clause]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_select_clause](
	[zzzzsys_select_clause_id] [nvarchar](25) NOT NULL,
	[ssc_zzzzsys_select_id] [nvarchar](25) NULL,
	[ssc_type] [nvarchar](300) NULL,
	[ssc_field] [nvarchar](500) NULL,
	[ssc_clause] [nvarchar](500) NULL,
	[ssc_sort] [nvarchar](10) NULL,
	[ssc_order] [nvarchar](500) NULL,
 CONSTRAINT [PK_zzzzsys_select_clause_zzzzsys_select_clause_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_select_clause_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_session]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_session](
	[zzzzsys_session_id] [nvarchar](25) NOT NULL,
	[sss_access] [nvarchar](max) NULL,
	[sss_hashcookies] [nvarchar](max) NULL,
	[sss_time] [int] NULL,
	[sss_login_time] [datetime] NULL,
 CONSTRAINT [PK_zzzzsys_session_zzzzsys_session_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_session_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_setup]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_setup](
	[zzzzsys_setup_id] [nvarchar](25) NOT NULL,
	[set_time_out_minutes] [int] NULL,
	[set_zzzzsys_timezone_id] [nvarchar](25) NULL,
	[set_language] [nvarchar](20) NULL,
	[set_languages_included] [nvarchar](1000) NULL,
	[set_smtp_username] [nvarchar](255) NULL,
	[set_smtp_password] [nvarchar](255) NULL,
	[set_smtp_host] [nvarchar](255) NULL,
	[set_smtp_from_address] [nvarchar](255) NULL,
	[set_smtp_from_name] [nvarchar](255) NULL,
	[set_smtp_port] [int] NULL,
	[set_smtp_use_authentication] [nvarchar](1) NULL,
	[set_smtp_use_ssl] [nvarchar](1) NULL,
	[set_header] [nvarchar](max) NULL,
	[set_denied] [nvarchar](1) NULL,
 CONSTRAINT [PK_zzzzsys_setup_zzzzsys_setup_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_setup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_tab]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_tab](
	[zzzzsys_tab_id] [nvarchar](25) NOT NULL,
	[syt_zzzzsys_form_id] [nvarchar](25) NULL,
	[syt_title] [nvarchar](250) NULL,
	[syt_order] [int] NULL,
	[syt_help] [nvarchar](3000) NULL,
 CONSTRAINT [PK_zzzzsys_tab_zzzzsys_tab_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_tab_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_timezone]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_timezone](
	[zzzzsys_timezone_id] [nvarchar](25) NOT NULL,
	[stz_timezone] [nvarchar](max) NULL,
 CONSTRAINT [PK_zzzzsys_timezone_zzzzsys_timezone_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_timezone_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_translate]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_translate](
	[zzzzsys_translate_id] [nvarchar](25) NOT NULL,
	[trl_language] [nvarchar](20) NULL,
	[trl_english] [nvarchar](500) NULL,
	[trl_translation] [nvarchar](500) NULL,
 CONSTRAINT [PK_zzzzsys_translate_zzzzsys_translate_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_translate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zzzzsys_user]    Script Date: 17.03.2021 19:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzzsys_user](
	[zzzzsys_user_id] [nvarchar](25) NOT NULL,
	[sus_zzzzsys_access_id] [nvarchar](25) NULL,
	[sus_language] [nvarchar](20) NULL,
	[sus_name] [nvarchar](50) NULL,
	[sus_code] [nvarchar](50) NULL,
	[sus_position] [nvarchar](50) NULL,
	[sus_department] [nvarchar](50) NULL,
	[sus_team] [nvarchar](50) NULL,
	[sus_email] [nvarchar](255) NULL,
	[sus_additional1] [nvarchar](100) NULL,
	[sus_additional2] [nvarchar](100) NULL,
	[sus_login_name] [nvarchar](50) NULL,
	[sus_login_password] [nvarchar](300) NULL,
	[sus_expires_on] [datetime2](0) NULL,
 CONSTRAINT [PK_zzzzsys_user_zzzzsys_user_id] PRIMARY KEY CLUSTERED 
(
	[zzzzsys_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3746cc1b', N'nuuser', N'Language', N'sus_language', N'l', N'', 50, 95)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3747d41c', N'nuuser', N'Username', N'sus_login_name', N'l', N'', 20, 140)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37487772', N'nulaunchform', N'Type', N'sfo_type', N'l', N'', 10, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3749102a', N'nulaunchform', N'Code', N'sfo_code', N'l', N'', 20, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3749a37d', N'nulaunchform', N'Description', N'sfo_description', N'l', N'', 30, 250)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb374a3c61', N'nutablookup', N'Tab', N'syt_title', N'l', N'', 10, 200)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb374ae1fc', N'nutablookup', N'Form', N'sfo_description', N'l', N'', 20, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb374b7c3b', N'nutablookup', N'Code', N'sfo_code', N'l', N'', 30, 160)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb374c102f', N'nutablookup', N'Type', N'sfo_type', N'l', N'', 40, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb374ca5aa', N'nuform', N'Code', N'sfo_code', N'l', N'', 30, 250)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb374d3dbc', N'nuform', N'Description', N'sfo_description', N'l', N'', 40, 440)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb374dd13c', N'nutab', N'Form', N'sfo_description', N'l', N'', 20, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb374f3729', N'nutab', N'Tab', N'syt_title', N'l', N'', 10, 200)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37505eea', N'nuobject', N'Form', N'sfo_description', N'l', N'', 60, 210)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37547640', N'nuobject', N'Tab', N'syt_title', N'l', N'', 70, 135)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb375a3782', N'nuobject', N'Object', N'sob_all_id', N'l', N'', 30, 235)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb375afa75', N'nuobject', N'Type', N'sob_all_type', N'l', N'', 10, 70)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb375bd72e', N'nuobject', N'Label', N'sob_all_label', N'l', N'', 50, 240)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb375c8f2a', N'nutab', N'Type', N'sfo_type', N'l', N'', 40, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb375d23fd', N'nunonsystemform', N'Code', N'sfo_code', N'l', N'', 20, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb375dbd9c', N'nunonsystemform', N'Description', N'sfo_description', N'l', N'', 30, 250)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb375e5588', N'nunonsystemform', N'Type', N'sfo_type', N'l', N'', 10, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb375eeb8e', N'nuaccess', N'Code', N'sal_code', N'l', N'', 10, 240)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb375f8259', N'nuaccess', N'Description', N'sal_description', N'l', N'', 20, 320)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376017c8', N'nuuser', N'Name', N'sus_name', N'l', N'', 10, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3760ae9a', N'nuuser', N'Email', N'sus_email', N'l', N'', 30, 225)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376141d0', N'nuuser', N'Access Level', N'sal_description', N'l', N'', 40, 210)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3761e561', N'nuphp', N'Code', N'sph_code', N'l', N'', 10, 245)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37627eb1', N'nuphp', N'Description', N'sph_description', N'l', N'', 20, 585)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37631164', N'nubuildreport', N'Code', N'sre_code', N'l', N'', 10, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3763a5b4', N'nubuildreport', N'Description', N'sre_description', N'l', N'', 20, 345)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3764389f', N'nuform', N'Type', N'sfo_type', N'l', N'', 20, 80)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3764cb3b', N'nubuildreport', N'Launch From', N'CONCAT(sfo_code, '' - '', sfo_description)', N'l', N'', 40, 300)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376560e0', N'nurun', N'Type', N'type', N'l', N'', 10, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3765f712', N'nurun', N'Code', N'code', N'l', N'', 20, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37668ca4', N'nurun', N'Description', N'description', N'l', N'', 30, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37672072', N'nurunlist', N'Type', N'run', N'l', N'', 10, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3767b4d5', N'nurunlist', N'Code', N'code', N'l', N'', 20, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376849b6', N'nurunlist', N'Description', N'description', N'l', N'', 30, 250)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3768dd0c', N'nudebug', N'Message', N'deb_message', N'l', N'', 10, 700)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37697a01', N'nuaccesslevelreport', N'1', N'1', N'l', N'', 10, 1)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376a1655', N'nutab', N'Code', N'sfo_code', N'l', N'', 30, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376aaab5', N'nubrowse', N'Title', N'sbr_title', N'l', N'', 20, 240)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376b3dd7', N'nubuildreport', N'Group', N'sre_group', N'l', N'', 30, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376bd159', N'nuphp', N'Group', N'sph_group', N'l', N'', 30, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376c65d3', N'nurunreport', N'Code', N'sre_code', N'l', N'', 20, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376cf902', N'nurunreport', N'Description', N'sre_description', N'l', N'', 30, 250)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376d900a', N'nurunreport', N'Group', N'sre_group', N'l', N'', 40, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376e2688', N'nurunphp', N'Code', N'sph_code', N'l', N'', 20, 205)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376eb9d6', N'nurunphp', N'Description', N'sph_description', N'l', N'', 30, 420)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376f4f5f', N'nurunphp', N'Group', N'sph_group', N'l', N'', 40, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb376fe259', N'nurunreport', N'Form', N'sre_zzzzsys_form_id', N'l', N'', 10, 0)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37707660', N'nurunphp', N'PHP', N'sph_zzzzsys_form_id', N'l', N'', 10, 0)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3771115d', N'nuobject', N'i', N'zzzzsys_form_id', N'l', N'', 40, 0)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3771b003', N'nuphp', N'Launch From', N'CONCAT(sfo_code, '' - '', sfo_description)', N'l', N'', 40, 300)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37724836', N'nutimezone', N'Time Zone', N'stz_timezone', N'l', N'', 10, 350)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3772dd22', N'nutranslate', N'Language', N'trl_language', N'l', N'', 10, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37737185', N'nutranslate', N'English', N'trl_english', N'l', N'', 20, 345)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb377406bb', N'nutranslate', N'Translation', N'trl_translation', N'l', N'', 30, 430)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37749ba7', N'nucalcobjects', N'object.subform', N'CONCAT(thechild,IF(theparent = '''','''',''.''),theparent)', N'c', N'', 10, 200)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb377531c6', N'nucalcobjects', N' ', N'theform', N'l', N'', 30, 0)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37765e82', N'nucalcobjects', N' ', N'thevalue', N'l', N'', 40, 2)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3777c5ee', N'nucalcobjects', N'Object', N'thechild', N'l', N'', 20, 0)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb377899bf', N'nuformat', N'Type', N'srm_type', N'l', N'', 20, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3779593d', N'nuformat', N'Format', N'srm_format', N'l', N'', 10, 190)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb377a01b0', N'nuobject', N'Input Type', N'sob_input_type', N'l', N'', 20, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb377a9e19', N'nubrowse', N'join', N'sbr_zzzzsys_form_id', N'l', N'', 10, 0)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb377b6a58', N'nuform', N'Table', N'sfo_table', N'l', N'', 50, 270)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb377c33ea', N'nufile', N'Code', N'sfi_code', N'l', N'', 10, 200)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb377d2981', N'nufile', N'Description', N'sfi_description', N'l', N'', 20, 350)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3781d394', N'nufile', N'JSON', N'sfi_json', N'l', N'', 30, 0)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3783715c', N'nufile', N'Image', N'NULL', N'l', N'', 40, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37849637', N'nufile', N'Group', N'sfi_group', N'l', N'', 50, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3786de92', N'nuselect', N'Description', N'sse_description', N'l', N'', 10, 350)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3787ca71', N'nulaunchable', N'Type', N'sfo_type', N'l', N'', 10, 80)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb37889036', N'nulaunchable', N'Code', N'sfo_code', N'l', N'', 20, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb3789662e', N'nulaunchable', N'Description', N'sfo_description', N'l', N'', 30, 400)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb378aa4cf', N'nulaunchable', N'Table', N'sfo_table', N'l', N'', 40, 200)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb378b79f4', N'nudebug', N'When', N'deb_added', N'l', N'', 20, 130)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb378c316b', N'nubuildtable', N'Code', N'code', N'l', N'', 10, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5bad6cb378cf278', N'nubuildtable', N'Description', N'description', N'l', N'', 20, 300)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5f9aaac9719b88c', N'nucloner', N'Form Source', N'clo_form_source', N'l', N'', 10, 120)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5f9aaac971c84e2', N'nucloner', N'Form Destination', N'clo_form_dest', N'l', N'', 20, 190)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5f9aaac971ec977', N'nucloner', N'Dump SQL', N'REPLACE(REPLACE(clo_dump,1,''✔''),0,'''')', N'l', N'', 30, 110)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5f9aaac971fc30c', N'nucloner', N'Include Objects', N'REPLACE(REPLACE(clo_objects,1,''✔''),0,'''')', N'l', N'', 40, 130)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5f9c04dbab4da92', N'nucloner', N'Notes', N'clo_notes', N'l', N'', 50, 350)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fd29810a628f4f', N'nunotes', N'Note', N'not_title', N'l', N'', 20, 720)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fd29810a62a421', N'nunotes', N'Category', N'noc_name', N'l', N'', 10, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fd3b22fa460a12', N'nunotescategroy', N'Category', N'noc_name', N'l', N'', 10, 310)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fd3bb4dc0d2841', N'nunotes', N'Updated on', N'not_updated_on', N'l', N'', 30, 145)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fd5b7fc8c163a3', N'nuuser', N'Code', N'sal_code', N'l', N'', 60, 155)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fd5b7fc8de0c57', N'nuuser', N'Position', N'sus_position', N'l', N'', 70, 125)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fd5b7fc8fad224', N'nuuser', N'Team', N'sus_team', N'l', N'', 90, 100)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fd8d2459834722', N'nutranslate', N'Added by User', N'IF(zzzzsys_translate_id like ''nu%'','''',''✔'')', N'l', N'', 40, 140)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fd8ed3051616cd', N'nusession', N'Login', N'login', N'l', N'', 20, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fd8ed305162c77', N'nusession', N'Username', N'user', N'l', N'', 30, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fd8ed3051639e7', N'nusession', N'Login Time', N'login_time', N'l', N'', 10, 150)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fdb1b5b3fd1be7', N'nucodesnippet', N'Code', N'cot_code', N'l', N'', 20, 215)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fdb1b5b407a6f1', N'nucodesnippet', N'Description', N'cot_description', N'l', N'', 30, 700)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fdb1b5b408a860', N'nucodesnippet', N'Language', N'cot_language', N'l', N'', 10, 85)
GO
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fdb668a2947958', N'nuobject', N'Access', N'REPLACE(REPLACE(REPLACE(sob_all_access, 0,''Editable''),1,''Readonly''),2,''Hidden'')', N'l', N'', 80, 65)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fdb67accbbfa6d', N'nuobject', N'Validation', N'REPLACE(REPLACE(REPLACE(sob_all_validate, 0,''None''),1,''No Blanks''),2,''No Duplicates'')', N'l', N'', 90, 95)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fdb689731ed0db', N'nuobject', N'Align', N'sob_all_align', N'l', N'', 100, 55)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fdcc69ceb26325', N'nucodesnippet', N'Changed On', N'cot_updated_on', N'l', N'', 40, 130)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fdfd91ab3a0d63', N'nusession', N'IP Address', N'ip', N'l', N'', 40, 120)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fe0352637b2e4f', N'nuuser', N'Expires On', N'sus_expires_on', N'l', N'D|yyyy-mm-dd', 100, 90)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fe035b0d058339', N'nuuser', N'Department', N'sus_department', N'l', N'', 80, 90)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fe179294648601', N'nuform', N'Preview', N'null', N'l', N'', 10, 65)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5fed7ae8d82586a', N'nuobjectgrid', N'Code', N'sfo_code', N'l', N'', 10, 250)
INSERT [dbo].[zzzzsys_browse] ([zzzzsys_browse_id], [sbr_zzzzsys_form_id], [sbr_title], [sbr_display], [sbr_align], [sbr_format], [sbr_order], [sbr_width]) VALUES (N'nu5ff0df492665285', N'nuaccess', N'Home', N'sfo_code', N'l', N'', 30, 35)
GO
INSERT [dbo].[zzzzsys_code_snippet] ([zzzzsys_code_snippet_id], [cot_code], [cot_description], [cot_url], [cot_source_code], [cot_language], [cot_scope], [cot_updated_on]) VALUES (N'6049c4ce3805888', N'asdf', NULL, NULL, N'sdf', NULL, NULL, CAST(N'2021-03-11T08:20:46.230' AS DateTime))
INSERT [dbo].[zzzzsys_code_snippet] ([zzzzsys_code_snippet_id], [cot_code], [cot_description], [cot_url], [cot_source_code], [cot_language], [cot_scope], [cot_updated_on]) VALUES (N'nu5fdb1a7c5b3d3b2', N'nuBeforeSave', N'Before a record is saved, nuBuilder checks for the existance of a function called nuBeforeSave().
If this exists it will use its return value to decide whether to continue saving the record.', N'https://wiki.nubuilder.net/nubuilderforte/index.php/Javascript#nuBeforeSave', N'function nuBeforeSave(){

    if( $(''#cus_name'').val() === ''something'' ){ /* condition(s) here */ 
        
        nuMessage([''Message here.'']);

        // Cancel saving         
        return false;

    }

    // Continue Saving
    return true;
    
} ', N'JavaScript', N'["0"]', CAST(N'2020-12-15T22:23:13.000' AS DateTime))
GO
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb378ec061', N'nu5a3e518de1c9d39', N'afterinsertrow', N'nuChart(''chart'', ''ComboChart'', ''nuSubformObject("sfa").chartData'', ''1'', ''44'', '''', ''bars'', false);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb378f8a07', N'nu5a441af14f14218', N'afterinsertrow', N'nuChart(''chart'', ''ComboChart'', ''nuSubformObject("sfa").chartData'', ''1'', ''44'', '''', ''bars'', false);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37904b65', N'nu5bad6cb366576fb', N'afterinsertrow', N'nuTestChart();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37911d4e', N'nu5bad6cb363bb5b7', N'onchange', N'nuTestChart();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb3791fc33', N'nu5bad6cb3647b4cb', N'onchange', N'nuTestChart();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb3792a2a1', N'nu5bad6cb364add63', N'onchange', N'nuTestChart();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37933f0c', N'nu5bad6cb36568f2b', N'onchange', N'nuTestChart();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb3793d45a', N'nu5bad6cb328be090', N'afterinsertrow', N'$("[id$=''syt_help'']").addClass(''js'')')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37947239', N'nu5bad6cb3625fd05', N'onclick', N'window.open("http://wiki.nubuilder.net/nubuilderforte/index.php/" + window.nuHelp);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37957561', N'nu5bad6cb36283501', N'onclick', N'window.open("http://wiki.nubuilder.net/nubuilderforte/index.php/" + window.nuHelp);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37966261', N'nu5bad6cb35cce14b', N'onclick', N'nuStartDatabaseAdmin();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb3797b0a7', N'nu5bad6cb32930450', N'onclick', N'window.open(''core/nureportdesigner.php?tt='' + $("#sre_zzzzsys_php_id").val() + ''&launch='' + $("#sre_zzzzsys_form_id").val());')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb3798566b', N'nu5bad6cb329fdf13', N'onchange', N'nuObjectColor();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb3798ef56', N'nu5bad6cb3263f2a8', N'onchange', N'nuTypeChanged();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb379988c5', N'nu5bad6cb34c005d7', N'onclick', N'nuPopPHP(event, ''BE'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb379a3d0a', N'nu5bad6cb34c4775c', N'onclick', N'nuPopPHP(event, ''BS'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb379b055d', N'nu5bad6cb34d23de5', N'onclick', N'nuPopPHP(event, ''AS'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb379bcdcc', N'nu5bad6cb34d7e1db', N'onclick', N'nuPopPHP(event, ''BD'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb379ec280', N'nu5bad6cb34e2eaec', N'onclick', N'nuPopPHP(event, ''AD'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37a13d93', N'nu5bad6cb329136ba', N'onclick', N'nuPopPHP(event, ''BB'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37a4de1d', N'nu5bad6cb34b050a0', N'onclick', N'nuPopPHP(event, ''AB'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37a6a213', N'nu5bad6cb34e5cc53', N'onclick', N'nuPreview()')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37add513', N'nu5bad6cb326ddb36', N'onkeydo', N'nuFORM.scrollList(event, nuFORM.tableFields($(''#sfo_table'').val()))')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37af380e', N'nu5bad6cb34fa79c0', N'onchange', N'nuSetFormatType(1)')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b01a0f', N'nu5bad6cb32c4d9de', N'onchange', N'nuInputTypeChanged(this.value)')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b0e5e5', N'nu5bad6cb3518a9c0', N'onclick', N'nuPreview(1)')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b1b592', N'nu5bad6cb32812c21', N'onclick', N'nuPopPHP(event, ''BB'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b274c5', N'nu5bad6cb325c8954', N'afterinsertrow', N'$("[id$=''sev_javascript'']").addClass(''js'')')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b32126', N'nu5bad6cb32b77005', N'onclick', N'nuPopPHP(event, ''BB'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b42053', N'nu5bad6cb32b9715a', N'onclick', N'nuPopPHP(event, ''BB'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b514a7', N'nu5bad6cb352b1230', N'onclick', N'nuPopPHP(event, ''BB'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b5e79f', N'nu5bad6cb35304ffd', N'onkeydown', N'nuFORM.scrollList(event, window.nuObjectFields);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b6ab21', N'nu5bad6cb3568c736', N'onclick', N'nuPopup(''nusample'',''-1'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b75849', N'nu5bad6cb35a0a29e', N'onclick', N'nuResizeSQL();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b853f4', N'nu5bad6cb35a52325', N'onchange', N'nuAddSQLTable(event);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37b91ff1', N'nu5bad6cb35b23983', N'onchange', N'$(''#sqlframe'').contents().find(''body'').css(''zoom'', this.value / 100)')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37ba5b09', N'nu5bad6cb35ab1f0a', N'onchange', N'nuWhereClauses();$(''#sqlframe'')[0].contentWindow.nuSQL.buildSQL()')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37bb54ac', N'nu5bad6cb35afa1d0', N'onchange', N'$(''#sqlframe'')[0].contentWindow.nuSQL.buildSQL()')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37bc1b7a', N'nu5bad6cb35ad7f0a', N'onchange', N'$(''#sqlframe'')[0].contentWindow.nuSQL.buildSQL()')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37bcc8fb', N'nu5bad6cb35b860e2', N'onchange', N'$(''#sqlframe'')[0].contentWindow.nuSQL.buildSQL()')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37bd72d2', N'nu5bad6cb35a8885a', N'onchange', N'$(''#sqlframe'')[0].contentWindow.nuSQL.buildSQL()')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37be22f4', N'nu5bad6cb34ee220e', N'onfocus', N'nuFocusFFObject(event);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37beca3a', N'nu5bad6cb34ebf5bd', N'onfocus', N'nuFocusFFObject(event);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37bf8698', N'nu5bad6cb352dce42', N'onchange', N'nuSetFFTable();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37c0be93', N'nu5bad6cb34f0470a', N'afterinsertrow', N'nuSetFFTable();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37c22211', N'nu5bad6cb35cf61c0', N'onclick', N'nuPopSQL(event, ''BR'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37c317ec', N'nu5bad6cb35d26e8f', N'onclick', N'nuPopSQL(event, ''DI'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37c45b5b', N'nu5bad6cb35d48819', N'onclick', N'nuPopSQL(event, ''SE'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37c5a112', N'nu5bad6cb35d6b273', N'onfocus', N'nuFocusFFObject(event);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37c67eb0', N'nu5a2f31a336db937', N'onclick', N'alert(''Do Something!'')')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37c73e80', N'nu5bad6cb35dadfc5', N'onchange', N'nuFormColor();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37c8878d', N'nu5bad6cb35dd12bb', N'onclick', N'nuPopPHP(event, ''BB'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37ca3577', N'nu5bad6cb35b23983', N'afterinsertrow', N'nuSetSFCB();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37cba151', N'nu5bad6cb35ebbc60', N'onclick', N'nuGetCSV();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37ccc397', N'nu5bad6cb35ff457a', N'onclick', N'nuPopPHP(event, ''BB'');')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37cda28d', N'nu5bad6cb366e865e', N'onchange', N'nuSetFFTable();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bad6cb37ce6dae', N'nu5bad6cb3670b7db', N'onclick', N'nuPickTableType();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5bd8f419d886e17', N'nu5bad6cb327ab3b8', N'afterinsertrow', N'default_description()')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5f7129d5424e73c', N'nu5f711b9351ae752', N'onchange', N'nuCSVTransfer(this.value)')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fab41c055475d8', N'nu5bad6cb3513b16c', N'onchange', N'nuAddToFormat();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fab41d07a80c9b', N'nu5fab2f8952634e4', N'onchange', N'nuAddToFormat();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fab41e0265f1e4', N'nu5fab2fa48a504e4', N'onchange', N'nuAddToFormat();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fab41f0d3d7845', N'nu5fab2fb6e66f19b', N'onchange', N'nuAddToFormat();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fd6f92d9463a40', N'nu5fd6f828a1e42b1', N'onclick', N'nuSetSelectIndex(''sob_all_cloneable'',1)')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fd6f95baab794b', N'nu5fd6f7819d659bc', N'onclick', N'nuSetSelectIndex(''sob_all_cloneable'',2);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fd6fa042a999b1', N'nu5fd6fa0428adcd3', N'onclick', N'nuSetSelectIndex(''sob_all_align'',1);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fd6fbe95e24346', N'nu5fd6fbe95c2c61d', N'onclick', N'nuSetSelectIndex(''sob_all_align'',2);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fd6fc4a7f52ae6', N'nu5fd6fc4a7ccf484', N'onclick', N'nuSetSelectIndex(''sob_all_align'',3);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fd6fdad3ae76f5', N'nu5fd6fdad38e8f5d', N'onclick', N'nuSetSelectIndex(''sob_all_validate'',2);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fd6fddaeb44cc3', N'nu5fd6fddae953fd3', N'onclick', N'nuSetSelectIndex(''sob_all_access'',3);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fd6ff14af381f2', N'nu5fd6ff14ad0870d', N'onclick', N'nuSetSelectIndex(''sob_all_access'',1);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fd6ff6a110d480', N'nu5fd6ff6a0ef6017', N'onclick', N'nuSetSelectIndex(''sob_all_access'',2);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fd757f92870577', N'nu5fd757f9266ea99', N'onclick', N'nuSetSelectIndex(''sob_all_validate'',1);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fd7583fbf9bde0', N'nu5fd7583fbdb0750', N'onclick', N'nuSetSelectIndex(''sob_all_validate'',3);')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fdbe04a014fa', N'nu5fdbe049f365a', N'onclick', N'if (nuIsSaved()) {   var fid = nuSubformRowId(this); nuPopup(''nuObject'', fid);} else {  nuMessage(["Please save any changes before leaving this form."])}    ')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fdcde23d59bc7a', N'nu5fdcde23d2db265', N'onchange', N'nuFormColor();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fddb7fc8b5b539', N'nu5bad6cb32a1c004', N'onchange', N'nuShowDataType();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fdf83039b7f6d6', N'nu5fee9ff762770', N'afterinsertrow', N'nuUpdateAclCount();();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fe039482957fb0', N'nu5fe038d847fbb70', N'onchange', N'nuTogglePasswordVisibility();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fe06a07c9e9567', N'nu5fe0547b841fb32', N'onclick', N'nu2FAVerify();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fe1b140081ce8c', N'nu5fe1aeac3363ae7', N'onclick', N'inDBVersion();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fe1b155b2648e4', N'nu5fe1b155aed9e46', N'onclick', N'inFilesVersion();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fecdc0b9678ebf', N'nu5fa249be5df47ad', N'onclick', N'cloSubformsChecked();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fecde321f82513', N'nu5fa959f97244564', N'onclick', N'cloIframeFormsChecked();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5fed986754a8a23', N'nu5fed8c73e475b16', N'onclick', N'nuForm("nuobjectgrid",nuCurrentProperties().record_id,"", "", 2)')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5ff0364d11e7498', N'nu5ff0352f501ba8c', N'onclick', N'if ($(this).prop(''checked'')) { nuEnable(''sob_calc_formula''); $(''#sob_calc_formula'').focus(); } else { nuDisable(''sob_calc_formula''); }')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5ff0b31354688aa', N'nu5bad6cb32e1a66a', N'onchange', N'nuSetLookupWidth()')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5ff0b329e242e25', N'nu5bad6cb32e47d18', N'onchange', N'nuSetLookupWidth()')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5ff32fdade879d8', N'nu5ff32fdadb8f46f', N'onclick', N'var form_id =  $(''#sob_lookup_zzzzsys_form_id'').val(); if (form_id !== '''') { 	nuForm(''nuform'',form_id,'''','''',2);} else { nuMessage([nuTranslate(''Select a (Lookup) Form first.'')]); }')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5ff4a8cb2258088', N'nu5ff4a82b76d96d6', N'onclick', N'nuPopup(''nuemailtest'',''-1'')')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5ff4b6479adf58a', N'nu5ff4b5f53f85f69', N'onclick', N'loadDatafromLS();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5ff4b67643ec503', N'nu5ff4b56934a1973', N'onclick', N'saveDatatoLS();')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5ff5b7b1bb92f1a', N'nu5ff5b7b1b918a4b', N'onclick', N'var form_id =  $(''#sob_run_zzzzsys_form_id'').val(); if (form_id !== '''') { 	nuForm(''nuform'',form_id,'''','''',2);} else { nuMessage([nuTranslate(''Select a (Run) Form first.'')]); }')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu5ff727ad73226b8', N'nu5ff727ad6f17b85', N'onclick', N'var id =  $(''#sus_zzzzsys_access_id'').val(); if (id !== '''') { 	nuForm(''nuaccess'',id,'''','''',2);} else { nuMessage([nuTranslate(''Select an Access Level first.'')]); }')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu60013e0629f72ae', N'nu60013e0626d80ce', N'onclick', N'var form_id =  $(''#sob_subform_zzzzsys_form_id'').val(); if (form_id !== '''') { 	nuForm(''nuform'',form_id,'''','''',2);} else { nuMessage([nuTranslate(''Select a Form (Subform) first.'')]); }')
INSERT [dbo].[zzzzsys_event] ([zzzzsys_event_id], [sev_zzzzsys_object_id], [sev_event], [sev_javascript]) VALUES (N'nu60028804f2e662b', N'nu60028804f043b86', N'onclick', N'var objType =  $("#sob_all_type option:selected").text(); if (objType !== '''') { nuSelectTabByTitle(objType); } else { nuMessage([nuTranslate(''Select a Type first.'')]); }')
GO
INSERT [dbo].[zzzzsys_file] ([zzzzsys_file_id], [sfi_code], [sfi_description], [sfi_group], [sfi_json], [sfi_system]) VALUES (N'nu5bad6cb37d02d01', N'nubuilder', N'Logo', N'nubuilder', N'{"file":"ZGF0YTppbWFnZS9wbmc7YmFzZTY0LGlWQk9SdzBLR2dvQUFBQU5TVWhFVWdBQUFLc0FBQUErQ0FZQUFBQlVRK3ZwQUFBQUNYQklXWE1BQUJZbEFBQVdKUUZKVWlUd0FBQUFCM1JKVFVVSDRRa2FGaklXSW5lSjd3QUFEaU5KUkVGVWVOcnRuWHQwVmRXZHh6Ky9jMjRTREkvY1JHUUVIL1d4ckFwVDYyUFZCMUt4dGVPcWRvb1FHclNEdFlJSWdWbXVsclpNeHlrelZNZDIydFdwenVCQURRWE1XTmU0SkNhcHNUaUY2Um9meXlxMkkzMkF1S3d3Z3c5SUVEQTNQQkx1NDV6Zi9ISE92ZmZrNXB4N0UvSzg1SHl6ZHU2OVorK3p6MzU4OTIvLzltOC9qcWdxSVVJVUE0eXdDRUtFWkEwUklpUnJpSkNzSVVLTWNFUUNmZXJsUmt4bVlISm1qMUEyWUNGWVlMdWZKQkVTUUJ4SUlDUVFrb0RTYVJqczRoaFBzMXFQcEtPNHJWbm1Zek94VzhzUnVrVDR1U3EzV2pERlVNb1JmbTladlBaY2plNERxRzZXMHkyYk8zT1Rxd1p2dE16UlYyWTF5YWRFbWQ0am84S214bXB0bFliMmN6SGxpUUxsWWlQU2h0cnZnL0VPWlRUcUZ5cmFCNk1DcExIOVI0aDh5dGZUaXQ2RTJiRUE5RTUvZjN1WjFsVHRLdmlNaG8rbVlocHJnMnBhcTZQMXhVdldmNWUvb1pUWm1DaW1LMys5TXRoeTcweUJZVGtrVlVXd2tReVJEY1Q5UTJFR1k2bVdsYktJaHh6U2lYS2pDaGQwSTV5aU5ud0pNQVZRQWVBNncyVHBiVTN5WXBuRjkxTXdRVXhtNVNiWlZMcUFWeFF1RXVucG4xUitCYlJpMk9WZ3ppeFlNcXFBQUFweGVWU2FZMCtUc3I2ak5hZnZHK0MrN1RLVWZPazVId0w4amNqNFhqM0RaRUpnSFBCQzhhb0JUOGpWbERLYkVwUVNvQlIxdjJ2bWUvWWFSRkJLWGZLbXlaMzk3V25lVExSdHZwMlhINExrM09YRmpWM0NqY05UVERvRzVhdVk1Z3ZTY21oSzJDR1BGTEthWEVQRUpWMEpTZ1F5cEhSK3AwbnFYSE5KS3FiN1BRSVlLQ2FLUVRjanJpaFg4WUJFVGpheHBuREpNSmZYUmFRaXpTRnRSZ3BaRFNaaWRDZWlLMDNKa0RGTjVyVDBkTDlMbXFDRzUzbzN0bElLUkFOMUswVWpjS2R0ODQrKzhnM0tCcjFFUko0Q1hzNFQ0bXBwT0ZJMWNFSmJPb0dqQVM1RVhwMjFCTWtRemNnUWxveVVORnk5RkJSRlhISm1QMDBQVWRPNnJ1MkpQNDRFMWh0ME5GWnI2N3dHMGZod2xZaHRQNGxkdVFVenRoczR6NytKVzljQ3p3OElWNnVqYy9LMm5hYVFwUGtIV09KS3g2elRqSlJVbkpHSG5ia3VwTnl4aU5lbDViYjBQVkh4TXBUVThCV0sxbUJKTTYrZ0FXUVZZNHBEcFBZZmdwemhJNTBQNkp5Sys1MHdzZThDNS9xVThSR2RFLzI2Tk1XK0NVenpmYzZPNkNJKzBjc09vZVhRZUZLUmUwQ3ZCVGtIbFE0TWJjWG1aZFI0dHk5R1NtazVOQVVyY2pzMjV5Rk1BYzVFaUtPMEFXM0FUcXprTTFwenhyRnU5elczejBmbHBvQSsvRUVzbllISVRGVE9RblE4OEM3SWk1eFc4VE85aGZqSmtqWDdLVDZrRTFlSzVpb1Q0aE5Ic1VMcHhhSUorUkowdDJpNGxvUjNnUHZkZUc1RHVOd24vZ1BBMXhHOUdaV2JmYU9meXIyOUl0ZlBPNjdDam13RnFqSUZMNG9yVmhZaXhIdE4wcFQ1TUVUbUFwRnVkWmhiR21iSmFtbUsxV05GdjZVMUpGeVY1aHBnUVlBeGNEWWlsWm0wT1pnQk9wK3UyRXBwa3M5cWRjWC85azFuOVNaTVBYWlY3ZWFrVzlkdUIyUW94T0NyMkM4U3dkYm5IYUlHb3FDdUx3MEh4NUdLL0FMa2R2TFozN01ZRDl4SHBLTmVIdWlWM0s3TTQvY3gwSmErRDdEd2tOR3htWUx0R3Y0ZEp4bnkycDd2ZnM0T0NUem9PQno3QkRDcC93cGg1QitBSy9yZUErbVh1U3cyZXdCeU1rMmFZaC9yRzFsVEdWTGlNZktuWjZ5OHY4a1FXblBDcGovMVZDWHI4STMvZXRhZ1RNd2pMOTlDNVhiZ3VjSlpNbVlFRFNGQTdrWDFuL1BjZkczaExrQzNJbndOcEMzUDZIWnkzOGhxWjV3emNFcGxQaDJYY0srbHAxblQvaGFvN2M1aVdSNUNGeTlaeS9PWW05NHFqaXpZVCtyY2lrMElQODdMb3djd1FDOFA4SDVWcXl2V1UxNjUwbVdBWDNsY1hyZ3htQ3QxVG5RMW9rK2ZkTHYwbGF4WkFqcnoreW1FcE92UzF4eVhEZWNsdEkyZ2J0aGkxQU1iRHA0SjNCTGcvUVoyeGUrS0l5UFM1UkRGenQ4VHpNUUFUZ3RRQ1k4RHVLUDFaRUFNcFlYSm11cDBFM1Zzd0V4WGRoSXhzbU4remRoVnhaV1JYbjAyVGRRRXFFUHd0TFROcWhORngxUlppMWx5anI4K0w5dXdqTHUxcGloelZ2U0krRWxXQlJGRnNaR01uZFZycXJKYzBycWsxTFRrVGJuU051MktFMzVLL241VXY4M082SC9vcW01MmtCRERTdGE0SXpsZC9SUEp6bEIxTjJPbGRWU3YycEJ3cFd1eVNLVnFNRjRIUG1KcTBWdVBpeG85dTdvRTJmV29jZEFFb25GRVQ3Z3VrWFVrTXBJVWQvMnF1SnBOTVZmcVFaOXJjeERaakJsN1dSbzZ6ZzlwTTFJa2F5S2psMmJuK3IxVHFHUWxhMmJ0YXNwRDJtU1JTeC9WdXpHTnQ3SFpDVG9teDNjNkpzOUwvZDRyOU83elRvd0toZ2dYdTFQRzRLeS82MmY1SnRjZ2tRWmZ2MlBKM1gwbHEyVE1WdWtGS2VJWllLVUhXWDVrUFVXNmZwMWRzVWVhWXY4SitDd3kwVXVZRUwwRHFCOGxBdTBpWU5XQWxXMzF4RmFnZFdBa2E5TFZPM05YVHVXMk55dEh1ZzZ6UGRWU3hnSVl5dGdCa3UzSDhraWJ5d2t4QXRRQW0rTUlqcTAwU1hZUlMzYzFRRTVxS2xWUnloeTczWUQzVnNKTnN4dWxIT0hxSVNpM2FFaWRFVUJXUTNoVFliYUh2Rmw1MG4vczVidmEyWjhJVXVQWVg5S0ZSYytsM2FlcDhObXdTZ2NjT3hGZGsxOEl5Zjdoa2F5SDJheFYzQ0hDaFFNdS9VeFc5emVPNTIvUitHMk4wb0J3Ujhpam9WRGcyYXZWbFk4QlNIUHNWNmp2Q3E3ZkF5MURUOVk2VFJwL0swdHNXQzdDcDRFSi9WY24yVzNBR2g3UzE3S0RidDVTaU9WMDVjY0FyR01rakRLMjkyekF2QWZRTXBmMVgyeGloeWpUUlppdU1FR2h6WUJmbyt5MzRZYmNlMDF6Y05TUFVVYmM2ZmhQeXc3SjBOcC8zZUlQdE1NQXgxeXhRc1l5cmg4cXdIN2lVcWM5NXBTZm5hc1BCOTN5aTcvU2RtQkZIdFZYcVdZYnNFMlFSMm9hTURiVnFMZkFuZ3VaTlJvR1dMbjRrUjRmMlkxZGxYQ3VmbFFnUEQ0b0dHUHl0SkJEWWZHRVpCMFJrTTBkbFFRdkVRVFZOM3BOZEpHeVljdUl1ak53dGpFbWI3aVhzRUg4WitURVdkY3JEWlFTUElPVkdCbHF3T2hydmc4VDEvUEp0MGJUam13dkVNczUwaHhianNweDBFc0htWkY1aUNMenBUbjJOZ1pmelJ2REtteHA0bmZBZFQ1eFRKZkdqbm1ZZW1rZ1gxVC9FSkxWQjh0azR5ejdKSXp5SmllYTF1aXl3Z3QvVlM0dUVPSlJyUm4vdHZ2OUVINjdXeDFWNGVFaDJTWmhwcmFUaXZqWm5RR21vVFQya3ZTditwTlZ4eUFVV04xdmJBdko2aWZVME84QmY5N25ycDJ5bDhnM2hkcTdDdDFDVmVVM1BKSCtFdTNuak5tWEc5OC9ONTdzY1RoYUVxeldUVXNMcDJqV3hLUFMyTDRSa1h2N3g0VFVBNlFpbndNKzJiZUMxVTNzaURZek55VHJTTUdicUR6SXp1Z3ozUlpmSDR3K3hNVFlWSnlURC8zd29hdm5CVzVEbmhaUG5ET0Rzcy9rWHUvQ092cEVyMXR3NVZMTVdCeW9EYTVUMlFaNkRRRXprVHByNGxGcCt1Z3Z3WGdFWndHUFdlQ3B4MEdlWUV4MCtWQXRTRC9GeUtyYlFaN3g4MGxpT1JNUVJ1bEJzRmNVanNydXhEWjJZN0NiSFJWN2RSVjJydlRReFNTRjZEeWFZcDlHOVU1RUxuVExkQzhpT3pDVGRWaVJPU0NUZk9NSHp2YWMrTkM5WXNSa0Y4bzArNWVZUnNEWnNJbjN3RGxCQnFMM1NjdWhmeUpwTGtEa1Vwd2REMTBvZjBKbzFPcUtGNlN4WXg1R3p1a3dsdlZxSmtuVlZSOEFOZEwwMGRtSWVRZTJ1aWV5eUdSRVQ2RFNCdG9HOGlaZDFpYWRYM1drZTZPUlp6R2RpWnNlS0NrNTBPK0JiN0c5cmFWV051eklvd2JVUDZiM0xPaHRYRXRrWGJsQjZTU3dLa0VyRlV6RlBGeUNmZmdNUHRpM1NsZWxmTzZaREtXKzI1L0hNblkzUUNmSHpqZXdUbGUwSEl3UFN4aXpaN1hPUCtLSjQwSW9kVWJacE9wQnJ2U0p6bExNSzdMcVQ2cjlwN3JvZzl4QWQ4blB4cFlSbjFRQ1ZTbk1Tb2ZvVnJ1RkhZdVFPdEFyUGIxSU1PclVnTCtXdGVOc3lwYUIzaXFZMXl0V0pLMkFPdjl0VWtBclp4K3RsUTB2SzdvWjdQVjF1ampwK0J2THdmS1Z6SjBjZVFXNEVpaTNQVXZWRXB4STFNcUdMWXExdkU0WDd4SE1lckJtZUovck4zUVNyRDltQjRqRzQ4QkNnSHRrNC9nSTNDZm9yZVZ3SFlqaEhEMW11OFFXQkJNTDA2NlZEYjhWWkt0SjVGLy9UZTg2WE55R21sR0VKYkx1UW91eTF4VitxTWpNQW8xMVBQQUZRZGFDK1Q5TFpGMXZ6b2FkZ2Y5NUE2WEFGd1h6dDB0a1hYay9yU0VYUk5EWHhSbG9YbCtnRGczZ0drWC9Qa1Z5K3pKWmYxa29XWXNHNWdwZ2FwQUtBWklBWGR6VGtzQmxZTndQK2UyVndCOFV0b2t6NERyZHg3L1N4TGpLUnVzVU5ydXgxNHIvamxwYjBlOTRmdTl3TEdMNkxZRUEyNjA4RHBvQzN3UGR6cldSRmNCWFFySVdCM3lQWTFSNHQ4N1ZkV3RsNHcyZ1BsTFUrSHd2aGdCTDYzVGhhMHRsL1dGRi9zNHZSQXJUV0tjTG52VG80TGZpVDFhclRoZjlvR2RhNVRNQjl0di9lMHdYTG5Uam5BbDgzQ2ZNRGFGa0hUbTRybFkyclBHcDRHZnFkT0VMRWpEZkwzaVBoQXc2eDBvTGxwVWljVWRuNU1UZzdaclVnS2xUeWNtRCtEWEtTRWpXa1lPTFhaZERSdjBUUmZSV2toRGhBQ3RFa2VOVW14VFlaQkw1V3U3Vm81aEhoMVlDbEc2MHNiYjYrWTJoZEpCT0lOUXphMlc5dTIxSXpnckpPdUlobld2MDdyYmhUc1ZQOUs1OXdMNGhmbXdVNUw1UURRZ1JJcFNzSVFZUWUwcVFHd0FTNkYrQVZ2UWNhQnJIUTdLR0dBa3FVUEpSWGJnZm9GYldmeE9reDB1SkZOMFBiQWpWZ0JBaFFyS2UraEl4d0tOa3NmejA0Mkg1akY0MTRBUGdiSi9yazViSXV2SjJLbE5WeU9TQTZjeEJXckZrdHdhdHZESXduMTBxRzdjcWVoQjB6Mk82NkNuWHluQmV6OUQ2WjkrUWh0TlN0TmxRSHZUV2swTWhXWXNFaWpTSi8ydHdvb0o1b0lvak5nRW4wQWpTTWpocE1uWUZIOEdvbHlqcE40SExPOEJUenR0YzlYcWZ3SldkSFBrUXlnUHpZQ0RQaG1wQWtXQUs3LzlZMEpYZ3V3MWpYRkFsSzlTZHdGZzVHR2t5aWY4RUFsYlgrMkF5Ny84THpubXAyc2M4UEhLWThRK0ZrblVvTlR4a2kyTHZDcWlRMytTN2Q1V3Vzb0h2TFpUSDE1V2hOK09ZZU01U3BCSm5uMVNKUXJ1QnRpc2NBSGxKc2JiVTZlSTlubWorQ0xySm4zZ2E2MnQrMXVyUzlublNjRUVsUjI4QyswcEJvdXJzM3EwUTFDTk1wTldUaHdmdmxmVjFCdko1Z2M4Qms0RXFoU3B4U053T3hBUmFGZmx2SmZWZmRicjR2V0lYTmtXM3JTVkVhQTBJRVNJa2E0Z1FJVmxEaEdRTkVXS2s0djhCd2cxQWNlSk1iSU1BQUFBQVNVVk9SSzVDWUlJPQ==","name":"logo.png","size":3716,"type":"image/png"}', N' ')
GO
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nu5fdb9ffd45aaa', N'subform', N'nuobjectsubform', N'Forms Objects', N'zzzzsys_object', N'zzzzsys_object_id', N'', 0, 0, N'SELECT * FROM zzzzsys_object 
WHERE (sob_all_zzzzsys_tab_id = ''#sfo_tabs_filter#'' OR LOCATE(''#'', ''#sfo_tabs_filter#'') = 1 OR ''#sfo_tabs_filter#'' = '''')
ORDER BY sob_all_zzzzsys_tab_id, sob_all_order', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nu5fdb9ffd45efe', N'subform', N'nuaccesssubform', N'Accessible Forms', N'zzzzsys_access_form', N'zzzzsys_access_form_id', N'', 0, 0, N'SELECT * FROM zzzzsys_access_form', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nu5feb9ffd45efe', N'subform', N'nuaccesssubform_rep', N'Accessible Reports', N'zzzzsys_access_report', N'zzzzsys_access_report_id', N'', 0, 0, N'SELECT * FROM zzzzsys_access_report', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nu5fee9ffd45efe', N'subform', N'nuaccesssubform_php', N'Accessible PHP procs', N'zzzzsys_access_php', N'zzzzsys_access_php_id', N'', 0, 0, N'SELECT * FROM zzzzsys_access_php', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuaccess', N'browseedit', N'nuaccess', N'Access Levels', N'zzzzsys_access', N'zzzzsys_access_id', N'', 0, 17, N'SELECT zzzzsys_access.*, zzzzsys_form.sfo_code FROM zzzzsys_access
LEFT JOIN zzzzsys_form 
ON sal_zzzzsys_form_id = zzzzsys_form_id
ORDER BY sal_code
', N'if (nuIsNewRecord()) {
    nuSetTitle(nuTranslate(''New''));
} else {
    nuSetTitle($(''#sal_code'').val());
}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuaccessforms', N'edit', N'nuaccessforms', N'Accessible Forms', N'zzzzsys_access_form', N'zzzzsys_access_form_id', N'', 0, 0, N'SELECT * FROM zzzzsys_access_form
LEFT JOIN zzzzsys_form ON zzzzsys_form_id = slf_zzzzsys_form_id
ORDER BY sfo_code
', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuaccessgroup', N'subform', N'nuaccessgroup', N'Groups Access Level', N'zzzzsys_user_group_access_level', N'zzzzsys_user_group_access_level_id', N'', 0, 0, N'SELECT * FROM zzzzsys_user_group_access_level', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuaccesslevelreport', N'browseedit', N'nuaccesslevelreport', N'Access To Report', N'zzzzsys_access_report', N'zzzzsys_access_report_id', N'', 0, 0, N'SELECT * 
FROM zzzzsys_access_report
JOIN zzzzsys_report ON zzzzsys_report_id = sre_zzzzsys_report_id
ORDER BY sre_code', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuaccessreport', N'browseedit', N'nuaccessreport', N'Access To Procedures', N'zzzzsys_access_php', N'zzzzsys_access_php_id', N'', 0, 0, N'SELECT * 
FROM zzzzsys_access_php
JOIN zzzzsys_php ON zzzzsys_php_id = slp_zzzzsys_php_id
ORDER BY sph_code', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuauthentication', N'launch', N'nuauthentication', N'Authentication', N'', N'', N'', 0, 0, N'', N'function nuGet2FAProcedure() {
    var d = nuDevMode();
    var p = ''nuAuthentication2FA'';
    return d ? p + ''_Template'' : p;
}


function nu2FAVerify() {
    nuSetProperty(''auth_code_verify'',  $(''#auth_code'').val());
    nuSetProperty("nuauthcommand","verify");

    var p = nuGet2FAProcedure();
    nuRunPHPHidden(p ,0);
}

function handleEnterKey() {

    $(''#auth_code'').on(''keydown'', function(evt) {
      if (evt.key === ''Enter'') {
            evt.preventDefault();
            nu2FAVerify();
      }
    });

}

handleEnterKey();
nuHideHolders(0);

// Prevent [DOM] Password field is not contained in a form:
$("#auth_code_verify").wrap("<form id=''nuFromVerif'' action=''#'' method=''post'' onsubmit=''return false''>");')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nublank', N'launch', N'nublank', N'Blank', N'', N'', N'', 0, 0, N'', N'
nuSetTitle(nuFORM.getCurrent().run_description);
')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nubrowse', N'subform', N'nubrowse', N'Browse Columns', N'zzzzsys_browse', N'zzzzsys_browse_id', N'', 0, 5, N'SELECT * FROM zzzzsys_browse
ORDER BY sbr_order
', N'$(''#nuSearchButton'').remove();
$(''#nuSearchField'').remove();
$(''#nuPrintButton'').remove();

nuSetTitle($(''#sbr_title'').val());

var pid = parent.nuFORM.getCurrent().record_id;

if(nuFORM.getCurrent().record_id == -1){
    $(''#sbr_zzzzsys_form_id'').val(pid).change();
}
')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nubuildreport', N'browseedit', N'nubuildreport', N'Build Report', N'zzzzsys_report', N'zzzzsys_report_id', N'', 0, 0, N'SELECT * FROM zzzzsys_report
LEFT JOIN zzzzsys_form ON zzzzsys_form_id = sre_zzzzsys_form_id
ORDER BY sre_code', N'if (nuFormType() == ''edit'') {

  $(''#sre_layout'').addClass(''nuEdited''); 
  nuAttachButtonImage(''open_builder'',''RD'');
  
  if (! nuIsNewRecord()) {
//    nuAddActionButton(''Run'', ''Run'', ''nuRunReport("''+ $(''#sre_code'').val() +''")'');       
  }
  
}

function nuPickTableType(){
    
    var i   = $(''#sre_zzzzsys_php_id'').val();
    
    var f   = '''';
    var r   = '''';
    
    if(i.substr(0,10) == ''PROCEDURE:''){
        
        f   = ''nuphp'';
        r = i.substr(10);
        
    }
    
    if(i === ''''){
        
        nuMessage([nuTranslate(''Table selected must be an SQL or Procedure'')]);
        return;

    }
    
    if(i.substr(0,6) == ''TABLE:''){
        
        nuMessage(nuTranslate([''To edit a table go to the Database Button'']));
        return;

    }
    
    if(i.substr(0,4) == ''SQL:''){
        
        f   = ''nuselect'';
        r = i.substr(4);

    }
    
    nuPopup(f,r);
    
}

function nuUpdateAclCount() {
	var l = $("[data-nu-field=''sre_zzzzsys_access_id'']").length -2;
	var t = l <= 0 ? '''' : '' ('' + l + '')'';
	$(''#nuTab1'').html(nuTranslate(''Access Level'') + t);
}')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nubuildtable', N'browse', N'nubuildtable', N'PHP or SELECT or TABLE', N'zzzzsys_report_data', N'id', N'nuselect', 0, 0, N'SELECT * FROM zzzzsys_report_data
ORDER BY Code', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nucalcobjects', N'browse', N'nucalcobjects', N'Calc values On This Form And Its Subforms', N'#TABLE_ID#', N'thevalue', N'', 0, 4, N'SELECT * FROM #TABLE_ID#', N'
window.nuBrowseFunction = ''nuSelectCalcField'';

function nuSelectCalcField(e){

    var row = e.target.id.substr(0,8);
    var fld = $(''#'' + row + ''003'').html();
    var frm = $(''#sob_calc_formula'', parent.window.document).val();

    $(''#sob_calc_formula'', parent.window.document)
    .val(frm + ''nuTotal("'' + fld + ''")'')
    .trigger(''change'');

}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuclause', N'subform', N'nuclause', N'Select Clauses', N'zzzzsys_select_clause', N'zzzzsys_select_clause_id', N'', 0, 0, N'SELECT * FROM zzzzsys_select_clause
ORDER BY ssc_type, ssc_order', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nucloner', N'browseedit', N'nucloner', N'Cloner', N'zzzzsys_cloner', N'zzzzsys_cloner_id', NULL, NULL, NULL, N'SELECT * FROM zzzzsys_cloner', N'function refreshSelectObject(id) {
    nuSetProperty(''cloner_refresh_selectId'', id);
    nuRunPHPHidden("nucloner", 1);
}

function addRunButton() {
    nuAddActionButton(''nuRunPHPHidden'', ''Run'', ''runCloner()'');
    $(''#nunuRunPHPHiddenButton'').css(''background-color'', ''#117A65'');
}

function nuSelectRemoveEmpty(i) {

    i = i === undefined ? ''select'' : ''#'' + id;

    $(i + '' option'').filter(function() {
        return ($(this).val().trim() === "" && $(this).text().trim() === "");
    }).remove();

}

function selectToIndexArray(id) {

    var a = [];
    $(''#'' + id + '' option:selected'').each(function(index) {
        if ($(this).text() !== '''') {
            a.push($(this).index() + 1);
        }
    });
    return a;
    
}

function selectToValueArray(id) {

    var a = [];
    $(''#'' + id + '' option:selected'').each(function(index) {
        if ($(this).text() !== '''') {
            a.push($(this).text())
        }
    });

    return a;

}


function runCloner() {

    if ($(''#clo_form_source'').val() === '''') {
        nuMessage([nuTranslate(''Source Form cannot be left blank.'')]);
        return;
    }

    if ($(''#clo_tabs :selected'').length === 0) {
        nuMessage([nuTranslate(''Select at least 1 Tab.'')]);
        return;
    }

    nuSetProperty(''cloner_refresh_selectId'', '''');

    var tabs = selectToIndexArray(''clo_tabs'');
    nuSetProperty(''cloner_tabs'', tabs.length === 0 ? '''' : JSON.stringify(tabs));

    var subforms = $(''#clo_subforms_include'').is('':checked'');
    var clo_subforms = selectToValueArray(''clo_subforms'');
    nuSetProperty(''cloner_subforms'', subforms === false || clo_subforms.length === 0 ? ''0'' : JSON.stringify(clo_subforms));

    var formsRunIFrame = selectToValueArray(''clo_iframe_forms'');
    nuSetProperty(''cloner_iframe_forms'', formsRunIFrame === false || formsRunIFrame.length === 0 ? ''0'' : JSON.stringify(formsRunIFrame));

    var dump = $(''#clo_dump'').is('':checked'');
    nuSetProperty(''cloner_dump'', dump ? ''1'' : ''0'');

    var noObjects = $(''#clo_objects'').is('':checked'');
    nuSetProperty(''cloner_objects'', noObjects ? ''0'' : ''1'');

    var newPks = $(''#clo_new_pks'').is('':checked'');
    nuSetProperty(''cloner_new_pks'', newPks ? ''1'' : ''0'');

    nuSetProperty(''cloner_form_source'', $(''#clo_form_source'').val());
    nuSetProperty(''cloner_form_dest'', $(''#clo_form_dest'').val());
    nuSetProperty(''cloner_notes'', ''#clo_notes#'');

    dump ? nuRunPHP(''nucloner'', '''', 1) : nuRunPHPHidden(''nucloner'', 0);

}

function setTitle() {

    if (!nuIsNewRecord()) {
        nuSetTitle($(''#clo_form1description'').val());
    }

}

function setDefaultValues() {

    if (nuIsNewRecord()) {
        $(''#clo_new_pks'').prop(''checked'', true).change();
        $(''#clo_dump'').prop(''checked'', true).change();
    }

}

function setParentFormId() {

    if (parent.$(''#nuModal'').length > 0 && $(''#clo_form_source'').val() === '''') {
        nuGetLookupId(window.parent.nuCurrentProperties().form_id, ''clo_form_source'');
    }

}

function cloSubformsChecked() {

    var c = $(''#clo_subforms_include'').is('':checked'');
    c ? nuEnable(''clo_subforms'') : nuDisable(''clo_subforms'');
    selectAllOptions(''clo_subforms'', c);

}

function cloIframeFormsChecked() {

    var c = $(''#clo_iframe_forms_include'').is('':checked'');
    c ? nuEnable(''clo_iframe_forms'') : nuDisable(''clo_iframe_forms'');
    selectAllOptions(''clo_iframe_forms'', c);

}

function selectObjectPopuplated(formId, selectId, count) {

    if (selectId == ''clo_tabs'') {
        selectAllOptions(''clo_tabs'', true);
    }

    var chk;
    if (selectId == ''clo_iframe_forms'') {
        chk = $(''#clo_iframe_forms_include'');
        var c = chk.is('':checked'');
        if (c) {
            selectAllOptions(''clo_iframe_forms'', true);
        }
        count === 0 ? nuDisable(''clo_iframe_forms_include'') : nuEnable(''clo_iframe_forms_include'');
        if (count === 0) chk.prop(''checked'', false).change();
    }


    if (selectId == ''clo_subforms'') {

        chk = $(''#clo_subforms_include'');
        var s = chk.is('':checked'');
        if (s) {
            selectAllOptions(''clo_subforms'', true);
        }
        count === 0 ? nuDisable(''clo_subforms_include'') : nuEnable(''clo_subforms_include'');
        if (count === 0) chk.prop(''checked'', false).change();
    }



}

function selectAllOptions(id, value) {
    $("#" + id).find(''option:not(:empty)'').prop(''selected'', value);
    $("#" + id).change();
}


if (nuFormType() == ''edit'') {

    $(''#clo_form_dest_note'').css("font-weight", "normal");
    $(''#clo_tabs_note'').css("font-weight", "normal");
    $(''#clo_form_dest_note'').css("font-size", "smaller");

    // clo_dummy required to adjust correct popup width
    nuHide(''clo_dummy'');
    nuSelectRemoveEmpty();

    $(''#clo_subforms'').nuLabelOnTop(-18, 25)
    $(''#clo_iframe_forms'').nuLabelOnTop(-18, 25)
    $(''#clo_tabs'').nuLabelOnTop();
    
    cloSubformsChecked();
    cloIframeFormsChecked();

    setParentFormId();
    setDefaultValues();

    addRunButton();
    setTitle();

    nuHasNotBeenEdited();
}
')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nucodesnippet', N'browseedit', N'nucodesnippet', N'Code Snippets', N'zzzzsys_code_snippet', N'zzzzsys_code_snippet_id', NULL, 35, 10, N'SELECT * FROM zzzzsys_code_snippet WHERE (

		(cot_scope LIKE ''%0%'' AND ''#IS_CUSTOM_CODE#'' = ''1'') OR
		(cot_scope LIKE ''%1%'' AND ''#IS_SETUP_HEADER#'' = ''1'') OR
		(cot_scope LIKE ''%2%'' AND ''#IS_SQL#'' = ''1'') OR
		(cot_scope LIKE ''%2%'' AND ''#IS_PHP#'' = ''1'') OR

		(

			LOCATE(''#'', ''#IS_SETUP_HEADER#'') = 1 AND 
			LOCATE(''#'', ''#IS_CUSTOM_CODE#'') = 1 AND
			LOCATE(''#'', ''#IS_PHP#'') = 1 AND 
			LOCATE(''#'', ''#IS_SQL#'') = 1 

		) 
)

ORDER BY cot_code ', N'if (nuFormType() == ''edit'') {

   if (nuIsNewRecord()) {
        nuSetTitle(nuTranslate(''New''));
    } else {
        nuSetTitle($(''#cot_code'').val());
    }
    
    var sc = $(''#cot_source_code'');
    sc.addClass(''js'');

    sc.css(''padding'', ''3px 3px 3px 3px'')

    // Add ACE event handlers
    sc .dblclick(function() {
         nuOpenAce(nuGetSourceLangage(), this.id);
    });

   // Code Snippets form
   nuSetProperty(''IS_SETUP_HEADER'',0);
   nuSetProperty(''IS_CUSTOM_CODE'',1);

    // Disable nu-records
    if (nuCurrentProperties().record_id.startsWith(''nu'')) {
      nuDisableAllObjects();
      $(''#nuSaveButton'').hide();
    }

}

function nuOnClone(){
      nuEnableAllObjects();
      $(''#nuSaveButton'').show();
}


function nuGetSourceLangage() {
    
    var l = $(''#cot_language'').val();
    return l === '''' ? ''Javascript'' : l;
    
}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nucsvtransfer', N'launch', N'nucsvtransfer', N'CSV Transfer', N'', N'', N'', 0, 0, N'', N'

function nuCheckCSV(){
        
    if($(''#csv_transfer'').val() == '''' || $(''#csv_from'').val() == '''' || $(''#csv_to'').val() == '''' || $(''#csv_delimiter'').val() == ''''){
        nuMessage([nuTranslate(''No fields can be left blank'') + ''...'']);
    }else{
        
        if($(''#csv_transfer'').val() == ''export''){
            
            if(nuFORM.getJustTables().includes($(''#csv_from'').val())){
                nuRunPHP("CSVTRANSFER")
            }else{
                nuMessage([nuTranslate(''No such tablename'')+''...'']);
            }
            
        }
        
        if($(''#csv_transfer'').val() == ''import''){
            
            if(nuCSVfiles.includes($(''#csv_from'').val())){
                
                if(nuFORM.getJustTables().includes($(''#csv_to'').val())){
                    nuMessage([nuTranslate(''There is already a table named''), ''<b>'' + $(''#csv_to'').val() + ''</b>'']);
                }else{
                    nuRunPHP("CSVTRANSFER")
                }
                    
            }else{
                nuMessage([nuTranslate(''File not found''), '''', nuTranslate(''CSV File must be located in the temp directory of the nubuilder directory'')]);
            }
            
        }
        
    }
    
}
    


nuAddActionButton(''transfer'', "Transfer", ''nuCheckCSV()'', '''');

$(''#csv_transfer'').val(''export'');
$(''#csv_delimiter'').val(''44'');

nuCSVTransfer(''export'');

function nuCSVTransfer(t){

    if(t == ''export''){
                
        $(''#label_csv_from'').html(nuTranslate(''Export From (Table)''));
        $(''#label_csv_to'').html(nuTranslate(''Export To CSV File''));
        
        $( ''#csv_from'' ).addClass(''input_nuScroll nuScroll'').off(''keydown'').keydown(function() {
            nuFORM.scrollList(event, nuFORM.getJustTables());
        });        
        
    }else{

        $(''#label_csv_from'').html(nuTranslate(''Import From CSV File''));
        $(''#label_csv_to'').html(nuTranslate(''Import To (Table)''));

        $( ''#csv_from'' ).addClass(''input_nuScroll nuScroll'').off(''keydown'').keydown(function() {
            nuFORM.scrollList(event, nuCSVfiles);
        });
        
    }
        
}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nudebug', N'browseedit', N'nudebug', N'nuDebug Entries', N'zzzzsys_debug', N'zzzzsys_debug_id', N'', 25, 14, N'SELECT * FROM zzzzsys_debug
ORDER BY zzzzsys_debug_id DESC', N'
$(''#deb_message'')
    .css(''font-size'', 10)
    .css(''background-color'', ''#FFEEA6'')
    .prop(''readonly'', true)
    .dblclick(function() {
    	nuOpenAce(''Text'', this.id);
    });





$(''#delete_option'').val(0);
$(''#nuAddButton'').remove();
$(''#nuOptions'').remove();

var mess    = String($(''#deb_message'').val());
var i       = mess.indexOf(''<br>'');
var m       = mess.substr(i + 6);
var t       = mess.substr(0,i);

nuSetTitle(mess.substr(0, i))

$(''#nuTab0'').remove();

$(''#nuBreadcrumb2'')
.css(''text-align'', ''center'')
.css(''width'', ''95%'')
.css(''color'', ''black'')
.css(''padding'', ''5px'')
.html(t + '' :: '' + nuWhen($(''#deb_added'').val()))
.appendTo("#nuTabHolder");

$(''#deb_message'').val(m);


$("[data-nu-column=''1'']").each(function( index ) {
    
    if($(this).html().trim() != ''''){
        
        var nunow   = Date.now();
        var nuhtm   = nuWhen(Number($(this).html()));
        
        $(this).html(nuhtm);
        
    }
    
});

if(nuFORM.getCurrent().record_id != ''''){

    $(''.nuActionButton'').remove();
    nuAddActionButton(''Delete'');
    nuAddActionButton(''DeleteAll'',''Delete All'', ''nuDeleteAllAction()'');

}else{
    nuAddActionButton(''DeleteAll'',''Delete All'', ''nuDeleteAllAction()'');
}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuemailtest', N'launch', N'nuemailtest', N'Send Test Email', N'', N'', NULL, NULL, NULL, N'', N'nuAddActionButton(''nuRuntestemail'', nuTranslate(''Send''), ''nuRunPHPHidden("nutestemail", 0)'');

if (parent.$(''#nuModal'').length > 0) {

    var p = window.parent;
    $(''#set_smtp_from_address'').val(p.set_smtp_from_address.value);
    $(''#ema_to'').val(p.set_smtp_from_address.value);
    $(''#set_smtp_from_name'').val(p.set_smtp_from_name.value);
    $(''#ema_body'').val(''nuBuilder <b>Email<br> Test'');
    $(''#ema_subject'').val(''nuBuilder Test - '' + new Date().toLocaleString());

}


nuSetToolTip(''ema_load_data'',nuTranslate(''Load from Local Storage''));
nuSetToolTip(''ema_save_data'',nuTranslate(''Save to Local Storage''));


function saveDatatoLS() {

	$(''input[type=text], textarea'').each(function() {  	
		localStorage.setItem(this.id, $(this).val());
	});

}


function loadDatafromLS() {

	$(''input[type="text"], textarea'').each(function(){
		var key = $(this).attr(''id'');
		
		var value = localStorage.getItem( key );
		if (value || value === '''') {
			$(this).val( value );
		} else {
		    nuMessage(["There''s no Data to load in Local Storage"])
		}
		
	}); 
}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuevent', N'edit', N'nuevent', N'Object Events', N'zzzzsys_event', N'zzzzsys_event_id', N'', 0, 0, N'SELECT * FROM zzzzsys_event', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nufastformobjects', N'subform', N'nufastformobjects', N'Fast Form Objects', N'zzzzsys_debug', N'zzzzsys_debug_id', N'', 0, 0, N'SELECT count()* FROM zzzzsys_debug', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nufastreportobjects', N'subform', N'nufastreportobjects', N'Fast Report Objects', N'zzzzsys_debug', N'zzzzsys_debug_id', N'', 0, 0, N'SELECT count(*) FROM zzzzsys_debug', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nufflaunch', N'launch', N'nufflaunch', N'Form Builder', N'', N'', N'', 0, 0, N'', N'$("[id$=''ff_browse'']").hide();
$(''#title_obj_sfff_browse'').show();
$(''#ffwrd'').css({''font-size'' : 14, ''font-weight'' : 700, ''padding'' : 5}).addClass(''nuTabHolder'');
$(''#wrdaddable'').css({''font-size'' : 14, ''font-weight'' : 700, ''padding'' : 5}).addClass(''nuTabHolder'');
$(''.nuActionButton'').hide();
$(''#nuTab0'').remove();
$(''#fastform_type'').focus();


nuSetFK();

nuAddActionButton(''nuRunPHPHidden'', ''Build Fast Form'', ''nuRunPHPHidden("RUNFF")'');

$("#fastform_type > option").each(function() {
    $(this).addClass(''nu_'' + this.value);
});

function nuFormColor(){

    var t   = String($(''#fastform_type'').val());
    
    $(''#fastform_type'').removeClass();
    $(''#fastform_type'').addClass(''nu_''+$(''#fastform_type'').val());
    
    if(t == ''launch''){
        
        $(''#fastform_table'').hide();
        $(''#label_fastform_table'').hide();

    }else{
        $(''#fastform_table'').show();
        $(''#label_fastform_table'').show();
    }
    
    
    if(t == ''browse'' || t == ''browseedit''){
        
        $("[id$=''ff_browse'']:checkbox").each(function(index){
            
            var fld = ''#'' + this.id.substr(0, 6) + nuPad3(index + 1) + ''ff_field'';

            if($(fld).length == 1){
              if ($(this).attr(''data-nu-no-browse'') !== '''')  $(this).show();
            }
            
        });
        
    }else{
        $("[id$=''ff_browse'']:checkbox").hide();
    }

    nuSetFK();

}


function nuSetFFTable(){
    
    var v   = $(''#fastform_table'').val();

    if(nuFORM.getTables().indexOf(v) == -1){
        
        $("[data-nu-field=''ff_field'']")
        .removeClass(''input_nuScroll'')
        .removeClass(''nuScroll'');

    }else{
        
        $("[data-nu-field=''ff_field'']")
        .addClass(''input_nuScroll'')
        .addClass(''nuScroll'');

    }

    $("#title_obj_sfff_field")
    .removeClass(''input_nuScroll'')
    .removeClass(''nuScroll'');
    
    var l   = $("[id$=''ff_browse'']").length-2;
    
    $(''#obj_sf'' + nuPad3(l) + ''ff_browse'').hide();

    nuSetFK();
    
}


function nuSetFK(){
    
    $(''#fastform_fk'').hide();
    $(''#label_fastform_fk'').hide();

    var v   = $(''#fastform_table'').val();

    if(v != '''' && nuFORM.getTables().indexOf(v) == -1 && $(''#fastform_type'').val() == ''subform''){
        
        $(''#fastform_fk'').show().focus();
        $(''#label_fastform_fk'').show();

    }
    
}


function nuShowFFO(e){
    
    var t   = $(''#'' + e.target.id).attr(''data-nu-prefix'');
    var i   = $(''#'' + t + ''ff_id'').val();
    var l   = $(''#'' + t + ''ff_label'').val();
    var f   = $(''#'' + t + ''ff_field'').val();
    var fff = ''fromfastform|'' + f + ''|'' + l;

    nuPopup(''nuobject'', i, fff);

}

function nuFocusFFObject(e){

    var p      = $(e.target).attr(''data-nu-prefix'');
    
    if($(''#'' + p + ''ff_id'').val() === ''''){
        $(''#fastform_table'').focus();
    }
    
}




function nuMoveFF(){
    
    var i   = $(''#new_id'').val();

    nuPopup(i, -2);

}

function nuCreateSQLPrefix(){
    
    var p   = $(''#fastform_prefix'');
    var t   = $(''#fastform_table'');
    
    p.val(String(t.val()).substr(0, 3));
    
}


function nuBeforeSave(){
    
    var table   = $(''#fastform_table'').val();
    var type    = String($(''#fastform_type'').val());
    var browse  = type.substr(0, 6) == ''browse'';

    if(table === '''' && type != ''launch''){
        
        nuMessage([''<b>'' + nuTranslate(''Table Name'') + ''</b> '' + nuTranslate(''cannot be left blank'')]);
        
        return false;

    }
    
    if(type === ''''){
        
        nuMessage([''<b>'' + nuTranslate(''Form Type'') + ''</b> '' + nuTranslate(''cannot be left blank'')]);
        
        return false;

    }
    
    if(browse){
        
        if($("[data-nu-field=''ff_browse'']:checked").length === 0){
            
            nuMessage([nuTranslate(''At least 1 Browse needs to be checked'')]);
            
            return false;
    
        }
        
    }

    var v   = $(''#fastform_table'').val();
    var t   = $(''#fastform_type'').val();
    var f   = $(''#fastform_fk'').val();

    if(v !== '''' && nuFORM.getTables().indexOf(v) === -1 && t === ''subform'' && f === ''''){
        
        nuMessage([''<b>'' + nuTranslate(''Foreign Key Field Name'') + ''</b> '' + nuTranslate(''cannot be left blank'')]);
        
        return false;

    }
    
    var a   = [];
    
    for(var i = 0 ; i < nuSubformObject(''obj_sf'').rows.length ; i++){
        a.push(nuSubformObject(''obj_sf'').rows[i][2]);
    }


    if(f !== '''' && a.indexOf(f) > -1 && t === ''subform''){
        
        nuMessage([''<b>'' + nuTranslate(''Foreign Key Field Name'') + ''</b> '' + nuTranslate(''is already used'')]);
        
        return false;

    }
    

    
    if(!nuValidColumn()){
        return false;
    }

    return true;
    
}


function nuValidColumn(){
    
    var tn  = $(''#fastform_table'').val();
    
    if(nuFORM.getTables().indexOf(tn) == -1){return true;}
    
    var sf  = nuSubformObject(''obj_sf'');
    
    for(var i = 0 ; i < sf.rows.length ; i++){
        
        if(sf.rows[i][4] == 1 && sf.deleted[i] != 1){                           //-- ticked column checkbox
        
            var valid   = nuFORM.tableSchema[tn].names.indexOf(sf.rows[i][2]);   //-- fieldname
            
            if(valid == -1){
                
                nuMessage([nuTranslate(''Invalid column name'') + '' <b>'' + sf.rows[i][2] + ''</b>'']);
                
                return false;
                
            }
        }
        
    }
    
    return true;

}


function nuSelectFFObjects(e){
    
	var classes = e.target.className.split('' '');
	var id      = e.target.id;
    var rowno   = nuPad3($("[id^=''obj_sf''][id$=''ff_label'']", document).length-1);
    var rowsuf  = nuPad2(rowno);
    var sfrow   = ''#obj_sf'' + rowno;
    var h       = String(e.target.innerHTML).split('':'');
    
    nuSetPlaceholder(sfrow.substring(1) + ''ff_label'', h[h.length-1] + rowsuf);
    
    $(sfrow + ''ff_label'')
        .val(h[h.length-1] + rowsuf)
        .addClass(classes[1])
        .change();
    

    $(sfrow + ''ff_field'')
        .val(''field'' + rowsuf)
        .change();

    $(sfrow + ''ff_id'')
        .val(id)
        .change();
        
    var nb  = [''Word'', ''Subform'', ''Image'', ''HTML'', ''Display'', ''Input:file'', ''Input:button'', ''Select:multiselect''].indexOf(e.target.innerHTML); 

    if(nb == -1){
        $(sfrow + ''ff_browse'').show();
    }else{
        $(sfrow + ''ff_browse'').hide().attr(''data-nu-no-browse'', '''');
    }
    
    $(''#fastform_type'').change();

}
')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nufile', N'browseedit', N'nufile', N'Stored Files', N'zzzzsys_file', N'zzzzsys_file_id', N'', 150, 3, N'SELECT * FROM zzzzsys_file
ORDER BY sfi_code', N'if(nuFormType() == ''browse''){

    nuShowBrowseImages();

    nuSetNoSearchColumns([2,3]);
    
    $(''[data-nu-column="0"]'').each(function( index ) {
    
        var code    = ''#nucell_'' + index + ''_'';
        window.nuImages[$(code + ''0'').text()] = $(code + ''2'').text();
        
    });

}else{
    nuShowFile();
    nuSetToolTip(''sfi_json_file_file'',nuTranslate(''Max. 300Kb''));
    if (nuIsNewRecord()) { nuHide(''view_image''); }
}

function nuBeforeSave(){

    var f   = $(''#sfi_json_file'').val();
    
    if(f !== ''''){
        
        $(''#sfi_json'')
        .val(f)
        .change();
        
    }
    
    return true;

}

function nuShowFile(){
    
    var j   = $(''#sfi_json'').val();
    
    nuEmbedObject(j, ''view_image'',-1,-1); // auto-size
    	
}

function nuShowBrowseImages(){

    $(''[data-nu-column="0"]'').each(function( index ) {
		
		var p	    = $(this).attr(''id'');
		var r	    = String(p).split(''_'')[1];
		var i       = "nucell_" + r + "_2";
		var e       = "nucell_" + r + "_3";
		var h       = $(''#'' + i).html();

		if(h !== '''' && h !== undefined){
		    
		    nuEmbedObject(h, e, 140, 140); 

		}
		
	});

}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuform', N'browseedit', N'nuform', N'nuBuilder Form', N'zzzzsys_form', N'zzzzsys_form_id', N'', 0, 0, N'SELECT * FROM zzzzsys_form
INNER JOIN #TABLE_ID# ON zzzzsys_form_id = theid
ORDER BY sfo_code
', N'function colorObjectTypes() {

    // Color Types
    $(''select[id$=sob_all_type]'').find(''option'').each(function(index,element){
        $(element).addClass(''nu_'' + element.value);
    });
    
    $(''select[id$=sob_all_type]'').each(function(index,element){
        
    	$(element).removeClass();
    	$(element).addClass(''nu_'' + element.value);
    });

}

function nuSetControlsVisibility() {

    var pb = ''previewbrowse'';
    var pe = ''previewedit'';
    var js = ''sfo_javascript'';
    
    var bb = ''bb_event'';
    var be = ''be_event'';
    var bs = ''bs_event'';
    var as = ''as_event'';
    var bd = ''bd_event'';
    var ad = ''ad_event'';

    nuEnable([pb, pe, bb, be, bs, as, bd, ad, js]);

    var t = String($(''#sfo_type'').val());
    if (t == ''browse'') {
        nuDisable([pe, be, bs, as, bd, ad]);
    } else
    if (t == ''edit'') {
        nuDisable([pb, pb, bb]);
    } else
    if (t == ''launch'') {
        nuDisable([pb, bb, bs, as, bd, ad]);
    } else
    if (t == ''subform'') {
        nuDisable([pb, bb, be, bs, as, bd, ad, js]);
    }

    for (let i = 1; i <= 3; i++) {
        nuShow(''nuTab'' + i, t !== ''subform'' || i == 1);
    }

}

function nuTypeChanged() {

	nuSetControlsVisibility();
	
    var h = $(''#sfo_type'').addClass(''nuEdited'');
    var o = [];
    o[''browse''] = [0, 1, 2];
    o[''edit''] = [0, 2];
    o[''browseedit''] = [0, 1, 2];
    o[''launch''] = [0, 2];
    o[''subform''] = [0, 1];

    $(''#sfo_type'').removeClass();
    $(''#sfo_type'').addClass(''nu_'' + $(''#sfo_type'').val());

    if (h) {
        $(''#sfo_type'').addClass(''nuEdited'');
    }

    $("#sfo_type > option").each(function() {
        $(this).addClass(''nu_'' + this.value);
    });

    for (var i = 0; i < 7; i++) {
        $(''#nuTab'' + i).removeClass(''nuRelatedTab'');
    }

    t = o[$(''#sfo_type'').val()];
    if (t !== undefined) {

        for (i = 0; i < t.length; i++) {
            $(''#nuTab'' + t[i]).addClass(''nuRelatedTab'');
        }

    }

}


function afterinsertrowObjects() {
   colorObjectTypes();
}

if (nuFormType() == ''edit'') {

    $(''#sfo_code_snippet_sql_lookupbutton'').on(''click'',function() {
           nuSetSnippetFormFilter(0,0,1,0); // Custom Code
    });
    
    $(''#sfo_code_snippet_lookupbutton'').on(''click'',function() {
           nuSetSnippetFormFilter(1,0,0,0);  // SQL
    });
    

    colorObjectTypes();

    $(''#title_objformbtnOpenDetails'').html(nuTranslate(''Details''));

    nuHide(''sfo_code_snippet_lookupcode'');
    nuHide(''sfo_code_snippet_sql_lookupcode'');


    nuHide(''label_sfo_javascript'');
    nuSetPlaceholder(''sfo_javascript'',''JavaScript'');
    
    $(''#title_zzzzsys_tab_sfsyt_help'').attr(''id'', ''help_title'');
    $("[id$=''syt_help'']").addClass(''js'');

    nuAttachButtonImage(''previewbrowse'', ''PB'');
    nuAttachButtonImage(''previewedit'', ''PE'');
    nuAttachButtonImage(''bb_event'', ''BB'');
    nuAttachButtonImage(''be_event'', ''BE'');
    nuAttachButtonImage(''bs_event'', ''BS'');
    nuAttachButtonImage(''as_event'', ''AS'');
    nuAttachButtonImage(''bd_event'', ''BD'');
    nuAttachButtonImage(''ad_event'', ''AD'');
    nuAttachButtonImage(''icon'', ''JS'');
    nuAttachButtonImage(''br_sql'', ''SQL'');

    var js = $(''#sfo_javascript'');

    js.css(''padding'', ''3px 3px 3px 3px'')

    if (js.val() !== '''') {  
        $(''#nuTab2'').css(''font-weight'', ''bold'');
    }

    js.addClass(''js'');
    $(''#sfo_browse_sql'').addClass(''sql'').css(''font-size'', 10);

    if (nuIsNewRecord()) {
        nuSetTitle(nuTranslate(''New''));
    } else {
        nuSetTitle($(''#sfo_table'').val());
        nuUpdateAclCount();
    }

    default_description();

    // Add ACE event handlers
    $(''.js'')
        .dblclick(function() {
            nuOpenAce(''Javascript'', this.id);
        });

    $(''.sql'').dblclick(function() {
        nuOpenAce(''SQL'', this.id);
    });

    $(''.html'')
        .dblclick(function() {
            nuOpenAce(''HTML'', this.id);
    });
    
    nuTypeChanged();
    

} else { // FormType() = browse

    $("[data-nu-column=''1'']").each(function() {
        $(this).addClass(''nu_'' + this.textContent);
    });

    // Adjust Padding-Top for Preview Button
    $("[data-nu-column=''0'']").each(function() {
        $(this).css(''padding-top'',''2px'');
    });
    
     addRowButtons(0);

}

if (window.filter == ''justjs'') {

    $(''#nuDeleteButton'').remove();
    $(''#nuCloneButton'').remove();
    $(''#nuTab0'').remove();
    $(''#nuTab1'').remove();
    $(''#nuTab2'').click();
    $(''#nuTab2'').remove();

    nuSetTitle($(''#sfo_description'').val());

}


$(''#user_home'')
    .css({
        ''color'': ''white'',
        ''font-size'': 13,
        ''display'': ''inline'',
        ''border-style'': ''solid'',
        ''height'': 30,
        ''text-shadow'': ''0 1px 2px #9AB973'',
        ''border-color'': ''#9AB973'',
        ''border-width'': ''0px 0px 1px 0px'',
        ''background-color'': ''#88cb51''
    });

function nuTypeChanged() {

    var t = String($(''#sfo_type'').val());

    var pb = ''previewbrowse'';
    var pe = ''previewedit'';

    var bb = ''bb_event'';
    var be = ''be_event'';
    var bs = ''bs_event'';
    var as = ''as_event'';
    var bd = ''bd_event'';
    var ad = ''ad_event'';

    nuEnable([pb, pe, bb, be, bs, as, bd, ad]);
    
    if (t == ''browse'') {
        nuDisable([pe, be, bs, as, bd, ad]);
    } else
    if (t == ''edit'') {
        nuDisable([pb, pb, bb]);
    } else
    if (t == ''launch'') {
        nuDisable([pb, bb, bs, as, bd, ad]);
    } else
    if (t == ''subform'') {
        nuDisable([pb, bb, be, bs, as, bd, ad]);
        nuDisable(''sfo_javascript'');
    }

    var h = $(''#sfo_type'').addClass(''nuEdited'');
    var o = [];
    o[''browse''] = [0, 1, 2];
    o[''edit''] = [0, 2];
    o[''browseedit''] = [0, 1, 2];
    o[''launch''] = [0, 2];
    o[''subform''] = [0, 1];

    $(''#sfo_type'').removeClass();
    $(''#sfo_type'').addClass(''nu_'' + $(''#sfo_type'').val());

    if (h) {
        $(''#sfo_type'').addClass(''nuEdited'');
    }

    $("#sfo_type > option").each(function() {
        $(this).addClass(''nu_'' + this.value);
    });

    for (var i = 0; i < 7; i++) {
        $(''#nuTab'' + i).removeClass(''nuRelatedTab'');
    }

    t = o[$(''#sfo_type'').val()];
    if (t !== undefined) {

        for (i = 0; i < t.length; i++) {
            $(''#nuTab'' + t[i]).addClass(''nuRelatedTab'');
        }

    }
    
    nuSetControlsVisibility();

}

function nuEventList() {

    if ($(''sob_all_type'').val() == ''subform'') {
        return [''onchange'', ''onadd''];
    } else {
        return [''onblur'', ''onchange'', ''onfocus'', ''onkeydown''];
    }

}

function default_description() {

    var s = ''zzzzsys_browse_sf'';
    var r = nuSubformObject(s).rows.length - 1;
    var o = s + nuPad3(r) + ''sbr_title'';
    
    nuSetPlaceholder(o, ''Something'');
 
}

function nuUpdateAclCount() {
	var l = $("[data-nu-field=''slf_zzzzsys_access_id'']").length -2;
	var t = l <= 0 ? '''' : '' ('' + l + '')'';
	$(''#nuTab3'').html(nuTranslate(''Access Levels'') + t);
}


function nuSelectBrowseMainForm(e, t) {
  // If a  button is clicked, don''t open the Edit Screen.   
  var col = $(e.target).attr(''data-nu-column'');
  if (col !== ''0'' && typeof col !== "undefined") {
      var r = $(e.target).attr(''data-nu-primary-key'');
      nuForm(''nuform'', r, '''','''',0);
  }

  return false;
}


function nuSelectBrowseNew(e, t) {
    if (nuMainForm()) {
        nuSelectBrowseMainForm(e, t);
    } else {
        _nuSelectBrowse(e, t);
    }
}


if (nuFormType() == ''browse'') {

    if (!nuMainForm()) {nuSetBrowseColumnSize(0,0)} // Hide Preview

    var _nuSelectBrowse = nuSelectBrowse; 
    var nuSelectBrowse = function(e, t) {
    	nuSelectBrowseNew(e, t);
    }
    
    $("[data-nu-column=''1'']").addClass(''nuCellColored'');

}	

function createButton(target, pk, formType) {
	
	var btn = $("<button id=''nuPreviewButton'' type=''button'' data-form-type=''"+ formType +"'' class=''nuActionButton''><i class=''fa fa-search''></i>&nbsp;</button>");

	$(target).html(btn).attr(''title'',nuTranslate(''Preview Form''));
	btn.on(''click'',function(){
	    var formType = $(this).attr("data-form-type");
	    var r = formType == ''launch'' || formType == ''edit'' || formType == ''subform''  ? ''-1'' : '''';
	    nuForm(pk,r,'''','''');
	});
}

function addRowButtons(column) {
  
  $("[data-nu-column=''" + column + "'']").each(function(index) {
      
      var pk = $(this).attr(''data-nu-primary-key'');
      var r = $(this).attr(''data-nu-row'');
      var formType = $(''#nucell_''+ r + ''_1'').html();
      
      if (typeof pk !== "undefined") {
          createButton(this, pk, formType);
      }
  })

}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuformat', N'browseedit', N'nuformat', N'Input Formats', N'zzzzsys_format', N'zzzzsys_format_id', N'', 0, 0, N'SELECT * FROM zzzzsys_format', N'
$(''#sign'').css(''font-style'', ''bold'').css(''font-size'', 18);
$(''#separator'').css(''font-style'', ''bold'').css(''font-size'', 18);
$(''#decimal'').css(''font-style'', ''bold'').css(''font-size'', 18);
$(''#places'').css(''font-style'', ''bold'').css(''font-size'', 18);
$(''#srm_format'').addClass(''nuReadonly'').css(''font-size'', 22);

nuSetFormatType();


function nuAddToFormat(e){
    
    if($(''#srm_type'').val() == ''Date''){
        
    var v   = String(e.target.innerHTML);
    
    if(v == ''Space''){
        v   = '' '';
    }
    
    $(''#srm_format'').val($(''#srm_format'').val() + v).change();
        
    }else{
        
        var si = $(''#sign'').val();
        var se = $(''#separator'').val();
        var pl = $(''#places'').val();
        var de = Number(pl) > 0 ? $(''#decimal'').val() : '''';
        var cu = JSON.stringify([si,se,de,pl]);
        
        var space =  si !== '''' ? '' '' : '''';
        $(''#srm_format'').val(si + space + ''1'' + se + ''000'' + de + String(0).repeat(pl)).change();
       
        $(''#srm_currency'').val(cu).change();

    }
    
}


function nuSetFormatType(a){

    nuHide(''nucalculator'');
    nuHide(''sign'');
    nuHide(''separator'');
    nuHide(''decimal'');
    nuHide(''places'');
    
    if(arguments.length == 1){
        $(''#srm_format'').val('''');
    }
    
    if($(''#srm_type'').val() == ''Date''){
        
        if(arguments.length == 1){
            $(''#srm_format'').val('''');
        }
        
        nuShow(''nucalculator'');
    }
    
    if($(''#srm_type'').val() == ''Number''){

        if(arguments.length == 1){
            $(''#srm_format'').val(''1000'');
            nuAddToFormat();
        }
        
        nuShow(''sign'');
        nuShow(''separator'');
        nuShow(''decimal'');
        nuShow(''places'');
        
    }

}



')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuformatcurrency', N'edit', N'nuformatcurrency', N'Format Currency', N'zzzzsys_format', N'zzzzsys_format_id', N'', 0, 0, N'', N'$(''#sign'').focus();


$(''#nuActionHolder'').remove();
$(''#nuBreadcrumbHolder'').remove();
$(''#nuTabHolder'').remove();





function nuCreateCurrencyFormat(){
 //   console.log(''in nuCreateCurrencyFormat()'');
}
')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nufrlaunch', N'launch', N'nufrlaunch', N'Fast Report', N'', N'', N'', 0, 0, N'', N'
$(''#wrdaddable'').css({''font-size'' : 14, ''font-weight'' : 700, ''padding'' : 5}).addClass(''nuTabHolder'');
$(''#frwrd'').css({''font-size'' : 14, ''font-weight'' : 700, ''padding'' : 5}).addClass(''nuTabHolder'');
$(''#nufr'').css({''text-align'' : ''left'', ''height'' : 410, ''background-color'': ''#ebebeb''});

$(''#list'').addClass(''nuScroll'').removeClass(''nuReadonly'');

$(''.nuActionButton'').hide();
nuAddActionButton(''nuRunPHPHidden'', ''Build Fast Report'', ''nuRunPHPHidden("RUNFR")'');


function nuAddReportField(t){

    var f   = nuPad3($("[data-nu-label=''Field Name'']").length - 1);

    $(''#fast_report_sf'' + f + ''field'').val($(t).html()).change();
    $(''#fast_report_sf'' + f + ''width'').val(100).change();
    $(''#fast_report_sf'' + f + ''sum'').val(''no'').change();
    $(''#fast_report_sf'' + f + ''title'').val($(t).html()).change().select();
    
}


function nuBeforeSave(){
    
    if($(''#table'').val() === ''''){
        
        nuMessage([''<b>Table Data</b>'', nuTranslate(''Cannot be left blank...'')])
        return false;
        
    }
    
    
    if($(''#orderby'').val() === ''''){
        
        nuMessage([''<b>Order By</b>'', nuTranslate(''Cannot be left blank...'')])
        return false;
        
    }
    
    nuBuildFastReport();
    
    return true;
    
}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuhome', N'launch', N'nuhome', N'Home', N'', N'', N'', 0, 0, N'', N'nuAttachFontAwesome(''user_home'',''fa fa-home'');
nuAttachFontAwesome(''run_access'',''fa fa-unlock'');
nuAttachFontAwesome(''object_button'',''fa fa-align-center'');
nuAttachFontAwesome(''form_button'',''fa fa-align-justify'');
nuAttachFontAwesome(''run_user'',''fa fa fa-user'');
nuAttachFontAwesome(''edit_php'',''fa fa-code'');
nuAttachFontAwesome(''edit_report'',''fa fa-file-text-o'');
nuAttachFontAwesome(''run_report'',''fa fa-file-pdf-o'');
nuAttachFontAwesome(''run_php'',''fa fa-play'');
nuAttachFontAwesome(''run_setup'',''fa fa-cogs'');
nuAttachFontAwesome(''run_lang'',''fa fa-globe'');
nuAttachFontAwesome(''run_fast_form'',''fa fa-bolt'');
nuAttachFontAwesome(''run_format'',''fa fa-calendar'');
nuAttachFontAwesome(''run_file'',''fa fa-picture-o'');
nuAttachFontAwesome(''run_note'',''fa fa-sticky-note-o'');
nuAttachFontAwesome(''run_sql'',''fa fa-table'');
nuAttachFontAwesome(''open_database'',''fa fa-database'');
nuAttachFontAwesome(''run_fast_report'',''fa fa-bolt'');
nuAttachFontAwesome(''system_update'',''fa fa-cloud-download'');
nuAttachFontAwesome(''run_csvtransfer'',''fa fa-table'');
nuAttachFontAwesome(''run_session'',''fa fa-key'');
nuAttachFontAwesome(''run_nucodesnippets'',''fa fa-file-code-o'');
nuAttachFontAwesome(''run_cloner'',''fa fa-clone'');

$(''#user_home'').addClass(''nuUserHomeButton'');
$(''.nuActionButton'').hide();

$(''#open_database'').attr(''title'', ''PHPMyAdmin'')

nuGetStartingTab();

// Change the button height to 45px for certain languages:

var l = nuTranslate(''Language'');
// Vietnamese, Armenian, Tamil
if (l == ''Ngôn ngữ'' || l == ''Լեզու'' || l == ''மொழி'' ) {
   $(''.nuButton'').css(''height'',''45'');
}')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nulaunchable', N'browse', N'nulaunchable', N'Launchable Forms', N'zzzzsys_form', N'zzzzsys_form_id', N'', 0, 0, N'SELECT * FROM zzzzsys_form
WHERE sfo_type IN (''edit'', ''browseedit'', ''launch'')
AND (
    SUBSTRING(zzzzsys_form_id, 1, 2) != ''nu''
    OR zzzzsys_form_id = ''nublank''
    OR zzzzsys_form_id = ''nuuserhome''
    )
ORDER BY sfo_code
', N'$(''#sfo_breadcrumb_title'').addClass(''sql'');
$(''#sfo_browse_sql'').addClass(''sql'');
$(''#sfo_javascript'').addClass(''js'');

nuSetTitle($(''#sfo_table'').val());

$(''.js'').dblclick(function() {
	nuOpenAce(''Javascript'', this.id);
});

$(''.sql'').dblclick(function() {
	nuOpenAce(''SQL'', this.id);
});

$(''.html'').dblclick(function() {
	nuOpenAce(''HTML'', this.id);
});

$(''.php'').dblclick(function() {
	nuOpenAce(''PHP'', this.id);
});

if(window.filter == ''justjs''){
    
    $(''#nuDeleteButton'').remove();
    $(''#nuCloneButton'').remove();
    $(''#nuTab0'').remove();
    $(''#nuTab1'').remove();
    $(''#nuTab2'').click();
    $(''#nuTab2'').remove();
    
    nuSetTitle($(''#sfo_description'').val());
    
}



function nuFormColor(){

    var t   = String($(''#sfo_type'').val());

    var pb  = ''previewbrowse'';
    var pe  = ''previewedit'';

    var bb  = ''bb_event'';
    var be  = ''be_event'';
    var bs  = ''bs_event'';
    var as  = ''as_event'';
    var bd  = ''bd_event'';
    var ad  = ''ad_event'';
    
    if(t == ''browse''){
        
        nuDisable(pe);

        nuDisable(be);
        nuDisable(bs);
        nuDisable(as);
        nuDisable(bd);
        nuDisable(ad);

    }
    
    if(t == ''edit''){
        
        nuDisable(pb);
        nuDisable(bb);
        
    }

    if(t == ''launch''){
        
        nuDisable(pb);
        nuDisable(bb);
        nuDisable(as);
        nuDisable(bd);
        nuDisable(ad);

    }
    
    if(t == ''subform''){
        
        nuDisable(pb);
        nuDisable(bb);
        nuDisable(be);
        nuDisable(bs);
        nuDisable(as);
        nuDisable(bd);
        nuDisable(ad);
        nuDisable(''sfo_javascript'');
        
    }

    var h           = $(''#sfo_type'').addClass(''nuEdited'');
    var o           = [];
    o[''browse'']		= [0,1,2];
    o[''edit''] 		= [0,2];
    o[''browseedit''] = [0,1,2];
    o[''launch''] 	= [0,2];
    o[''subform'']    = [0,1];
    
    $(''#sfo_type'').removeClass();
    $(''#sfo_type'').addClass(''nu_''+$(''#sfo_type'').val());
    
    if(h){
        $(''#sfo_type'').addClass(''nuEdited'');
    }
    
    $("#sfo_type > option").each(function() {
        $(this).addClass(''nu_''+this.value);
    });

    for(var i = 0 ; i < 7 ; i++){
        $(''#nuTab'' + i).removeClass(''nuRelatedTab'');
    }
    var t   = o[$(''#sfo_type'').val()];

    if(t !== undefined){
        
    	for(var i = 0 ; i < t.length ; i++){
    		$(''#nuTab'' + t[i]).addClass(''nuRelatedTab'');		
    	}
    	
    }
    
}

nuFormColor();

//nuBuildSubformArray(''zzzzsys_tab_sf'');
//nuBuildSubformArray(''zzzzsys_browse_sf'');

$("[data-nu-column=''nucolumn000'']").each(function() {
    $(this).addClass(''nu_''+this.textContent);
});



function nuEventList(){
	
	if($(''sob_all_type'').val() == ''subform''){
		return [''onchange'',''onadd''];
	}else{
		return [''onblur'',''onchange'',''onfocus'',''onkeydown''];
	}
	
}


')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nulaunchdates', N'launch', N'nulaunchdates', N'Between 2 Dates', N'', N'', N'', 0, 0, N'', N'
nuSetTitle(nuFORM.getCurrent().run_description);')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nulaunchform', N'edit', N'nulaunchform', N'nuBuilder non-System Form', N'zzzzsys_form', N'zzzzsys_form_id', N'', 0, 0, N'SELECT * FROM zzzzsys_form
WHERE sfo_type != ''subform'' AND zzzzsys_form_id != ''nuhome''
ORDER BY sfo_code
', N'$("[data-nu-column=''0'']").each(function() {
    $(this).addClass(''nu_''+this.textContent);
});

$(''#nuAddButton'').remove();
$(''#nuPrintButton'').remove();

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nunonsystemform', N'edit', N'nunonsystemform', N'nuBuilder non-System Form', N'zzzzsys_form', N'zzzzsys_form_id', N'', 0, 0, N'SELECT * FROM zzzzsys_form
WHERE ((zzzzsys_form_id NOT LIKE ''nu%'' AND sfo_type != ''subform'')
OR zzzzsys_form_id IN (''nuaccess'', ''nuuser'', ''nulaunchdates'', ''nutranslate'', ''nupassword'', ''nufile'', ''nuuserhome'', ''nublank'', ''nurunreport''))
ORDER BY sfo_code', N'$("[data-nu-column=''0'']").each(function() {
    $(this).addClass(''nu_''+this.textContent);
});

$(''#nuAddButton'').remove();
$(''#nuPrintButton'').remove();

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nunotes', N'browseedit', N'nunotes', N'Notes', N'zzzzsys_note', N'zzzzsys_note_id', NULL, NULL, NULL, N'SELECT
    zzzzsys_note.*,
    noc_name
FROM
    zzzzsys_note
LEFT JOIN zzzzsys_note_category ON not_zzzzsys_note_category_id = zzzzsys_note_category.zzzzsys_note_category_id
ORDER BY
    not_title ASC', N'if (nuFormType() == ''edit'') {

    nuQuill(''not_content'');
    
    if (nuIsNewRecord()) {
        nuSetTitle(''New'');
    } else {
        nuSetTitle($(''#not_title'').val());
    }

    $(''#not_title'').css({"color": "maroon", "padding-left": "8", "font-weight": "bold", "font-size": "15px"});

    nuHide(''label_not_title'');
    nuSetPlaceholder(''not_title'', nuTranslate(''Title''));

    nuHide(''label_not_zzzzsys_note_category_id'');
    nuSetPlaceholder(''not_zzzzsys_note_category_idcode'', nuTranslate(''Category''));
    
    handleKeys();
      
}

function handleKeys() {

    $(''#not_title'').on(''keydown'', function(evt) {
      if (evt.key === ''Tab'' || evt.key === ''Enter'') {
      
        evt.preventDefault();
        $(''.ql-editor'').focus();
      }
    });

}

function nuBeforeSave() {

    if ($(''#not_title'').val() === '''') {
        nuMessage([nuTranslate(''Title cannot be left blank'')]);
        return false;
    }

    if (nuFORM.edited === true) {
        var container = document.querySelector(''#not_content_container'');
        var containerHtml = container.children[0].innerHTML;
        $(''#not_content'').val(containerHtml).change();
    }

    return true;
}
')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nunotescategroy', N'browseedit', N'nunotescategory', N'Category', N'zzzzsys_note_category', N'zzzzsys_note_category_id', NULL, NULL, 15, N'SELECT * FROM zzzzsys_note_category
ORDER BY noc_name', N'nuHide(''nuPrintButton'');')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuobject', N'browseedit', N'nuobject', N'Object', N'zzzzsys_object', N'zzzzsys_object_id', N'', 0, 18, N'SELECT * FROM zzzzsys_object
JOIN #TABLE_ID# ON zzzzsys_object_id = theid
JOIN zzzzsys_tab ON zzzzsys_tab_id = sob_all_zzzzsys_tab_id
JOIN zzzzsys_form ON zzzzsys_form_id = syt_zzzzsys_form_id 
ORDER BY sfo_description, sob_input_type, sob_all_id', N'// Code Snippets form
nuSetSnippetFormFilter(0,0, 1, 0); // SQL
nuHide(''sob_code_snippet_display_lookupcode'');
nuHide(''sob_code_snippet_select_lookupcode'');

if(nuFormType() == ''edit''){
    
    nuHide(''label_zzzzsys_event_sf'');
    nuDisable(''sob_calc_formula'');
    $(''#add_total'').css(''overflow-y'',''scroll'').css(''background-color'',''#ebebeb'');
    
    $(''#zzzzsys_event_sfsev_javascript'').attr(''id'',''jsfuntitle'');
    $(''#sob_calc_formula'').addClass(''nuCalculatorCurrency'').css(''font-size'', 12);
    $(''#sob_all_display_condition'').addClass(''sql'');
    $(''#sob_all_default_value_sql'').addClass(''sql'');
    $(''#sob_display_sql'').addClass(''sql'');
    $(''#sob_input_datalist'').addClass(''sql'');
    $(''#sob_select_sql'').addClass(''sql'');
    $(''#sob_lookup_php'').addClass(''php'');
    $(''#sob_lookup_javascript'').addClass(''js'');
    $(''#sob_input_javascript'').addClass(''js'');
    $(''#sob_html_javascript'').addClass(''js'');
    $(''#sob_html_code'').addClass(''html'');
    $("[id$=''sev_javascript'']").addClass(''js'');
    $("#title_zzzzsys_event_sfsev_javascript").removeClass(''js'');
    
    $(''#sob_run_zzzzsys_form_open_button'').toggleClass(''input_button nuButton nuLookupButton'');
    $(''#sob_lookup_zzzzsys_form_open_button'').toggleClass(''input_button nuButton nuLookupButton'');
    $(''#sob_subform_zzzzsys_form_open_button'').toggleClass(''input_button nuButton nuLookupButton'');
    $(''#sob_all_type_open_button'').toggleClass(''input_button nuButton nuLookupButton'');

    $(''#nuTab8'').click(function(){nuTestChart();});
        
    nuAttachButtonImage(''icon'', ''LUJS'');
    nuAttachButtonImage(''ab_event'',''AB'');
    nuAttachButtonImage(''di_sql'',''SQL'');
    nuAttachButtonImage(''se_sql'',''SQL'');
    
    $(''#sob_lookup_javascript'')
	.css(''padding'', ''3px 3px 3px 3px'')
    
    $(''#viewflowchart'')
    .css(''padding'', ''46px 0px 0px 3px'')
    .css(''text-align'', ''left'')
    .css(''background-size'', ''75px'')
    
    
    if($(''#zzzzsys_event_sf000sev_event'').val() !== ''''){
        $(''#nuTab10'').css(''font-weight'', ''bold'');
    }
        
    if(nuIsNewRecord()){
            
        $(''#sob_all_top'').val(0).change();
        $(''#sob_all_left'').val(0).change();
        $(''#sob_all_height'').val(18).change();
        $(''#sob_all_width'').val(100).change();
        $(''#sob_all_validate'').val(0).change();
        $(''#sob_all_access'').val(0).change();
        $(''#sob_all_align'').val(''left'').change();
        $(''#sob_all_cloneable'').val(1).change();
        
        nuHasNotBeenEdited();
    }

}

function nuColumnDataType(table, id) {

    var s = nuFORM.tableSchema[table];
    var i = -1;
    if (typeof s!== "undefined") {
        var n = s.names;
        i = n.indexOf(id.val());
    }
    
    return i > -1 ? s.types[i] : '''';
    
}

jQuery.fn.cssNumber = function (prop) {
    var v = parseInt(this.css(prop), 10);
    return isNaN(v) ? 0 : v;
};


function nuShowDataType() {
	
    var id = $(''#sob_all_id'');
    var iDataType =   $(''#sob_all_id_datatype'');
 
    var table = $("#sob_all_table").val();
    var dataType = '''';
    
    if (table !== '''' && id.val() !== '''') {
        dataType = nuColumnDataType(table, id);
	    
    }

    iDataType.val(dataType);
     
}

if(nuFormType() == ''edit''){
    
	var v   = $(''#sob_input_type'').val();
    nuInputTypeChanged(v);
    nuHideCalcObjects();
    
    if (nuIsNewRecord()) {
        nuSetTitle(nuTranslate(''New''));
    } else {
        nuSetTitle($(''#sob_all_id'').val());
        nuShowDataType();
    }    
    
    nuPopulateHTML();
    nuAddDataListToRunId();
    
    nuAttachFontAwesome(''sob_all_align_btn_left'',''fa fa-align-left'');
    nuAttachFontAwesome(''sob_all_align_btn_center'',''fa fa-align-center''); 
    nuAttachFontAwesome(''sob_all_align_btn_right'',''fa fa-align-right'');
    nuAttachFontAwesome(''sob_all_validate_btn_no_duplicates'',''fa fa-diamond'');
    nuAttachFontAwesome(''sob_all_validate_btn_no_blanks'',''fa fa-battery-full'');
    nuAttachFontAwesome(''sob_all_access_btn_hidden'',''fa fa-eye-slash'');
    nuAttachFontAwesome(''sob_all_access_btn_readonly'',''fa fa-lock'');
    nuAttachFontAwesome(''sob_all_access_btn_editable'',''fa fa-pencil-square-o'');
    nuAttachFontAwesome(''sob_all_validate_btn_none'',''fa fa-globe'');
    
    $( "button[id*=''_btn_'']" ).addClass(''nuQuickButton'').removeClass(''input_button nuButton'');
        
    var filter = String(window.filter).split(''|'');
    
    if(filter[0] == ''fromfastform''){
    
		$(''#nuDeleteButton'').remove();
		$(''#nuCloneButton'').remove();
		$(''#nuSaveButton'').remove();
		$(''#sob_all_id'').val(filter[1]).addClass(''nuHighlight'');
		$(''#sob_all_label'').val(filter[2]).addClass(''nuHighlight'');
    
    }
    
    $(''.js'').dblclick(function() {nuOpenAce(''Javascript'', this.id);});
    $(''.sql'').dblclick(function() {nuOpenAce(''SQL'', this.id);});
    $(''.html'').dblclick(function() {nuOpenAce(''HTML'', this.id);});
    $(''.php'').dblclick(function() {nuOpenAce(''PHP'', this.id);});
	
	nuHide(''sob_input_format'');

	var sit     = $(''#sob_input_type'').val();

	if(sit == ''nuDate'' || sit == ''nuNumber''){
	nuShow(''sob_input_format'');
	}

	if(sit == ''nuScroll''){
	nuShow(''sob_input_javascript'');
	}else{
	nuHide(''sob_input_javascript'');
	}

	nuObjectColor();
	
	nuGetStartingTab();


}

function stripHTMLTags(s) {
    return s == '''' ? '''' : s.replace(/<\/?[^>]+(>|$)/g, "");
}


if(nuFormType() == ''browse''){

	$("[data-nu-column=''0'']").each(function() {
		$(this).addClass(''nu_''+this.textContent).addClass(''nuCellColored'');
	});
	
	
    $("[data-nu-column=''4'']").each(function() {
    		$(this).html(stripHTMLTags($(this).html()).replace(/&nbsp;/g,'' '').trim());
    });
    	
}

function nuTestChart(){
    
    var g   = $(''#sob_html_chart_type'').val();
    var t   = $(''#sob_all_type'').val();
    
    if(g == '''' || t != ''html''){$(''#google_chart'').html('''');return;}
    
    var c   = ''ComboChart'';
    var t   = $(''#sob_html_title'').val();
    var x   = $(''#sob_html_vertical_label'').val();
    var y   = $(''#sob_html_horizontal_label'').val();
    var l   = ''bars'';
    var s   = false;
    var a   = [
                [''Month'', ''Shane'', ''Dave'', ''Adam'', ''Paul'', ''Chris''],
                [''2004'', 100, 200, 300, 400, 500],
                [''2005'', 165, 238, 322, 498, 550],
                [''2006'', 165, 938, 522, 998, 450],
                [''2007'', 135, 1120, 599, 1268, 288]
              ];
		
    if(g == ''p'')    {c = ''PieChart'';}
    if(g == ''l'')    {l = ''lines'';}
    if(g == ''bh'')   {c = ''BarChart'';}
    if(g == ''bhs'')  {c = ''BarChart'';}
    if(g == ''bs'')   {s = true;}
    if(g == ''bhs'')  {s = true;}

	nuChart(''google_chart'', c, a, t, x, y, l, s);

}

function nuAddDataListToRunId() {

    var arrRecordId = [
        ["     ", nuTranslate("Leave blank to open a Browse or Launch Form")],
        ["-1", nuTranslate("Open a new Record")],
        ["#EXAMPLE_HASH_COOKIE#", nuTranslate("Use a Hash Cookie")]
    ];

    nuAddDatalist(''sob_run_id'', arrRecordId);

    $(''#sob_run_id'').on(''input'', function() {
        if ($(this).val() == ''     '') {
            $(this).val('''').change();
        }

    });

}

function nuObjectColor(){
    
    $(''.nuValidate'').removeClass(''nuValidate'');

	var e           = $(''#sob_all_type'').hasClass(''nuEdited'');
	var o			= [];

	o[''run'']		= 1;
	o[''display'']	= 2;
	o[''select'']		= 3;
	o[''lookup'']		= 4;
	o[''subform'']	= 5;
	o[''image'']		= 6;
	o[''input'']		= 7;
	o[''html'']		= 8;
	o[''calc'']		= 9;
	

    $(''#sob_all_type'').removeClass();
    
    if(e){                                                                      //-- keep class if edited
        $(''#sob_all_type'').addClass(''nuEdited'');
    }
    
    $(''#sob_all_type'').addClass(''nu_''+$(''#sob_all_type'').val());
    
    $("#sob_all_type > option").each(function() {
        $(this).addClass(''nu_''+this.value);
    });
	
    $("#sob_input_type > option").each(function() {
        $(this).addClass(''input_''+this.value);
    });
	
    var t   = o[$(''#sob_all_type'').val()];
    
    $("[id^=''nuTab'']").removeClass(''nuRelatedTab'');
    
    for(var i = 1 ; i < o.length ; i++){
        $(''#nuTab'' + i).removeClass(''nuRelatedTab'');
    }
    
    $(''#nuTab0'').addClass(''nuRelatedTab'');
    $(''#nuTab'' + t).addClass(''nuRelatedTab'');
    
} 


function nuAddToFormula(e){
    
    var fld = e.target.innerHTML;
    var frm = $(''#sob_calc_formula'').val();
    
    if(fld == ''Clear''){
        
        $(''#sob_calc_formula'')
        .val('''')
        .addClass(''nuEdited'');
        return;
        
    }

    $(''#sob_calc_formula'')
    .addClass(''nuEdited'')
    .val(frm + fld);
    
    nuHasBeenEdited();
    
}

function nuInputTypeChanged(t){

    nuHide(''sob_input_format'');
    nuHide(''sob_input_count'');
    nuHide(''sob_input_javascript'');
    nuHide(''sob_input_datalist'');
    
    if(t == ''nuScroll''){
        nuShow(''sob_input_javascript'');
    }

    if(t == ''nuAutoNumber''){
        
        nuShow(''sob_input_count'');
        $(''#sob_input_javascript'').val('''').addClass(''nuEdited'');
        
    }

    if(t == ''nuDate'' || t == ''nuNumber'' || t == ''number'' || t == ''text'' || t == ''email'' || t == ''search'' || t == ''moneth''){
        nuShow(''sob_input_datalist'');
        if ($(''#sob_input_datalist'').val() == '''' && $(''#sob_all_id_datatype'').val() !== '''') {
         //   $(''#sob_input_datalist'').val("SELECT DISTINCT `" + $("#sob_all_id").val() + "` FROM `" + $(''#sob_all_table'').val() + "` ORDER BY 1").change();
        }
    }
    
    if(t == ''nuDate'' || t == ''nuNumber''){
        
        nuShow(''sob_input_format'');

        $(''#sob_input_format'').children().each(function(index) {
            
            $(this).show();
            
            if($(this).val()[0] == ''D'' && t != ''nuDate'')   {$(this).hide();}
            if($(this).val()[0] == ''N'' && t != ''nuNumber'') {$(this).hide();}
            
        });
        
    }
    
}


function nuHideCalcObjects(){

    var f   = $(''#sob_all_zzzzsys_form_id'').val();

    $(''#add_total'').children().each(function(index) {


        if($(this).val() != f){
            $(this).hide();
        }
        if($(this).text() == $(''#sob_all_id'').val()){
            $(this).hide();
        }

    });
    
}


function nuAddCalcObject(t){
    
    var f   = $(''#sob_calc_formula'').val();
    var i   = $(t).attr(''data-nu-ids'');
    var s   = f + "nuTotal(''" + i + "'')";
    
    if(i == ''''){return;}

    $(''#sob_calc_formula'')
    .addClass(''nuEdited'')
    .val(s);

    $(''#add_total'').val('''');
    
    nuHasBeenEdited();
    
}


function nuPopulateHTML(){

    var o       = nuCalcObjects();
    var a       = [];

    for(var i = 0 ; i < o.length ; i++){
        
        var ids = String(o[i].ids);
        var ty  = o[i].type;
        var id  = String(o[i].ids).split(''.'');
        var sp  = ''&nbsp;'';

        if(id.length == 1){
            a.push(''<tr><td><div title="''+ty+''" style="overflow:hidden;width:305px;text-align:left;padding:2px" onclick="nuAddCalcObject(this);" class="nuCalculatorButton nu_'' + o[i].type + ''" data-nu-ids="'' + ids + ''">'' + ids + ''</div></td></tr>'');
        }else{
            
            var h   = ''<span title="subform" class="nu_subform">'' + id[0] + ''</span>.<span title="''+ty+''" class="nu_input" style="padding:7px 5px 7px 5px">'' + id[1] + sp.repeat(200) + ''</span>'';
            a.push(''<tr><td><div style="overflow:hidden;width:305px;text-align:left;padding:2px" onclick="nuAddCalcObject(this);" class="nuCalculatorButton nu_subform" data-nu-ids="'' + ids + ''">'' + h + ''</div></td></tr>'');
            
        }
        
    }

    $(''#add_total'').html(''<table>'' + a.join('''') + ''</table>'');

}


function nuSetSelectIndex(i, index) {

  $("#"+ i).prop("selectedIndex", index).change();

}

function nuSetLookupWidth() {
    var w = $(''#sob_lookup_description'').val() == $(''#sob_lookup_code'').val() ? 0 : 150;
    var cw = $(''#sob_lookup_description_width'').val();  
    if (cw == 0 || cw == 150 || w == 0) $(''#sob_lookup_description_width'').val(w).change();
}
')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuobjectgrid', N'browseedit', N'nuobjectgrid', N'nuBuilder Form', N'zzzzsys_form', N'zzzzsys_form_id', N'', 0, 0, N'SELECT * FROM zzzzsys_form
INNER JOIN #TABLE_ID# ON zzzzsys_form_id = theid
ORDER BY sfo_code
', N'function colorObjectTypes() {

    // Color Types
    $(''select[id$=sob_all_type]'').find(''option'').each(function(index,element){
        $(element).addClass(''nu_'' + element.value);
    });
    
    $(''select[id$=sob_all_type]'').each(function(index,element){
        
    	$(element).removeClass();
    	$(element).addClass(''nu_'' + element.value);
    });

}

function nuSelectRemoveEmpty(i) {

    i = i === undefined ? ''select'' : ''#'' + i;

    $(i + '' option'').filter(function() {
        return ($(this).val().trim() === "" && $(this).text().trim() === "");
    }).remove();

}

function afterinsertrowObjects() {
   colorObjectTypes();
}

function nuSortSubform(s, c, e){
}

function nuTabFilter() {
    
	nuMoveSelectToSubform();
	
	nuSelectRemoveEmpty(''sfo_tabs_filter'');
    $(''#sfo_tabs_filter'').prepend($(''<option>'', { value: '''', text: nuTranslate("(All Tabs)"), disabled : false, selected: f === '''', hidden: false }));


	var w = $(''#sfo_tabs_filter'');
	var f =  nuGetProperty("sfo_tabs_filter");
	
	
	if (typeof f !== "undefined") {
	   w.val(f);
	} else {
	  nuSetProperty("sfo_tabs_filter","");
	  $("#sfo_tabs_filter").prop("selectedIndex", 0);
	}
	

	w.prop(''change'', null).off(''change''); 
	w.change(function(e) {
	   nuSetProperty("sfo_tabs_filter",$(''#sfo_tabs_filter option:selected'').val()); 
       nuHasNotBeenEdited(); 
	   nuGetBreadcrumb();
	});
	
}

function nuMoveSelectToSubform() {

    $(''#title_objformsob_all_zzzzsys_tab_id'').append($(''#sfo_tabs_filter''));

    $(''#sfo_tabs_filter'').css({
        ''top'': ''1px'',
        ''left'': ''0px'',
        ''position'': ''relative'',
        ''background-color'': ''#afe9ff''
    });

}


if (nuFormType() == ''edit'') {

    nuTabFilter();

    $(''#nuCloneButton'').remove();
    $(''#nuDeleteButton'').remove();

    colorObjectTypes();

    $(''#title_objformbtnOpenDetails'').html(nuTranslate(''Details''));

    if (nuIsNewRecord()) {
        nuSetTitle(nuTranslate(''New''));
    } else {
        var frmInfo = $(''#sfo_description'').val() + '' (''+ $(''#sfo_code'').val()+'')'';
        if (window.nuFORM.breadcrumbs.length == 1) $(''#nuTab0'').html(frmInfo);
        nuSetTitle(frmInfo);
        nuUpdateAclCount();
    }
}

function nuFormColor() {

    var t = String($(''#sfo_type'').val());

    var pb = ''previewbrowse'';
    var pe = ''previewedit'';

    var bb = ''bb_event'';
    var be = ''be_event'';
    var bs = ''bs_event'';
    var as = ''as_event'';
    var bd = ''bd_event'';
    var ad = ''ad_event'';

    if (t == ''browse'') {
        nuDisable([''pe'', ''be'', ''bs'', ''as'', ''bd'', ''ad'']);
    } else
    if (t == ''edit'') {
        nuDisable([''pb'', ''pb'']);
    } else
    if (t == ''launch'') {
        nuDisable([''pb'', ''bb'', ''bs'', ''as'', ''bd'', ''ad'']);
    } else
    if (t == ''subform'') {
        nuDisable([''pb'', ''bb'', ''be'', ''bs'', ''as'', ''bd'', ''ad'']);
        nuDisable(''sfo_javascript'');
    }

    var h = $(''#sfo_type'').addClass(''nuEdited'');
    var o = [];
    o[''browse''] = [0, 1, 2];
    o[''edit''] = [0, 2];
    o[''browseedit''] = [0, 1, 2];
    o[''launch''] = [0, 2];
    o[''subform''] = [0, 1];

    $(''#sfo_type'').removeClass();
    $(''#sfo_type'').addClass(''nu_'' + $(''#sfo_type'').val());

    if (h) {
        $(''#sfo_type'').addClass(''nuEdited'');
    }

    $("#sfo_type > option").each(function() {
        $(this).addClass(''nu_'' + this.value);
    });

    for (var i = 0; i < 7; i++) {
        $(''#nuTab'' + i).removeClass(''nuRelatedTab'');
    }

    t = o[$(''#sfo_type'').val()];
    if (t !== undefined) {

        for (i = 0; i < t.length; i++) {
            $(''#nuTab'' + t[i]).addClass(''nuRelatedTab'');
        }

    }

}

function nuEventList() {

    if ($(''sob_all_type'').val() == ''subform'') {
        return [''onchange'', ''onadd''];
    } else {
        return [''onblur'', ''onchange'', ''onfocus'', ''onkeydown''];
    }

}

function default_description() {

    var s = ''zzzzsys_browse_sf'';
    var r = nuSubformObject(s).rows.length - 1;
    var o = s + nuPad3(r) + ''sbr_title'';
    
    nuSetPlaceholder(o, ''Something'');
 
}

function nuUpdateAclCount() {
	var l = $("[data-nu-field=''slf_zzzzsys_access_id'']").length -2;
	var t = l <= 0 ? '''' : '' ('' + l + '')'';
	$(''#nuTab4'').html(nuTranslate(''Access Level'') + t);
}


function nuSelectBrowseMainForm(e, t) {
  
  // If a  button is clicked, don''t open the Edit Screen.   
  var col = $(e.target).attr(''data-nu-column'');
  if (col !== ''0'' && typeof col !== "undefined") {
      var r = $(e.target).attr(''data-nu-primary-key'');
      nuForm(''nuform'', r, '''','''',0);
  }

  return false;
}

/*
function nuSelectBrowseNew(e, t) {
    if (nuMainForm()) {
        nuSelectBrowseMainForm(e, t);
    } else {
        _nuSelectBrowse(e, t);
    }
}


if (nuFormType() == ''browse'') {

    if (!nuMainForm()) {nuSetBrowseColumnSize(0,0)} // Hide Preview

    var _nuSelectBrowse = nuSelectBrowse; 
    var nuSelectBrowse = function(e, t) {
    	nuSelectBrowseNew(e, t);
    }

}	
*/

function createButton(target, pk, formType) {
	
	var btn = $("<button id=''nuPreviewButton'' type=''button'' data-form-type=''"+ formType +"'' class=''nuActionButton''><i class=''fa fa-search''></i>&nbsp;</button>");

	$(target).html(btn).attr(''title'',nuTranslate(''Preview Form''));
	btn.on(''click'',function(){
	    var formType = $(this).attr("data-form-type");
	    var r = formType == ''launch'' || formType == ''edit'' || formType == ''subform''  ? ''-1'' : '''';
	    nuForm(pk,r,'''','''');
	});
}

function addRowButtons(column) {
  
  $("[data-nu-column=''" + column + "'']").each(function(index) {
      
      var pk = $(this).attr(''data-nu-primary-key'');
      var r = $(this).attr(''data-nu-row'');
      var formType = $(''#nucell_''+ r + ''_1'').html();
      
      if (typeof pk !== "undefined") {
          createButton(this, pk, formType);
      }
  })

}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nupassword', N'edit', N'nupassword', N'Change Password', N'zzzzsys_user', N'zzzzsys_user_id', N'', 0, 0, N'SELECT * FROM zzzzsys_user
JOIN zzzzsys_user_group ON sus_zzzzsys_user_group_id = zzzzsys_user_group_id
ORDER BY sus_name', N'$(''#nuTab0'').hide();')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuphp', N'browseedit', N'nuphp', N'Build Procedure', N'zzzzsys_php', N'zzzzsys_php_id', N'', 0, 0, N'SELECT * FROM zzzzsys_php
LEFT JOIN zzzzsys_form ON zzzzsys_form_id = sph_zzzzsys_form_id
WHERE ((sph_system != ''1'' or sph_system IS NULL) or ''#nuDevMode#'' = ''1'')
ORDER BY sph_code', N'nuHide(''sph_code_snippet_select_lookupcode'');

// Code Snippets form
nuSetSnippetFormFilter(0, 0 ,0, 1); // PHP Code

nuDevMode();

window.nuImages = parent.nuImages;

$(''#sph_php'')
.addClass(''php'')
.dblclick(function() {
	nuOpenAce(''PHP'', this.id);
})

window.nuHelp   = ''Procedures'';

if(window.filter == ''justphp''){
   
    $(''#nuTab1'').remove(); // Access Levels
    $(''#nuCloneButton'').remove();
    
    $(''#label_sph_code_snippet_select_lookup'').css({''top'':''18px'', ''left'':''740px''});
    $(''#sph_code_snippet_select_lookupbutton'').css({''top'':''18px'', ''left'':''845px''});
    

    nuHelp      = ''Functions'';
    var ev      = [];
    ev[''BB'']    = ''Before Browse'';
    ev[''BE'']    = ''Before Edit'';
    ev[''BS'']    = ''Before Save'';
    ev[''AS'']    = ''After Save'';
    ev[''BD'']    = ''Before Delete'';
    ev[''AD'']    = ''After Delete'';
    ev[''AB'']    = ''After Browse'';
    
    var suf     = nuFORM.getCurrent().record_id.substr(-2);
    var e       = ev[suf];
    var f       = $(''#sfo_description'', window.parent.document).val();

    if(e == ''After Browse''){
        var f   = $(''#sob_all_label'', window.parent.document).val();
    }

    nuAttachButtonImage(''icon'', suf);
    
    $(''#sph_php'')
    .css(''padding'', ''3px 3px 3px 3px'')
    .css(''top'', ''40px'')
    .css(''left'', ''90px'')
    .focus()

    
    $(''#wiki'')
    .css(''left'', ''670px'')

    $(''#nu_bc_0'').html(''<b>'' + e + ''</b> for : '' + f);
    $(''#sph_code'').val(nuFORM.getCurrent().record_id).change();
    $(''#sph_description'').val(''System PHP'').change();
    $(''#sph_system'').val(''1'').change();
    $(''#label_sph_php'').css(''top'', ''40px'').css(''left'', ''20px'');
    $(''.nuSaveButtonEdited'').removeClass(''nuSaveButtonEdited'');
    
    nuHide(''sph_code'');
    nuHide(''sph_description'');
    nuHide(''sph_zzzzsys_form_id'');
    nuHide(''sph_group'');
    nuHide(''sph_system'');
    nuHide(''sph_run'');

    nuSetTitle(e);
    
}else{

    if (! nuCurrentProperties().record_id.startsWith(''nu'') ) {
        $(''#sph_system'').val(''0'').change();
        $(''#sph_hide'').val('''').change();
    }

    if (nuIsNewRecord()) {
        nuSetTitle(nuTranslate(''New''));
    } else {
        nuSetTitle($(''#sph_code'').val());
        nuUpdateAclCount();
    }    


}

nuHasNotBeenEdited();


function nuUpdateAclCount() {
	var l = $("[data-nu-field=''slp_zzzzsys_access_id'']").length -2;
	var t = l <= 0 ? '''' : '' ('' + l + '')'';
	$(''#nuTab1'').html(nuTranslate(''Access Level'') + t);
}

function nuOnClone(){

    if(window.filter !== ''justphp''){
        if ($(''#sph_group'').val() == ''nubuilder'' && $(''#sph_code'').val().endsWith(''Template'')) {
             $(''#sph_code'').val($(''#sph_code'').val().substring(0, $(''#sph_code'').val().length-9)).change();
             $(''#sph_group'').val('''').change();
        }
    }
    
}
')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nurunlist', N'browse', N'nurunlist', N'Run Form, Report or Procedure', N'zzzzsys_run_list', N'id', N'', 0, 0, N'SELECT * FROM zzzzsys_run_list 
ORDER BY code', N'
$("[data-nu-column=''nucolumn000'']").each(function() {

    $(this).addClass(''nu_''+this.innerHTML);

});')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nurunphp', N'browseedit', N'nurunphp', N'Run Procedure', N'zzzzsys_php', N'zzzzsys_php_id', N'', 0, 0, N'SELECT * FROM zzzzsys_php
JOIN zzzzsys_form ON zzzzsys_form_id = sph_zzzzsys_form_id
WHERE (sph_system != ''1'' || sph_system IS NULL)
ORDER BY sph_code', N'
$(''#nuAddButton'').remove();
$(''#nuPrintButton'').remove();

function nuSelectBrowse(e){

    var r   = $(''#'' + e.target.id).attr(''data-nu-row'');
    var p   = $(''#nucell_'' + r + ''_0'').html();
    var f   = $(''#'' + e.target.id).attr(''data-nu-primary-key'');

    nuGetPHP(p, f);

}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nurunreport', N'browseedit', N'nurunreport', N'Run Report', N'zzzzsys_report', N'zzzzsys_report_id', N'', 0, 0, N'SELECT * FROM zzzzsys_report
LEFT JOIN zzzzsys_form ON zzzzsys_form_id = sre_zzzzsys_form_id', N'
nuSetTitle(nuFORM.getCurrent().run_description);

$(''#nuAddButton'').remove();
$(''#nuPrintButton'').remove();

function nuSelectBrowse(e){
    
    var r   = $(''#'' + e.target.id).attr(''data-nu-row'');
    var f   = $(''#nucell_'' + r + ''_0'').html();
    var p   = $(''#'' + e.target.id).attr(''data-nu-primary-key'');

    nuGetReport(f, p);
    
}

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nusample', N'launch', N'nusample', N'Default Fast Form Objects', N'', N'', N'', 0, 0, N'', N'//$(''#nuBreadcrumbHolder'').remove();
$(''#nuActionHolder'').remove();
//$(''#nuTabHolder'').remove();

$(''#nuOptions'').hide();

$(''#inputtextsample'').val(''text'');
$(''#inputnumbersample'').val(4);
$(''#inputnunumbersample'').val(''$ 1,234.56'');
$(''#inputnudatesample'').val(''23-Jan-2021'');
$(''#inputnuscrollsample'').val(''East'');
$(''#calcsample'').val(''$ 1,238.56'');

$(''#selectsample'').val(1);
$(''#selectmultiselectsample'').val(0);
$(''#textareasample'').val("text-area");

$("[id^=''label'']").addClass(''nu_input'').css({width:120, left:10, ''text-align'':''center''});

$(''#label_imagesample'').addClass(''nu_image'').removeClass(''nu_input'');
$(''#label_textareasample'').addClass(''nu_textarea'').removeClass(''nu_input'');
$(''#label_displaysample'').addClass(''nu_display'').removeClass(''nu_input'');
$(''#label_htmlsample'').addClass(''nu_html'').removeClass(''nu_input'');
$(''#label_calcsample'').addClass(''nu_calc'').removeClass(''nu_input'');
$(''#label_selectsample'').addClass(''nu_select'').removeClass(''nu_input'');
$(''#label_selectmultiselectsample'').addClass(''nu_select'').removeClass(''nu_input'');
$(''#label_lookupsample'').addClass(''nu_lookup'').removeClass(''nu_input'');
$(''#labelword'').addClass(''nu_word'').removeClass(''nu_input'');
$(''#label_subformsample'').addClass(''nu_subform'').removeClass(''nu_input'').css({left:10});

$("[id^=''label'']")
.addClass(''nuCalculatorButton'')
.removeClass(''nuWord'')
.css({''height'':30, ''width'':220})




')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nusamplesubformform', N'launch', N'nusamplesubformform', N'Sample Subform Form', N'', N'', N'', 0, 0, N'', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuselect', N'browseedit', N'nuselect', N'SQL Builder', N'zzzzsys_select', N'zzzzsys_select_id', N'', 0, 0, N'SELECT * FROM zzzzsys_select 
WHERE (sse_system != 1 OR sse_system IS NULL)
ORDER BY sse_description ASC

', N'
if(nuIsNewRecord()){
    $(''#sse_edit'').val(0);
    nuSetTitle(nuTranslate(''New''));
} else {
    nuSetTitle($(''#sse_description'').val());
}


$("#sse_edit option[value='''']").remove();

$(''#sse_sql'')
.css(''font-size'', 10)
.addClass(''sql'')
.dblclick(function() {
	nuOpenAce(''SQL'', this.id);
});

$(''#label_sse_sql'').remove();
nuHide(''sse_code_snippet_lookupcode'');
nuSetSnippetFormFilter(0,0,1);

$(''#sse_resize'').addClass(''nuAllowDblClick'');

nuSetSFCB();

if(window.filter == ''justsql''){

    var sid     = String(nuFORM.getCurrent().record_id);
    var from    = sid.substring(sid.length-2);
    var targ    = ''#sfo_browse_sql'';

    $(''#nuDeleteButton'').remove();
    $(''#nuCloneButton'').remove();
    $(''#sse_description'').val(sid);
    
    nuHide(''sse_description'');
    
    if(nuFORM.getCurrent().record_id != -1){
    
        $(''#nuSaveButton'').hide();
    
        if(from == ''BR''){
            nuAddActionButton(''SaveToTextarea'', ''Copy to Form Browse SQL'', ''nuCopySQL("sfo_browse_sql")'');
        }
        
        if(from == ''SE''){
            nuAddActionButton(''SaveToTextarea'', ''Copy to Select Object SQL'', ''nuCopySQL("sob_select_sql")'');
        }
        

        if(from == ''DI''){
            nuAddActionButton(''SaveToTextarea'', ''Copy to Display Object SQL'', ''nuCopySQL("sob_display_sql")'');
        }
        
    }

}





$(''#sse_sql'').css(''overflow-x'',''scroll'');


nuWhereClauses();


function nuCopySQL(targ){
    
    var s   = $(''#sse_sql'').val();
    
    parent.$(''#'' + targ).val(s).change();
    
    parent.$(''#dialogClose'').click();

}


function nuTempPHP(){
    
    var p   = [];
    
    p.push('''');
    p.push(''$sql = "'');
    p.push('''');
    p.push(''CREATE TABLE #TABLE_ID#'');
    p.push($(''#sse_sql'').val());
    p.push('''');
    p.push(''";'');
    p.push('''');
    p.push("nuRunQuery($sql);");
    p.push('''');
    nuMessage(p);
//    $("#nuAlertDiv").css(''text-align'', ''left'')
    $("#nuMessageDiv").css(''text-align'', ''left'')

}

function nuBeforeSave(){
    
    $(''#sqlframe'')[0].contentWindow.nuSQL.buildSQL();
    return true;
    
}




function nuWhereClauses(){

	$("[id$=''ssc_type'']select").each(function(index){
		
		var p   = $(this).attr(''data-nu-prefix'');
		var t   = $(this).val();
		
		if(t == 2 || t == 3){
		    
		    if($(''#'' + p + ''ssc_sort'').val() == ''''){
                $(''#'' + p + ''ssc_sort'').val(''ASC'');
		    }
		    
    		$(''#'' + p + ''ssc_clause'').hide();
    		$(''#'' + p + ''ssc_sort'').show();
    		
		}else{
		    
    		$(''#'' + p + ''ssc_clause'').show();
    		$(''#'' + p + ''ssc_sort'').hide();
    		
		}

	});

}


function nuWhereClausesold(){

	$("[id$=''ssc_type'']select").each(function(index){
		
		var p   = $(this).attr(''data-nu-prefix'');
		var t   = $(this).val();
		
		if(t == 2 || t == 3){
		    
		    if($(''#'' + p + ''ssc_sort'').val() == ''''){
                $(''#'' + p + ''ssc_sort'').val(''ASC'');
		    }
		    
    		$(''#'' + p + ''ssc_clause'').hide();
    		$(''#'' + p + ''ssc_sort'').show();
    		
		}else{
		    
    		$(''#'' + p + ''ssc_clause'').show();
    		$(''#'' + p + ''ssc_sort'').hide();
    		
		}

	});

}


function nuAddSQLTable(e){
  
    var s = $(''#sqlframe'')[0].contentWindow.nuSQL;
    
    s.addBox(e.target.value);
    e.target.value  = '''';
    s.buildSQL();

}


function nuSFCB(){
    
    nuWhereClauses();
    $(''#sqlframe'')[0].contentWindow.nuSQL.buildSQL();

}


function nuSetSFCB(){
    
    $(''.nuSubformCheckbox.zzzzsys_select_clause'')
	.click(function(){
		nuSFCB();
    });
    
}



function nuResizeSQL(){

    if($(''#sqlframe'').css(''height'') == ''470px''){
        $(''#sqlframe'').css(''height'', 180);
        nuShow(''sse_code_snippet_lookup'');
        nuShow(''zzzzsys_select_clause_sfnuOptions'');
    }else{
        $(''#sqlframe'').css(''height'', 470);
        nuHide(''sse_code_snippet_lookup'');
        nuHide(''zzzzsys_select_clause_sfnuOptions'');
    }
    
}


')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nusession', N'browse', N'nusession', N'Sessions', N'zzzzsys_session', N'zzzzsys_session_id', NULL, NULL, NULL, N'SELECT *
FROM
  (SELECT zzzzsys_session_id,
          TRIM(BOTH ''"''
               FROM JSON_EXTRACT(sss_access, ''$.session.zzzzsys_user_id'')) AS login,
          null AS USER,
          sss_login_time AS login_time,
          TRIM(BOTH ''"'' FROM JSON_EXTRACT(sss_access, ''$.session.ip_address'')) as ip 
   FROM zzzzsys_session
   WHERE TRIM(BOTH ''"''
              FROM JSON_EXTRACT(sss_access, ''$.session.global_access'')) = ''1''
			  
			  
   UNION ALL SELECT 
   
        zzzzsys_session_id AS ses_id,
        sus_login_name AS login,
        sus_name AS name,
        sss_login_time AS login_time,
        TRIM(BOTH ''"'' FROM JSON_EXTRACT(sss_access, ''$.session.ip_address'')) as ip
        
   FROM zzzzsys_user
   JOIN zzzzsys_session
   WHERE zzzzsys_user_id = TRIM(BOTH ''"''
                                FROM JSON_EXTRACT(sss_access, ''$.session.zzzzsys_user_id'')) 
) T
ORDER BY login_time DESC
', N'function nuSelectBrowse() {
}


nuHide(''nuAddButton'');

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nusetup', N'edit', N'nusetup', N'Setup', N'zzzzsys_setup', N'zzzzsys_setup_id', N'', 0, 0, N'', N'$(''#set_header'').addClass(''html'');
  
$(''.html'').dblclick(function() {
	nuOpenAce(''HTML'', this.id);
});


$(''#nuDeleteButton'').remove();
$(''#nuCloneButton'').remove();


nuSetToolTip(''set_denied'',nuTranslate(''Disallow access to nuBuilder\''s core forms.''), true);

nuHide(''set_code_snippet_lookupcode'');
nuHide(''label_set_header'');

nuSetProperty(''set_header_current'', $(''#set_header'').val());
nuSetProperty(''set_language_current'', $(''#set_language'').val());

$("select[id=set_languages_included] option:first").text("(None)").val('' '');

$("#set_languages_included option").click(function() {
    if ($(this).is(":selected") && $(this).attr(''value'') === '' '') {
        if (confirm("Unselect all?")) {
            $("#set_languages_included").val([]).addClass(''nuEdited'');
        } else {
            $("set_languages_included option[value='' '']").prop("selected", false);
        }

    }
});




// Code Snippets form
nuSetSnippetFormFilter(0, 1 , 0, 0); 


var l = $("#set_language");
if (l.val() === '''') {
    l.append($(''<option>'', { value: 1, text: nuTranslate("English"), disabled : true, selected: true, hidden: true }))
}

nuSelectMultiWithoutCtrl(''set_languages_included'');

var d = nuDevMode();
if (!d) { 
    nuHide(''nuTab3'');
}    

$(''#set_files_version_user'').val(nuGetFilesVersion());

function dateToday() {
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth() + 1;
	var y = date.getFullYear();
	return y + "."  + (m <= 9 ? ''0'' + m : m) + ''.'' + (d <= 9 ? ''0'' + d : d);
}

function incVersion(i) {
	var dbv = $(''#''+ i).val();
	var dbvSplit = dbv.split("-");
	major = dbvSplit[0];
	date = dbvSplit[1].slice(0, -3)
	build = parseInt(dbv.split(/[. ]+/).pop());

	today = dateToday();

	build ++;
	if (date !== dateToday()) {
	   build = 0;
	}

	return major + ''-''+ today + ''.'' + nuPad2(build);
}

function inDBVersion() {
	var dbInc =  incVersion(''set_db_version'');
	$(''#set_db_version_inc'').val(dbInc);
}

function inFilesVersion() {
	var filesInc =  incVersion(''set_files_version'');
	$(''#set_files_version_inc'').val(filesInc);
}


function selectToValueArray(id) {

    var a = [];
    $(''#'' + id + '' option:selected'').each(function(index) {
        if ($(this).text() !== '''') {
            a.push($(this).val())
        }
    });

    return a;

}


function nuBeforeSave() {


    if ($(''#set_language'').hasClass(''nuEdited'')) {
        $("#set_languages_included option[value=''" + $(''#set_language'').val() + "'']").prop("selected", true);
        $(''#set_languages_included'').change();
    }

    var v = '''';
    if (! $(''#set_languages_included'').hasClass(''nuEdited'')) v = ''-1'';
    
    if (v === '''' ) {
        var languagesIncluded = selectToValueArray(''set_languages_included'');
        v = languagesIncluded.length === 0 ? '''' : JSON.stringify(languagesIncluded)
    }
    
    nuSetProperty(''set_languages_included_json'', v);
    
     return true;


}')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nutab', N'browse', N'nutab', N'Form Tab', N'zzzzsys_tab', N'zzzzsys_tab_id', N'', 0, 0, N'SELECT * FROM zzzzsys_tab
JOIN zzzzsys_form ON zzzzsys_form_id = syt_zzzzsys_form_id
ORDER BY syt_order', N'
$("[data-nu-column=''3'']").each(function() {
    $(this).addClass(''nu_''+this.textContent);
});

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nutablookup', N'browse', N'nutablookup', N'Form Tab Lookup', N'zzzzsys_tab', N'zzzzsys_tab_id', N'', 0, 0, N'SELECT * FROM zzzzsys_tab
JOIN zzzzsys_form ON zzzzsys_form_id = syt_zzzzsys_form_id
JOIN #TABLE_ID# ON zzzzsys_form_id = theid
ORDER BY sfo_description, syt_order

 ', N'function getParentFormCode() {
    
    return parent.parent.nuCurrentProperties().form_code;
    
}

if(nuFormType() == ''browse''){
    
    if ( getParentFormCode() !== ''nuobject'' && window.filtered !== 1) {
       nuAddActionButton(''nuFilterCurrentForm'', ''Current Form only'', ''nuSearchAction("", "''+getParentFormCode()+''");window.filtered = 1;'');            
    }

    //-- run as the Form is loaded      

    $("[data-nu-column=''3'']").each(function() {
        $(this).addClass(''nu_''+this.textContent);
    });
    
    $(''#nuAddButton'').remove();
    $(''#nuPrintButton'').remove();


}
    

')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nutimezone', N'browse', N'nutimezone', N'Time Zone', N'zzzzsys_timezone', N'zzzzsys_timezone_id', N'', 0, 0, N'SELECT * 
FROM zzzzsys_timezone
ORDER BY stz_timezone', N'')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nutranslate', N'browseedit', N'nutranslate', N'Translation', N'zzzzsys_translate', N'zzzzsys_translate_id', N'', 0, 0, N'SELECT * 
FROM zzzzsys_translate
ORDER BY trl_language, trl_english', N'if (nuIsNewRecord()) {
    nuSetTitle(nuTranslate(''New''));
}

if (nuFormType() == ''edit'') {
    if (nuCurrentProperties().record_id.startsWith(''nu'')) {
        $(''#nuSaveButton'').remove();
        $(''#nuDeleteButton'').remove();
    }
}')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuupdate', N'launch', N'nuupdate', N'Update', N'', N'', N'', 0, 0, N'', N'nuHideHolders(0)
')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuuser', N'browseedit', N'nuuser', N'User', N'zzzzsys_user', N'zzzzsys_user_id', N'', 0, 0, N'SELECT * 
FROM zzzzsys_user 
LEFT JOIN zzzzsys_access ON zzzzsys_access_id = sus_zzzzsys_access_id
ORDER BY sus_name', N'function nuBeforeSave() {

    let c = $(''#sus_code'');
    if (c.val() === '''') {
        c.val($(''#sus_login_name'').val()).change();
    }

    return true;

}

if (nuFormType() == ''edit'') {

    nuSetPlaceholder(''sus_code'', nuTranslate(''(Optional)''));
    nuSetPlaceholder(''sus_email'', ''example@domain.com'');
    nuSetToolTip(''sus_code'', nuTranslate(''E.g. Employee Id, Foreign Id etc. Leaving blank will set the "Login Name"''));
    nuSetToolTip(''sus_language'', nuTranslate(''Leaving blank will use English''));
    
    $(''#sus_zzzzsys_access_id_open_button'').toggleClass(''input_button nuButton nuLookupButton'')


    $(''#sus_password_show_btn'').css("font-size", "smaller");

    if (nuIsNewRecord()) {
        nuSetTitle(nuTranslate(''New''));
    }
    else {
        nuSetTitle($(''#sus_name'').val());
    }

    // Fix chrome warnings
   //  $("#new_password").wrap(''<form id="pw1"></form>'').attr(''autocomplete'', ''off'');
   //  $("#check_password").wrap(''<form id="pw2"></form>'').attr(''autocomplete'', ''off'');
   
   $("#sus_name").attr(''autocomplete'', ''off'');
   $("#sus_login_name").attr(''autocomplete'', ''off'');
   $("#new_password").attr(''autocomplete'', ''off'');
   $("#check_password").attr(''autocomplete'', ''off'');

}

function nuTogglePasswordVisibility() {

    var p1 = $("#new_password");
    var p2 = $("#check_password");

    if (p1.prop("type") === "password") {
        p1[0].type = "text";
        p2[0].type = "text";
    }
    else {
        p1[0].type = "password";
        p2[0].type = "password";
    }

}
')
INSERT [dbo].[zzzzsys_form] ([zzzzsys_form_id], [sfo_type], [sfo_code], [sfo_description], [sfo_table], [sfo_primary_key], [sfo_browse_redirect_form_id], [sfo_browse_row_height], [sfo_browse_rows_per_page], [sfo_browse_sql], [sfo_javascript]) VALUES (N'nuuserhome', N'launch', N'nuuserhome', N'User Home', N'', N'', N'', 0, 0, N'', N'function openNuObject() {

    $(''#nuMessageDiv'').remove();
    nuPopup(''nuobject'', ''-1'', window.nuFORM.getCurrent().form_id, '''', 0);

}

if (nuSERVERRESPONSE.objects.length === 0 && window.global_access) {

    var headings = ''<h2>'' + nuTranslate(''Information'') + ''<h2>'';
	var message = nuTranslate(''Currently there are no objects on this Form'') + ''. <a href="javascript:openNuObject();">''+ nuTranslate(''Start adding some'') + ''</a>.'';
	nuMessage([headings, message]);

}')
GO
INSERT [dbo].[zzzzsys_format] ([zzzzsys_format_id], [srm_type], [srm_format], [srm_currency]) VALUES (N'nu59e28f061a779da', N'Number', N'$ 1,000.00', N'["$",",",".","2"]')
INSERT [dbo].[zzzzsys_format] ([zzzzsys_format_id], [srm_type], [srm_format], [srm_currency]) VALUES (N'nu5d8a9b303b55b6d', N'Date', N'dd-mm-yy', NULL)
INSERT [dbo].[zzzzsys_format] ([zzzzsys_format_id], [srm_type], [srm_format], [srm_currency]) VALUES (N'nu5d8a9b47ac4f5ae', N'Number', N' 1000.00', N'["","",".",2]')
INSERT [dbo].[zzzzsys_format] ([zzzzsys_format_id], [srm_type], [srm_format], [srm_currency]) VALUES (N'nu5fdfc72e7021ccf', N'Date', N'yyyy-mm-dd', NULL)
GO
INSERT [dbo].[zzzzsys_info] ([zzzzsys_info_id], [inf_code], [inf_details]) VALUES (N'nu5fe23e83aea3466', N'nuDBVersion', N'V.4.5-2021.03.17.01')
INSERT [dbo].[zzzzsys_info] ([zzzzsys_info_id], [inf_code], [inf_details]) VALUES (N'nu5fe23e83aea3467', N'nuFilesVersion', N'V.4.5-2021.03.17.00')
GO
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589a1fc46', N'nusample', N'', N'html', N'htmlsample', N'HTML', N'nu5bad6cb370eb06a', 120, 224, 261, 176, 31, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'', N'', NULL, N'<div id=''adiv'' style=''text-align:center;width:117px;border:1px solid red;'' class=''nuBreadcrumb''>
    Hello World
</div>', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589a370ca', N'nusample', N'', N'input', N'inputtextsample', N'Input:text', N'nu5bad6cb373c384f', 10, 227, 238, 300, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589a4d76a', N'nusample', N'', N'display', N'displaysample', N'Display', N'nu5bad6cb370eb06a', 130, 129, 261, 137, 20, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589a6400f', N'nusample', N'', N'select', N'selectsample', N'Select', N'nu5bad6cb370eb06a', 200, 274, 261, 80, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589a848cc', N'nusample', N'', N'word', N'bottomcorner', N' ', N'nu5bad6cb370eb06a', 220, 588, 595, 20, 18, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589a9b145', N'nusample', N'', N'select', N'selectmultiselectsample', N'Select:multiselect', N'nu5bad6cb370eb06a', 210, 331, 261, 117, 56, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'1', N'0', N'SELECT zzzzsys_format_id, srm_format FROM zzzzsys_format ORDER BY srm_type', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589ab1797', N'nusample', N'', N'lookup', N'lookupsample', N'Lookup', N'nu5bad6cb370eb06a', 140, 177, 261, 70, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'sal_zzzzsys_form_id', N'sal_code', N'150', N'', N'nuaccess', N'', N'', N'zzzzsys_access', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589ac75be', N'nusample', N'', N'word', N'wordsample', N'Word', N'nu5bad6cb370eb06a', 180, 33, 261, 117, 18, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589adce4d', N'nusample', N'', N'input', N'inputbuttonsample', N'Run', N'nu5bad6cb373c384f', 90, 42, 238, 117, 31, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589af5d86', N'nusample', N'', N'input', N'inputnumbersample', N'Input:number', N'nu5bad6cb373c384f', 40, 467, 238, 55, 20, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589b0af4c', N'nusample', N'', N'input', N'inputnudatesample', N'Input:nuDate', N'nu5bad6cb373c384f', 20, 347, 238, 95, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'D|dd-mm-yyyy', N'nuDate', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589b20a14', N'nusample', N'', N'input', N'inputnunumbersample', N'Input:nuNumber', N'nu5bad6cb373c384f', 30, 407, 238, 90, 20, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|1000.00', N'nuNumber', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589b3714b', N'nusample', N'', N'calc', N'calcsample', N'Calc', N'nu5bad6cb370eb06a', 170, 81, 261, 98, 20, N'1', N'right', N'0', N'0', N'nuTotal(''inputnunumbersample'') + nuTotal(''inputnumbersample'')', N'N|1000.00', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'nuNumber', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589b4c69b', N'nusample', N'', N'input', N'inputcheckboxsample', N'Input:checkbox', N'nu5bad6cb373c384f', 70, 107, 238, 70, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589b61190', N'nusample', N'', N'input', N'inputnuscrollsample', N'Input:nuScroll', N'nu5bad6cb373c384f', 80, 287, 238, 176, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589b75a6d', N'nusample', N'', N'textarea', N'textareasample', N'Textarea', N'nu5bad6cb370eb06a', 150, 407, 261, 195, 64, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589b8b4a1', N'nusample', N'', N'word', N'labelword', N'Word', N'nu5bad6cb370eb06a', 190, 33, 214, 40, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589bce3d7', N'nusample', N'', N'input', N'inputnuautonumbersample', N'Input:nuAutoNumber', N'nu5bad6cb373c384f', 50, 167, 238, 73, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 1000, N'N|$ 1,000.00', N'nuAutoNumber', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589cf91a2', N'nusample', N'', N'input', N'inputfilesample', N'Input:file', N'nu5bad6cb373c384f', 60, 527, 238, 300, 66, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 89, N'N|$ 1,000.00', N'file', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e446589d1c64d', N'nusample', N'', N'image', N'imagesample', N'Image', N'nu5bad6cb370eb06a', 160, 507, 261, 98, 85, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'nu5bad6cb37d02d01')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e44658a0c7724', N'nusample', N'', N'subform', N'subformsample', N'Subform', N'nu5bad6cb3732c76e', 110, 53, 260, 300, 250, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nusamplesubformform', N'zzzzsys_debug_id', N'1', N'1', N'g', N'', 89, N'N|$ 1,000.00', N'file', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu59e44658a2b25af', N'nusample', N'', N'word', N'labelbutton', N'Input : button', N'nu5bad6cb373c384f', 100, 42, 114, 40, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb325c8954', N'nuobject', N'zzzzsys_object', N'subform', N'zzzzsys_event_sf', N'Javascript', N'nu5bad6cb370b409e', 800, 48, 24, 700, 400, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'b', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'nuevent', N'sev_zzzzsys_object_id', N'1', N'1', N'g', N'zzzzsys_event', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32600c97', N'nuhome', N'', N'run', N'run_access', N'Access Levels', N'nu5bad6cb367c5125', 60, 99, 271, 194, 30, N'1', N'center', N'0', N'0', N'', N'', N'nuaccess', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb326243f9', N'nupassword', N'zzzzsys_user', N'display', N'the_user', N' ', N'nu5bad6cb36ed494f', 10, 46, 181, 200, 18, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT sus_login_name
FROM zzzzsys_user
WHERE zzzzsys_user_id = ''#RECORD_ID#''', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3263f2a8', N'nuform', N'zzzzsys_form', N'select', N'sfo_type', N'Form Type', N'nu5bad6cb36791fd5', 10, 32, 142, 140, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'browse|Browse|
edit|Edit|browseedit|
Browse and Edit|
launch|Launch|
subform|Subform', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3265cea1', N'nuform', N'zzzzsys_form', N'input', N'sfo_code', N'Code', N'nu5bad6cb36791fd5', 20, 56, 142, 285, 18, N'1', N'left', N'2', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32680d97', N'nuform', N'zzzzsys_form', N'input', N'sfo_description', N'Description', N'nu5bad6cb36791fd5', 30, 80, 142, 377, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb326a4367', N'nuform', N'zzzzsys_form', N'input', N'sfo_table', N'Table Name', N'nu5bad6cb36791fd5', 40, 104, 142, 285, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuFORM.getTables()', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb326ddb36', N'nuform', N'zzzzsys_form', N'input', N'sfo_primary_key', N'Primary Key', N'nu5bad6cb36791fd5', 50, 128, 142, 285, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuFORM.tableSchema[$("#sfo_table").val()]?nuFORM.tableSchema[$("#sfo_table").val()].names:[]', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb327181a4', N'nuform', N'zzzzsys_form', N'input', N'sfo_browse_row_height', N'Row Height', N'nu5bad6cb36757b92', 120, 17, 117, 50, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32737662', N'nuform', N'zzzzsys_form', N'input', N'sfo_browse_rows_per_page', N'Rows Per Page', N'nu5bad6cb36757b92', 130, 17, 309, 50, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3275e50e', N'nuform', N'zzzzsys_form', N'lookup', N'sfo_browse_redirect_form_id', N'Redirect To', N'nu5bad6cb36757b92', 140, 289, 117, 150, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'sfo_code', N'sfo_description', N'280', N'', N'nuform', N'', N'', N'zzzzsys_form', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3278653c', N'nuform', N'zzzzsys_form', N'textarea', N'sfo_browse_sql', N'SQL', N'nu5bad6cb36757b92', 100, 360, 117, 891, 139, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb327ab3b8', N'nuform', N'zzzzsys_form', N'subform', N'zzzzsys_browse_sf', N'Columns', N'nu5bad6cb36757b92', 110, 49, 117, 894, 228, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'nubrowse', N'sbr_zzzzsys_form_id', N'1', N'1', N'g', N'zzzzsys_browse', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb327ca554', N'nubrowse', N'zzzzsys_browse', N'input', N'sbr_title', N'Title', N'nu5bad6cb3683fa36', 10, 8, 69, 250, 20, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb327ee8dc', N'nubrowse', N'zzzzsys_browse', N'input', N'sbr_display', N'Display', N'nu5bad6cb3683fa36', 20, 34, 69, 300, 20, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuFORM.SQLFields($(''#sfo_browse_sql'').val())', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32812c21', N'nuform', N'zzzzsys_form', N'word', N'phpwrd', N'PHP', N'nu5bad6cb37026348', 230, 23, 42, 40, 17, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb328350f1', N'nubrowse', N'zzzzsys_browse', N'select', N'sbr_align', N'Align', N'nu5bad6cb3683fa36', 30, 60, 69, 65, 20, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'l|Left|r|Right|c|Center', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32856f55', N'nubrowse', N'zzzzsys_browse', N'select', N'sbr_format', N'Format', N'nu5bad6cb3683fa36', 40, 86, 69, 100, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT 
   CONCAT(LEFT(srm_type, 1), ''|'', TRIM(srm_format)) AS a, 
   srm_format AS b 
FROM zzzzsys_format
ORDER BY srm_type', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb328796fe', N'nubrowse', N'zzzzsys_browse', N'input', N'sbr_width', N'Width', N'nu5bad6cb3683fa36', 50, 112, 69, 50, 20, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3289c6f6', N'nubrowse', N'zzzzsys_browse', N'input', N'sbr_order', N'Order', N'nu5bad6cb3683fa36', 60, 138, 69, 50, 20, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb328be090', N'nuform', N'zzzzsys_form', N'subform', N'zzzzsys_tab_sf', N'Tabs', N'nu5bad6cb36791fd5', 60, 187, 142, 869, 300, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nutab', N'syt_zzzzsys_form_id', N'1', N'1', N'g', N'zzzzsys_tab', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb328dde63', N'nutab', N'zzzzsys_tab', N'input', N'syt_title', N'Title', N'nu5bad6cb36c9250f', 10, 10, 100, 130, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb328f889b', N'nutab', N'zzzzsys_tab', N'input', N'syt_order', N'Order', N'nu5bad6cb36c9250f', 20, 31, 100, 46, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb329136ba', N'nuform', N'zzzzsys_form', N'input', N'bb_event', N'Before Browse', N'nu5bad6cb37026348', 170, 53, 42, 155, 29, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32930450', N'nubuildreport', N'zzzzsys_report', N'input', N'open_builder', N'Report Designer', N'nu5bad6cb36804778', 60, 178, 236, 186, 40, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3295b165', N'nubuildreport', N'zzzzsys_report', N'textarea', N'sre_layout', N'Layout', N'nu5bad6cb36804778', 80, 227, 236, 300, 100, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32976d5d', N'nuform', N'zzzzsys_form', N'textarea', N'sfo_javascript', N'Javascript', N'nu5bad6cb37026348', 240, 53, 225, 760, 415, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3299aecf', N'nuphp', N'zzzzsys_php', N'lookup', N'sph_zzzzsys_form_id', N'Launch From', N'nu5bad6cb36b27343', 60, 118, 142, 209, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'sfo_code', N'sfo_description', N'300', N'', N'nulaunchable', N'', N'', N'zzzzsys_form', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb329b8805', N'nuhome', N'', N'run', N'object_button', N'Objects', N'nu5bad6cb367c5125', 40, 155, 53, 194, 30, N'1', N'center', N'0', N'0', N'', N'', N'nuobject', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb329dcb6e', N'nuobject', N'zzzzsys_object', N'lookup', N'sob_all_zzzzsys_tab_id', N'Form Tab', N'nu5bad6cb3686cb0d', 30, 30, 122, 140, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'250', N'0', N'nutablookup', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb329fdf13', N'nuobject', N'zzzzsys_object', N'select', N'sob_all_type', N'Type', N'nu5bad6cb3686cb0d', 40, 54, 122, 100, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'calc|Calc|
display|Display|
html|HTML|
image|Image|
input|Input|
lookup|Lookup|
run|Run|
select|Select|
subform|Subform|
textarea|Textarea|
word|Word', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32a1c004', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_id', N'ID', N'nu5bad6cb3686cb0d', 60, 102, 122, 324, 20, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuFORM.tableSchema[$("#sob_all_table").val()]?nuFORM.tableSchema[$("#sob_all_table").val()].names:[]', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32a36c23', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_label', N'Label', N'nu5bad6cb3686cb0d', 50, 78, 122, 414, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32a5798c', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_order', N'Tabbing Order', N'nu5bad6cb3686cb0d', 20, 55, 0, 72, 18, N'1', N'right', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32a7637b', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_top', N'Top', N'nu5bad6cb3686cb0d', 80, 169, 122, 50, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32a9998f', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_left', N'Left', N'nu5bad6cb3686cb0d', 90, 198, 122, 50, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32abf6a9', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_width', N'Width', N'nu5bad6cb3686cb0d', 100, 227, 122, 50, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32ae0077', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_height', N'Height', N'nu5bad6cb3686cb0d', 110, 256, 122, 50, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32b06a65', N'nuobject', N'zzzzsys_object', N'select', N'sob_all_cloneable', N'Cloneable', N'nu5bad6cb3686cb0d', 150, 402, 122, 104, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32b263c1', N'nuobject', N'zzzzsys_object', N'select', N'sob_all_align', N'Align', N'nu5bad6cb3686cb0d', 130, 336, 122, 104, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'left|Left|right|Right|center|Center', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32b417d0', N'nuobject', N'zzzzsys_object', N'select', N'sob_all_validate', N'Validation', N'nu5bad6cb3686cb0d', 140, 369, 122, 104, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|None|1|No Blanks|2|No Duplicates', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32b5c449', N'nuobject', N'zzzzsys_object', N'select', N'sob_all_access', N'Access', N'nu5bad6cb3686cb0d', 120, 303, 122, 104, 18, N'1', N'center', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|Editable|1|Readonly|2|Hidden', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32b77005', N'nuobject', N'zzzzsys_object', N'word', N'calctotwrd', N'Objects', N'nu5bad6cb36f99a7e', 780, 162, 80, 343, 17, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32b9715a', N'nuobject', N'zzzzsys_object', N'word', N'calcfldwrd', N'Operators', N'nu5bad6cb36f99a7e', 790, 162, 505, 145, 17, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32bd0b0a', N'nuobject', N'zzzzsys_object', N'textarea', N'sob_html_code', N'HTML', N'nu5bad6cb36a71012', 650, 229, 148, 590, 218, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32bf6285', N'nuobject', N'zzzzsys_object', N'textarea', N'sob_display_sql', N'SQL', N'nu5bad6cb36974818', 360, 114, 99, 547, 384, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32c14343', N'nuobject', N'zzzzsys_object', N'textarea', N'sob_select_sql', N'SQL<br>or<br>List', N'nu5bad6cb369a6ee3', 380, 114, 99, 547, 384, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32c2f35b', N'nuobject', N'zzzzsys_object', N'input', N'sob_select_multiple', N'Multiple', N'nu5bad6cb369a6ee3', 390, 46, 94, 15, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32c4d9de', N'nuobject', N'zzzzsys_object', N'select', N'sob_input_type', N'Input Type (and class)', N'nu5bad6cb36a4af06', 620, 50, 240, 161, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'nuDate|nuDate|
nuNumber|nuNumber|
nuScroll|nuScroll|
nuAutoNumber|nuAutoNumber|

button|Button|
checkbox|Checkbox|
color|Color|
datetime-local|Datetime-Local|
email|Email|
file|File|
hidden|Hidden|
image|Image|
month|Month|
number|Number|
password|Password|
radio|Radio|
range|Range|
reset|Reset|
search|Search|
tel|Telephone|
text|Text|
time|Time|
url|URL|
week|Week


', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32c708be', N'nuobject', N'zzzzsys_object', N'select', N'sob_input_format', N'Format', N'nu5bad6cb36a4af06', 600, 75, 240, 161, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT 
   CONCAT(LEFT(srm_type, 1), ''|'', TRIM(srm_format)) AS a, 
   srm_format AS b 
FROM zzzzsys_format
ORDER BY srm_type
', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32c9102c', N'nuobject', N'zzzzsys_object', N'lookup', N'sob_subform_zzzzsys_form_id', N'Form', N'nu5bad6cb36a1c024', 520, 38, 178, 202, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'sfo_code', N'sfo_description', N'250', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32cb28dd', N'nuobject', N'zzzzsys_object', N'input', N'sob_subform_foreign_key', N'Foreign Key', N'nu5bad6cb36a1c024', 530, 68, 178, 202, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuFORM.tableSchema[$("#sob_subform_table").val()]?nuFORM.tableSchema[$("#sob_subform_table").val()].names:[]', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32cd0b84', N'nuobject', N'zzzzsys_object', N'select', N'sob_subform_add', N'Addable', N'nu5bad6cb36a1c024', 550, 98, 178, 60, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32ced09b', N'nuobject', N'zzzzsys_object', N'select', N'sob_subform_delete', N'Deleteable', N'nu5bad6cb36a1c024', 560, 128, 178, 60, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32d07376', N'nuobject', N'zzzzsys_object', N'select', N'sob_subform_type', N'Type', N'nu5bad6cb36a1c024', 570, 158, 178, 60, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'g|Grid|f|Form', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32d22215', N'nuobject', N'zzzzsys_object', N'lookup', N'sob_run_zzzzsys_form_id', N'Run', N'nu5bad6cb368d9c40', 290, 34, 85, 200, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'code', N'CONCAT(run, '' - '', description)', N'300', N'', N'nurunlist', N'', N'', N'zzzzsys_run_list', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32d3ef22', N'nuobject', N'zzzzsys_object', N'input', N'sob_run_filter', N'Filter', N'nu5bad6cb368d9c40', 300, 64, 85, 200, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32d6add9', N'nuobject', N'zzzzsys_object', N'input', N'sob_run_id', N'Record ID', N'nu5bad6cb368d9c40', 310, 94, 85, 200, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32d8ec39', N'nuobject', N'zzzzsys_object', N'select', N'sob_run_method', N'Method', N'nu5bad6cb368d9c40', 320, 124, 85, 80, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'b|Button|i|iFrame', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32dcbcb4', N'nuobject', N'zzzzsys_object', N'lookup', N'sob_lookup_zzzzsys_form_id', N'Form', N'nu5bad6cb369d0088', 440, 33, 97, 300, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'sfo_code', N'sfo_description', N'200', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32e1a66a', N'nuobject', N'zzzzsys_object', N'input', N'sob_lookup_code', N'Code', N'nu5bad6cb369d0088', 450, 61, 97, 200, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuFORM.tableSchema[$("#sob_lookup_table").val()]?nuFORM.tableSchema[$("#sob_lookup_table").val()].names:[]', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32e47d18', N'nuobject', N'zzzzsys_object', N'input', N'sob_lookup_description', N'Description', N'nu5bad6cb369d0088', 460, 89, 97, 299, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuFORM.tableSchema[$("#sob_lookup_table").val()]?nuFORM.tableSchema[$("#sob_lookup_table").val()].names:[]', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32e8733c', N'nuobject', N'zzzzsys_object', N'input', N'sob_lookup_description_width', N'Width', N'nu5bad6cb369d0088', 470, 89, 457, 50, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb32ec104d', N'nuobject', N'zzzzsys_object', N'textarea', N'sob_lookup_javascript', N'JavaScript', N'nu5bad6cb369d0088', 480, 184, 97, 600, 275, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3313ae2f', N'nuhome', N'', N'run', N'form_button', N'Forms', N'nu5bad6cb367c5125', 30, 99, 53, 194, 30, N'1', N'center', N'0', N'0', N'', N'', N'nuform', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3316ef87', N'nuevent', N'zzzzsys_event', N'textarea', N'sev_javascript', N'JavaScript', N'nu5bad6cb36aaa539', 20, 1, 255, 486, 100, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'sev_zzzsys_object_id', N'1', N'1', N'g', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb331a6d3e', N'nuevent', N'zzzzsys_event', N'input', N'sev_event', N'Event', N'nu5bad6cb36aaa539', 10, 1, 55, 150, 20, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'drag|drag|dragend|dragend|dragenter|dragenter|dragexit|dragexit|dragleave|dragleave|dragover|dragover|dragstart|dragstart|drop|drop|onclick|onclick|onblur|onblur|onchange|onchange|onfocus|onfocus|onkeydown|onkeydown', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'sev_zzzsys_object_id', N'1', N'1', N'g', N'', 0, N'', N'nuScroll', N'nuChooseEventList()', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3351b6a4', N'nuaccess', N'zzzzsys_access', N'lookup', N'sal_zzzzsys_form_id', N'Home', N'nu5bad6cb36ac903f', 10, 56, 115, 200, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'sfo_code', N'sfo_description', N'350', N'', N'nulaunchform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3364460a', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_zzzzsys_form_id', N'Form ID', N'nu5bad6cb3686cb0d', 270, 13, 0, 72, 18, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb336a9f96', N'nuaccess', N'zzzzsys_access', N'input', N'sal_code', N'Code', N'nu5bad6cb36ac903f', 20, 90, 115, 200, 18, N'1', N'left', N'2', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33715015', N'nuaccessforms', N'zzzzsys_access_form', N'lookup', N'slf_zzzzsys_form_id', N'Form', N'nu5bad6cb36b994d2', 10, 20, 87, 280, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'sfo_code', N'sfo_description', N'300', N'', N'nunonsystemform', N'', N'', N'zzzzsys_form', N'', N'', N'1', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33762770', N'nuaccess', N'zzzzsys_access', N'subform', N'accform', N' ', N'nu5bad6cb36af0c58', 40, 20, 50, 1093, 540, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nuaccessforms', N'slf_zzzzsys_access_id', N'1', N'1', N'g', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb337ab8d0', N'nuaccessforms', N'zzzzsys_access_form', N'input', N'slf_add_button', N'<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=''nuActionButton''>Add</span>', N'nu5bad6cb36b994d2', 20, 75, 87, 53, 15, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'sfo_code', N'sfo_description', N'200', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb338330bb', N'nuaccessforms', N'zzzzsys_access_form', N'input', N'slf_save_button', N'<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=''nuActionButton''>Save</span>', N'nu5bad6cb36b994d2', 40, 127, 87, 60, 15, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'sfo_code', N'sfo_description', N'200', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb338c7612', N'nuaccessforms', N'zzzzsys_access_form', N'input', N'slf_delete_button', N'<br>&nbsp;&nbsp;&nbsp;&nbsp;<span class=''nuActionButton''>Delete</span>', N'nu5bad6cb36b994d2', 60, 101, 87, 65, 15, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'sfo_code', N'sfo_description', N'200', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3399c9cf', N'nuaccessforms', N'zzzzsys_access_form', N'input', N'slf_clone_button', N'<br>&nbsp;&nbsp;&nbsp;&nbsp;<span class=''nuActionButton''>Clone</span>', N'nu5bad6cb36b994d2', 50, 153, 87, 60, 15, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'sfo_code', N'sfo_description', N'200', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33a00c7d', N'nuaccess', N'zzzzsys_access', N'word', N'button_title', N'Enable Buttons...', N'nu5bad6cb36af0c58', 50, 27, 712, 200, 18, N'1', N'center', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33a4e07f', N'nuaccessforms', N'zzzzsys_access_form', N'input', N'slf_print_button', N'<br>&nbsp;&nbsp;&nbsp;&nbsp;<span class=''nuActionButton''>Print</span>', N'nu5bad6cb36b994d2', 30, 49, 87, 53, 15, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'sfo_code', N'sfo_description', N'200', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
GO
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33a9d661', N'nuhome', N'', N'run', N'run_user', N'Users', N'nu5bad6cb367c5125', 70, 155, 271, 194, 30, N'1', N'center', N'0', N'0', N'', N'', N'nuuser', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33ad88b7', N'nuuser', N'zzzzsys_user', N'input', N'sus_name', N'Name', N'nu5bad6cb36b63cae', 10, 47, 167, 329, 18, N'1', N'left', N'2', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33b1013c', N'nuuser', N'zzzzsys_user', N'input', N'sus_email', N'Email', N'nu5bad6cb36b63cae', 80, 263, 167, 329, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33b42890', N'nuuser', N'zzzzsys_user', N'input', N'sus_login_name', N'Login Name', N'nu5bad6cb36b63cae', 30, 97, 167, 238, 18, N'1', N'left', N'2', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33b84bf4', N'nuuser', N'zzzzsys_user', N'input', N'new_password', N'Password', N'nu5bad6cb36b63cae', 40, 133, 167, 238, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'password', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33d2481a', N'nuuser', N'zzzzsys_user', N'input', N'check_password', N'Confirm Password', N'nu5bad6cb36b63cae', 50, 158, 167, 238, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'password', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33d99a4b', N'nuuser', N'zzzzsys_user', N'lookup', N'sus_zzzzsys_access_id', N'Access Level', N'nu5bad6cb36b63cae', 20, 72, 167, 238, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'sal_code', N'sal_description', N'200', N'', N'nuaccess', N'', N'', N'zzzzsys_access', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33e17c28', N'nuphp', N'zzzzsys_php', N'input', N'sph_code', N'Code', N'nu5bad6cb36b27343', 10, 37, 142, 209, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'[''nuBeforeSave'',''nuAfterSave'',''nuBeforeEdit'',''nuBeforeBrowse'',''nuBeforeDelete'',''nuAfterDelete'',''nuStartup'',''nuCheckPasswordPolicy'',''nuInvalidLogin'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33e77084', N'nusetup', N'zzzzsys_setup', N'word', N'wrdauth', N'Auth SMTP Information', N'nu5bad6cb36e31edf', 100, 39, 67, 200, 18, N'1', N'center', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33ed5ffe', N'nuphp', N'zzzzsys_php', N'textarea', N'sph_php', N'PHP', N'nu5bad6cb36b27343', 80, 172, 142, 781, 400, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33f2e9ce', N'nuhome', N'', N'run', N'edit_php', N'Procedure', N'nu5bad6cb36efb50c', 150, 43, 270, 195, 30, N'1', N'center', N'0', N'0', N'', N'', N'nuphp', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33fc3e37', N'nuhome', N'', N'run', N'edit_report', N'Report', N'nu5bad6cb36efb50c', 140, 155, 53, 195, 30, N'1', N'center', N'0', N'0', N'', N'', N'nubuildreport', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb33fe854c', N'nuphp', N'zzzzsys_php', N'input', N'sph_description', N'Description', N'nu5bad6cb36b27343', 20, 64, 142, 541, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3400c80a', N'nubuildreport', N'zzzzsys_report', N'lookup', N'sre_zzzzsys_form_id', N'Launch From', N'nu5bad6cb36804778', 50, 140, 236, 186, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'sfo_code', N'sfo_description', N'200', N'', N'nulaunchable', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb340c5469', N'nubuildreport', N'zzzzsys_report', N'input', N'sre_code', N'Code', N'nu5bad6cb36804778', 10, 28, 236, 186, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb340fb412', N'nubuildreport', N'zzzzsys_report', N'input', N'sre_description', N'Description', N'nu5bad6cb36804778', 20, 56, 236, 300, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34130517', N'nuaccessgroup', N'zzzzsys_user_group_access_level', N'lookup', N'gal_zzzzsys_access_id', N'Access To..', N'nu5bad6cb36bdec72', 40, 40, 107, 70, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT 
color_id,
col_description
FROM color
ORDER BY col_description', N'sal_code', N'sal_description', N'300', N'', N'nuaccess', N'', N'', N'zzzzsys_access', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3416c803', N'nudebug', N'zzzzsys_debug', N'textarea', N'deb_message', N' ', N'nu5bad6cb36bf8d38', 10, 16, 30, 786, 432, N'0', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb341ba4c3', N'nuphp', N'zzzzsys_php', N'select', N'sph_run', N'Run', N'nu5bad6cb36b27343', 70, 145, 142, 136, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'hide|Hidden|
window|In a new window', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb341fdfc3', N'nuaccessreport', N'zzzzsys_access_php', N'lookup', N'slp_zzzzsys_php_id', N'Procedure', N'nu5bad6cb36c55179', 0, 20, 100, 255, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'sph_code', N'sph_description', N'280', N'', N'nuphp', N'', N'', N'zzzzsys_php', N'', N'', N'1', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34231992', N'nuaccess', N'zzzzsys_access', N'subform', N'accphp', N' ', N'nu5bad6cb36c16b42', 60, 20, 50, 630, 540, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nuaccessreport', N'slp_zzzzsys_access_id', N'1', N'1', N'g', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb342620ba', N'nuaccess', N'zzzzsys_access', N'subform', N'accreport', N' ', N'nu5bad6cb36c39fc8', 70, 20, 50, 630, 540, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nuaccesslevelreport', N'sre_zzzzsys_access_id', N'1', N'1', N'g', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb342de027', N'nuaccesslevelreport', N'zzzzsys_access_report', N'lookup', N'sre_zzzzsys_report_id', N'Report', N'nu5bad6cb36c75655', 30, 47, 163, 255, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'sre_code', N'sre_description', N'280', N'0', N'nubuildreport', N'', N'', N'zzzzsys_report', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb343a3176', N'nubuildreport', N'zzzzsys_report', N'input', N'sre_group', N'Group', N'nu5bad6cb36804778', 30, 84, 236, 186, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34460b5f', N'nuhome', N'', N'run', N'run_report', N'Run Report', N'nu5bad6cb367c5125', 90, 99, 488, 194, 30, N'1', N'center', N'0', N'0', N'', N'', N'nurunreport', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nurunreport', N'', N'0', N'0', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34489ea2', N'nuhome', N'', N'run', N'run_php', N'Run Procedure', N'nu5bad6cb367c5125', 80, 43, 488, 194, 30, N'1', N'center', N'0', N'0', N'', N'', N'nurunphp', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb344b93ac', N'nulaunchdates', N'', N'input', N'from_date', N'Between', N'nu5bad6cb36cfbbfa', 10, 72, 115, 90, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'D|dd-mmm-yyyy', N'nuDate', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb344dffcc', N'nulaunchdates', N'', N'input', N'to_date', N'And', N'nu5bad6cb36cfbbfa', 20, 72, 243, 90, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'D|dd-mmm-yyyy', N'nuDate', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb345094c6', N'nubuildreport', N'zzzzsys_report', N'lookup', N'sre_zzzzsys_php_id', N'Table', N'nu5bad6cb36804778', 40, 112, 236, 186, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'code', N'description', N'200', N'', N'nubuildtable', N'', N'', N'zzzzsys_report_data', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3452cdfe', N'nuphp', N'zzzzsys_php', N'input', N'sph_group', N'Group', N'nu5bad6cb36b27343', 30, 91, 143, 209, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3454ed08', N'nuhome', N'', N'run', N'run_setup', N'Setup', N'nu5bad6cb367c5125', 50, 43, 271, 194, 30, N'1', N'center', N'0', N'0', N'', N'', N'nusetup', N'', N'b', N'1', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb345bcd24', N'nusetup', N'zzzzsys_setup', N'lookup', N'set_zzzzsys_timezone_id', N'Time Zone', N'nu5bad6cb36d97acd', 40, 140, 181, 330, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'stz_timezone', N'stz_timezone', N'0', N'', N'nutimezone', N'', N'', N'zzzzsys_timezone', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3462cd79', N'nuuser', N'zzzzsys_user', N'select', N'sus_language', N'Language', N'nu5bad6cb36b63cae', 70, 238, 167, 153, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT trl_language, trl_language AS a 
FROM zzzzsys_translate
GROUP BY trl_language ', N'stz_timezone', N'stz_timezone', N'0', N'', N'nutimezone', N'', N'', N'zzzzsys_timezone', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb346642c0', N'nusetup', N'zzzzsys_setup', N'select', N'set_smtp_use_authentication', N'Use Authentication', N'nu5bad6cb36e31edf', 170, 295, 167, 59, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb346a7c3b', N'nusetup', N'zzzzsys_setup', N'input', N'set_smtp_username', N'User Name', N'nu5bad6cb36e31edf', 110, 97, 167, 235, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb346df926', N'nusetup', N'zzzzsys_setup', N'input', N'set_smtp_password', N'Password', N'nu5bad6cb36e31edf', 120, 130, 167, 235, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34701820', N'nusetup', N'zzzzsys_setup', N'input', N'set_smtp_host', N'Host', N'nu5bad6cb36e31edf', 130, 163, 167, 235, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34724534', N'nusetup', N'zzzzsys_setup', N'input', N'set_smtp_from_address', N'Address', N'nu5bad6cb36e31edf', 140, 196, 167, 235, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3475031f', N'nusetup', N'zzzzsys_setup', N'input', N'set_smtp_from_name', N'From Name', N'nu5bad6cb36e31edf', 150, 229, 167, 235, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3477c73b', N'nusetup', N'zzzzsys_setup', N'input', N'set_smtp_port', N'Port', N'nu5bad6cb36e31edf', 160, 262, 167, 59, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb347da00e', N'nusetup', N'zzzzsys_setup', N'textarea', N'set_header', N'Header', N'nu5bad6cb36e9143a', 10, 69, 81, 1300, 500, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT trl_language, trl_language AS a 
FROM zzzzsys_translate
GROUP BY trl_language ', N'stz_timezone', N'stz_timezone', N'0', N'', N'nutimezone', N'', N'', N'zzzzsys_timezone', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb347fc49c', N'nuhome', N'', N'run', N'run_lang', N'Translation', N'nu5bad6cb36efb50c', 180, 43, 488, 195, 30, N'1', N'center', N'0', N'0', N'', N'', N'nutranslate', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3482a7d5', N'nutranslate', N'zzzzsys_translate', N'input', N'trl_language', N'Language', N'nu5bad6cb36eb07f0', 10, 54, 142, 100, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuLanguages()', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3498f4e8', N'nutranslate', N'zzzzsys_translate', N'input', N'trl_english', N'English', N'nu5bad6cb36eb07f0', 20, 85, 142, 572, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb349c926f', N'nutranslate', N'zzzzsys_translate', N'input', N'trl_translation', N'Translation', N'nu5bad6cb36eb07f0', 30, 116, 142, 572, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34a11c21', N'nupassword', N'zzzzsys_user', N'input', N'new_password_check', N'Confirm New Password', N'nu5bad6cb36ed494f', 40, 133, 181, 200, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'password', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34a592fd', N'nupassword', N'zzzzsys_user', N'input', N'new_password', N'New Password', N'nu5bad6cb36ed494f', 30, 104, 181, 200, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'password', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34a8d913', N'nupassword', N'zzzzsys_user', N'input', N'old_password', N'Current Password', N'nu5bad6cb36ed494f', 20, 75, 181, 200, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'SELECT CONCAT(''( '', sus_login_name, '' )'')
FROM zzzzsys_user
WHERE zzzzsys_user_id = ''#RECORD_ID#''', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'password', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34b050a0', N'nuobject', N'zzzzsys_object', N'input', N'ab_event', N'After Browse', N'nu5bad6cb369d0088', 500, 138, 97, 167, 29, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34c005d7', N'nuform', N'zzzzsys_form', N'input', N'be_event', N'Before Edit', N'nu5bad6cb37026348', 180, 87, 42, 155, 29, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34c4775c', N'nuform', N'zzzzsys_form', N'input', N'bs_event', N'Before Save', N'nu5bad6cb37026348', 190, 121, 42, 155, 29, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34d23de5', N'nuform', N'zzzzsys_form', N'input', N'as_event', N'After Save', N'nu5bad6cb37026348', 200, 155, 42, 155, 29, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34d7e1db', N'nuform', N'zzzzsys_form', N'input', N'bd_event', N'Before Delete', N'nu5bad6cb37026348', 210, 189, 42, 155, 29, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34e2eaec', N'nuform', N'zzzzsys_form', N'input', N'ad_event', N'After Delete', N'nu5bad6cb37026348', 220, 223, 42, 155, 29, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34e5cc53', N'nuform', N'zzzzsys_form', N'input', N'previewedit', N'Preview Edit Form', N'nu5bad6cb36791fd5', 90, 123, 856, 155, 43, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34e80d7e', N'nuobject', N'zzzzsys_object', N'input', N'sob_lookup_table', N'Code', N'nu5bad6cb369d0088', 490, 19, 9, 50, 18, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34ea0b99', N'nuhome', N'', N'run', N'run_fast_form', N'Fast Form', N'nu5bad6cb36efb50c', 120, 43, 53, 195, 30, N'1', N'center', N'0', N'0', N'', N'', N'nufflaunch', N'', N'b', N'-1', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34ebf5bd', N'nufastformobjects', N'zzzzsys_object', N'input', N'ff_field', N'Field Name', N'nu5bad6cb36f72f8e', 20, 20, 30, 250, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuFORM.tableSchema[$("#fastform_table").val()]?nuFORM.tableSchema[$("#fastform_table").val()].names:[]', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34ee220e', N'nufastformobjects', N'zzzzsys_object', N'input', N'ff_label', N' Label', N'nu5bad6cb36f72f8e', 10, 49, 24, 220, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34f0470a', N'nufflaunch', N'', N'subform', N'obj_sf', N' ', N'nu5bad6cb36f36433', 90, 140, 489, 611, 441, N'1', N'right', N'0', N'0', N'', N'', N'nuffcustomobjects', N'', N'i', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'zzzzsys_object', N'nufastformobjects', N'zzzzsys_debug_id', N'1', N'1', N'g', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34f26ff6', N'nuobject', N'zzzzsys_object', N'html', N'nucalculator', N' ', N'nu5bad6cb36f99a7e', 760, 182, 505, 145, 210, N'1', N'right', N'0', N'1', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'<table>
  <tr>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''>1</td>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''>2</td> 
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''>3</td> 
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton'' title=''Add a Space''> </td> 
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''> + </td>
  </tr>
  <tr>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''>4</td>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''>5</td> 
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''>6</td> 
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''>.</td> 
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''> - </td> 
  </tr>
  <tr>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''>7</td>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''>8</td> 
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''>9</td> 
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''>0</td>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''> * </td>
  </tr>
  <tr>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''> ? </td>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''> : </td> 
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''> = </td> 
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''> ! </td> 
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''> / </td>
  </tr>
  <tr>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''> ( </td>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton''> ) </td>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton'' colspan=3>Clear</td>
  </tr>
  <tr>
    <td onclick=''nuAddToFormula(event)''  class=''nuCalculatorButton'' colspan=5> Math.round( </td>
  </tr>
</table>', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34f4618a', N'nuobject', N'zzzzsys_object', N'textarea', N'sob_calc_formula', N'Formula', N'nu5bad6cb36f99a7e', 740, 51, 80, 570, 83, N'1', N'left', N'0', N'0', N' +', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34f64fa1', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_table', N'Table', N'nu5bad6cb3686cb0d', 10, 33, 0, 72, 18, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34f8418a', N'nuhome', N'', N'run', N'run_format', N'Format', N'nu5bad6cb36efb50c', 170, 155, 270, 195, 30, N'1', N'center', N'0', N'0', N'', N'', N'nuformat', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34fa79c0', N'nuformat', N'zzzzsys_format', N'select', N'srm_type', N'Input Type', N'nu5bad6cb36fcbc18', 10, 45, 115, 100, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'Number|nuNumber|
Date|nuDate', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34fcb8ad', N'nuformat', N'zzzzsys_form', N'input', N'srm_format', N'Format', N'nu5bad6cb36fcbc18', 30, 83, 115, 498, 35, N'0', N'left', N'1', N'1', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb34feb6d2', N'nuobject', N'zzzzsys_object', N'input', N'sob_input_javascript', N'JavaScript Array', N'nu5bad6cb36a4af06', 630, 98, 240, 436, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3502b8ec', N'nuobject', N'zzzzsys_object', N'select', N'sob_calc_format', N'Format', N'nu5bad6cb36f99a7e', 730, 17, 80, 143, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT 
   CONCAT(LEFT(srm_type, 1), ''|'', TRIM(srm_format)) AS a, 
   srm_format AS b 
FROM zzzzsys_format
WHERE srm_type = ''Number''', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3507cf3f', N'nuformat', N'zzzzsys_format', N'html', N'nucalculator', N' ', N'nu5bad6cb36fcbc18', 80, 135, 115, 499, 32, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'<table id=''tof'' class=''nuEditBody'' style=''width:500px''>
  <tr>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>yy</td>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>yyyy</td>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>pp</td>
  </tr>
  <tr>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>dd</td>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>ddd</td> 
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>dddd</td> 
  </tr>
  <tr>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>mm</td>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>mmm</td> 
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>mmmm</td>
  </tr>
  <tr>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>hh</td> 
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>nn</td>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>ss</td>
  </tr>
  <tr>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>-</td>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>:</td> 
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>/</td> 
  </tr>
  <tr>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>.</td>
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>Space</td> 
    <td onclick=''nuAddToFormat(event)''  class=''nuCalculatorButton date'' width=''100%''>,</td> 
  </tr>
</table>
', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3513b16c', N'nuformat', N'zzzzsys_format', N'input', N'sign', N'Sign', N'nu5bad6cb36fcbc18', 40, 136, 115, 52, 30, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'[''$'', ''£'', ''€'', ''¢'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3518a9c0', N'nuform', N'zzzzsys_form', N'input', N'previewbrowse', N'Preview Browse Form', N'nu5bad6cb36791fd5', 80, 71, 856, 155, 43, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3526def5', N'nuobject', N'zzzzsys_object', N'html', N'add_total', N' ', N'nu5bad6cb36f99a7e', 750, 182, 80, 343, 322, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'1', N'0', N'SELECT 
   sob_all_zzzzsys_form_id AS theform,
   sob_all_id as b
FROM zzzzsys_object 
WHERE sob_input_type = ''nuNumber''
OR sob_input_type = ''number''
OR sob_all_type = ''calc''

UNION 

SELECT 
   su.sob_all_zzzzsys_form_id AS theform,
   CONCAT(su.sob_all_id, ''.'', inp.sob_all_id) as b
FROM zzzzsys_object AS su
JOIN zzzzsys_object AS inp ON su.sob_subform_zzzzsys_form_id = inp.sob_all_zzzzsys_form_id
WHERE su.sob_all_type = ''subform''
AND (
        inp.sob_input_type = ''nuNumber'' OR 
        inp.sob_input_type = ''number'' OR 
        inp.sob_all_type = ''calc''
    )', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N' ', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3528f51c', N'nuobject', N'zzzzsys_object', N'input', N'sob_subform_table', N'Code', N'nu5bad6cb36a1c024', 540, 3, 3, 50, 18, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb352b1230', N'nufflaunch', N'', N'word', N'ffwrd', N'New Fast Form', N'nu5bad6cb36f36433', 80, 95, 489, 611, 20, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb352dce42', N'nufflaunch', N'', N'input', N'fastform_table', N'Table Name', N'nu5bad6cb36f36433', 20, 53, 141, 267, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuFORM.getJustTables()', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35304ffd', N'nufastformobjects', N'zzzzsys_object', N'input', N'ff_id', N' ', N'nu5bad6cb36f72f8e', 30, 20, 30, 5, 18, N'1', N'left', N'1', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3532d677', N'nufflaunch', N'', N'input', N'new_id', N'New ID', N'nu5bad6cb36f36433', 50, 12, 1, 10, 18, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3565664f', N'nufflaunch', N'', N'html', N'nucalculator', N' ', N'nu5bad6cb36f36433', 60, 140, 64, 388, 313, N'1', N'left', N'0', N'1', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'
<table id=''tof'' style=''width:390px''>
  <tr>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589a370ca'' class=''nuCalculatorButton nu_input'' style=''font-size:18px'' width=''100%''>Input:Text</td>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589ac75be'' class=''nuCalculatorButton nu_word'' style=''font-size:18px'' width=''100%''>Word</td>
  </tr>
  <tr>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589adce4d'' class=''nuCalculatorButton nu_input'' style=''font-size:18px'' width=''100%''>Input:Button</td>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589b3714b'' class=''nuCalculatorButton nu_calc'' style=''font-size:18px'' width=''100%''>Calc</td>
  </tr>
  <tr>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589b4c69b'' class=''nuCalculatorButton nu_input'' style=''font-size:18px'' width=''100%''>Input:Checkbox</td>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589a4d76a'' class=''nuCalculatorButton nu_display'' style=''font-size:18px'' width=''100%''>Display</td>
  </tr>
  <tr>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589bce3d7'' class=''nuCalculatorButton nu_input'' style=''font-size:18px'' width=''100%''>Input:nuAutoNumber</td>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589ab1797'' class=''nuCalculatorButton nu_lookup'' style=''font-size:18px'' width=''100%''>Lookup</td>
  </tr>
  <tr>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589b61190'' class=''nuCalculatorButton nu_input'' style=''font-size:18px'' width=''100%''>Input:nuScroll</td>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589a1fc46'' class=''nuCalculatorButton nu_html'' style=''font-size:18px'' width=''100%''>HTML</td>
  </tr>
  <tr>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589b0af4c'' class=''nuCalculatorButton nu_input'' style=''font-size:18px'' width=''100%''>Input:nuDate</td>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589a6400f'' class=''nuCalculatorButton nu_select'' style=''font-size:18px'' width=''100%''>Select</td>
  </tr>
  <tr>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589b20a14'' class=''nuCalculatorButton nu_input'' style=''font-size:18px'' width=''100%''>Input:nuNumber</td>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589a9b145'' class=''nuCalculatorButton nu_select'' style=''font-size:18px'' width=''100%''>Select:Multiselect</td>
  </tr>
  <tr>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589af5d86'' class=''nuCalculatorButton nu_input'' style=''font-size:18px'' width=''100%''>Input:Number</td>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589b75a6d'' class=''nuCalculatorButton nu_textarea'' style=''font-size:18px'' width=''100%''>Textarea</td>
  </tr>
  <tr>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589cf91a2'' class=''nuCalculatorButton nu_input'' style=''font-size:18px'' width=''100%''>Input:File</td>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e446589d1c64d'' class=''nuCalculatorButton nu_image'' style=''font-size:18px'' width=''100%''>Image</td>
  </tr>
  <tr>
    <td onclick=''nuSelectFFObjects(event)'' id=''nu59e44658a0c7724'' class=''nuCalculatorButton nu_subform'' style=''font-size:18px'' width=''100%'' colspan="2">Subform</td>
  </tr>
</table>
', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3568c736', N'nufflaunch', N'', N'input', N'run_sam', N'?', N'nu5bad6cb36f36433', 70, 101, 430, 21, 21, N'1', N'center', N'1', N'0', N'', N'', N'', N'', N'b', N'-1', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb356dfe23', N'nuobject', N'zzzzsys_object', N'input', N'sob_input_count', N'Next Number', N'nu5bad6cb36a4af06', 610, 98, 240, 50, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT 
   CONCAT(LEFT(srm_type, 1), ''|'', TRIM(srm_format)) AS a, 
   srm_format AS b 
FROM zzzzsys_format
ORDER BY srm_type
', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb357033c6', N'nuhome', N'', N'run', N'run_file', N'Files', N'nu5bad6cb367c5125', 100, 43, 703, 194, 30, N'1', N'center', N'0', N'0', N'', N'', N'nufile', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35724861', N'nufile', N'zzzzsys_file', N'input', N'sfi_code', N'Code', N'nu5bad6cb3719774c', 10, 110, 153, 200, 18, N'1', N'left', N'2', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3574909c', N'nufile', N'zzzzsys_file', N'input', N'sfi_description', N'Description', N'nu5bad6cb3719774c', 30, 142, 153, 322, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35772a8c', N'nufile', N'zzzzsys_file', N'input', N'sfi_json_file', N'Upload File', N'nu5bad6cb3719774c', 60, 46, 153, 322, 50, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'file', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb357973bf', N'nufile', N'zzzzsys_file', N'html', N'view_image', N'View', N'nu5bad6cb3719774c', 20, 206, 153, 321, 267, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'<style>
img{
    width:100%;
    max-width:600px;
    max-height:600px;
}
</style>

<img 
  id="theview" 
  style="border:grey 1px solid;"
>

', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb357ff16d', N'nufile', N'zzzzsys_file', N'input', N'sfi_group', N'Group', N'nu5bad6cb3719774c', 40, 174, 153, 200, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3582c2ca', N'nuobject', N'zzzzsys_object', N'lookup', N'sob_image_zzzzsys_file_id', N'Image', N'nu5bad6cb371c865e', 590, 50, 108, 150, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'sfi_code', N'sfi_description', N'200', N'', N'nufile', N'', N'', N'zzzzsys_file', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb359524be', N'nuphp', N'zzzzsys_php', N'input', N'sph_system', N'Group', N'nu5bad6cb36b27343', 40, 1, 1, 100, 18, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35977ed6', N'nudebug', N'zzzzsys_debug', N'input', N'deb_added', N' ', N'nu5bad6cb36bf8d38', 10, 1, 1, 100, 20, N'0', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3599e41f', N'nuselect', N'zzzzsys_select', N'input', N'sse_description', N'Description', N'nu5bad6cb371e2de7', 10, 16, 116, 200, 18, N'1', N'left', N'2', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb359c1b05', N'nuhome', N'', N'run', N'run_sql', N'SQL', N'nu5bad6cb36efb50c', 160, 99, 270, 195, 30, N'1', N'center', N'0', N'0', N'', N'', N'nuselect', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb359e7a1a', N'nuselect', N'zzzzsys_select', N'html', N'nusvg', N'Fields<br>and<br>Relationships', N'nu5bad6cb371e2de7', 80, 42, 116, 704, 173, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'<iframe id=''sqlframe'' src=''core/nuselect.php'' style=''height:180px;width:700px''></iframe>', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35a0a29e', N'nuselect', N'zzzzsys_select', N'input', N'sse_resize', N'Resize', N'nu5bad6cb371e2de7', 30, 15, 700, 118, 20, N'1', N'center', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35a52325', N'nuselect', N'zzzzsys_select', N'select', N'addtable', N'Add Table', N'nu5bad6cb371e2de7', 20, 16, 447, 228, 16, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT table_name as a, table_name as b 
FROM INFORMATION_SCHEMA.TABLES 
WHERE %THIS_DATABASE%
ORDER BY table_name', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'range', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35a8885a', N'nuclause', N'zzzzsys_select_clause', N'input', N'ssc_order', N'Order', N'nu5bad6cb37296979', 50, 154, 122, 45, 20, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35ab1f0a', N'nuclause', N'zzzzsys_select_clause', N'select', N'ssc_type', N'Type', N'nu5bad6cb37296979', 10, 58, 122, 100, 20, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'1|WHERE|
2|GROUP BY|
3|ORDER BY|
4|HAVING
', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35ad7f0a', N'nuclause', N'zzzzsys_select_clause', N'input', N'ssc_clause', N'Clause', N'nu5bad6cb37296979', 30, 122, 122, 189, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'10|WHERE|
20|ORDER BY|
30|GROUP BY|
40|HAVING', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35afa1d0', N'nuclause', N'zzzzsys_select_clause', N'input', N'ssc_field', N'Field', N'nu5bad6cb37296979', 20, 90, 122, 220, 20, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'10|WHERE|
20|ORDER BY|
30|GROUP BY|
40|HAVING', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuFORM.selectFields()', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35b23983', N'nuselect', N'zzzzsys_select', N'subform', N'zzzzsys_select_clause_sf', N'Clauses', N'nu5bad6cb371e2de7', 70, 231, 116, 698, 119, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nuclause', N'ssc_zzzzsys_select_id', N'1', N'1', N'g', N'zzzzsys_select_clause', 0, N'', N'range', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35b51370', N'nuselect', N'zzzzsys_select', N'textarea', N'sse_sql', N'SQL', N'nu5bad6cb371e2de7', 40, 389, 116, 695, 184, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
GO
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35b860e2', N'nuclause', N'zzzzsys_select_clause', N'select', N'ssc_sort', N'Sort', N'nu5bad6cb37296979', 40, 154, 122, 70, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'ASC|ASC|DESC|DESC', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35beaf10', N'nuselect', N'zzzzsys_select', N'textarea', N'sse_json', N'JSON', N'nu5bad6cb371e2de7', 60, 68, 38, 73, 23, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35c4c4ab', N'nuselect', N'zzzzsys_select', N'select', N'sse_edit', N'SQL', N'nu5bad6cb371e2de7', 50, 365, 116, 195, 16, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|From SQL Builder|
1|Edit Manually', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35cce14b', N'nuhome', N'', N'input', N'open_database', N'Database', N'nu5fd750667019155', 200, 43, 53, 195, 30, N'1', N'center', N'0', N'0', N'', N'', N'nusetup', N'', N'b', N'1', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35cf61c0', N'nuform', N'zzzzsys_form', N'input', N'br_sql', N'SQL Builder', N'nu5bad6cb36757b92', 150, 322, 803, 209, 30, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35d26e8f', N'nuobject', N'zzzzsys_object', N'input', N'di_sql', N'SQL Builder', N'nu5bad6cb36974818', 370, 36, 455, 191, 30, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35d48819', N'nuobject', N'zzzzsys_object', N'input', N'se_sql', N'SQL Builder', N'nu5bad6cb369a6ee3', 410, 36, 459, 191, 30, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35d6b273', N'nufastformobjects', N'zzzzsys_object', N'input', N'ff_browse', N'Browse<br>Column', N'nu5bad6cb36f72f8e', 40, 20, 10, 58, 15, N'1', N'left', N'0', N'0', N'', N'', N'nuobject', N'', N'b', N'#ff_id#', N'', N'0', N'0', N'1|Yes', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35d8ed3e', N'nufile', N'zzzzsys_file', N'textarea', N'sfi_json', N'Upload File', N'nu5bad6cb3719774c', 70, 45, 1, 121, 50, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'file', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35dadfc5', N'nufflaunch', N'', N'select', N'fastform_type', N'Form Type', N'nu5bad6cb36f36433', 10, 29, 141, 140, 16, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'browse|Browse|
edit|Edit|browseedit|
Browse and Edit|
launch|Launch|
subform|Subform', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35dd12bb', N'nufflaunch', N'', N'word', N'wrdaddable', N'Addable Objects', N'nu5bad6cb36f36433', 40, 95, 65, 383, 20, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35df580e', N'nuhome', N'', N'run', N'user_home', N'User Home', N'nu5bad6cb367c5125', 20, 43, 53, 194, 30, N'1', N'center', N'0', N'0', N'', N'', N'nuuserhome', N'', N'b', N'-1', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35e1d998', N'nusetup', N'zzzzsys_setup', N'select', N'set_language', N'Admin Language', N'nu5bad6cb36d97acd', 60, 498, 181, 128, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'%LANGUAGES%', N'stz_timezone', N'stz_timezone', N'0', N'', N'nutimezone', N'', N'', N'zzzzsys_timezone', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35ee9e0e', N'nuhome', N'', N'run', N'run_fast_report', N'Fast Report', N'nu5bad6cb36efb50c', 130, 99, 53, 195, 30, N'1', N'center', N'0', N'0', N'', N'', N'nufrlaunch', N'', N'b', N'-1', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35f2188f', N'nufrlaunch', N'', N'lookup', N'table', N'Table Data', N'nu5bad6cb3737e773', 30, 36, 138, 150, 20, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'code', N'description', N'220', N'', N'nubuildtable', N'
if($(''#fieldlist'').val() !== ''''){
   
    var s   = String($(''#fieldlist'').val());
    var ds  = s.replaceAll(''['','''').replaceAll('']'','''').replaceAll(''\\'','''').replaceAll(''"'','''');
    var fl  = ds.split('','');
    var fu  = [];
    
    $(''#orderby'').find(''option'').remove();

    for(var i = 0 ; i < fl.length ; i++){
        
        if(fl[i] != ''KEEP EXACT HEIGHT''){
            
            fu[i]   = ''<tr><td><div style="overflow:hidden;width:285px;text-align:left;padding:2px" onclick="nuAddReportField(this);" class="nuCalculatorButton nu_input">'' + fl[i] + ''</div></td></tr>'';
    
            $(''#orderby'').append(''<option value="'' + fl[i] + ''">'' + fl[i] + ''</option>'');
        
        }
            
    }

    $(''#nufr'').html(''<table>'' + fu.join('''') + ''</table>'');
    
}

$(''#orderby'').val(fl[0]);

', N'', N'zzzzsys_report_data', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35f5d25f', N'nufastreportobjects', N'zzzzsys_debug', N'input', N'width', N'Width', N'nu5bad6cb3734c18f', 30, 339, 295, 70, 20, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'no|No|yes|Yes', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35f8e8f3', N'nufrlaunch', N'', N'html', N'list', N' ', N'nu5bad6cb3737e773', 60, 154, 72, 324, 406, N'1', N'left', N'0', N'1', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'', N'', NULL, N'<div id=''nufr'' style=''overflow-y: scroll;height:250px;width:317px''></div>', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35fafc15', N'nufrlaunch', N'', N'subform', N'fast_report_sf', N' ', N'nu5bad6cb3737e773', 90, 155, 428, 592, 406, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nufastreportobjects', N'deb_message', N'1', N'1', N'g', N'zzzzsys_debug', 89, N'N|$ 1,000.00', N'file', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35fcf854', N'nufrlaunch', N'', N'input', N'fieldlist', N'list', N'nu5bad6cb3737e773', 10, 14, 44, 400, 20, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'code', N'description', N'200', N'', N'nubuildtable', N'', N'', N'zzzzsys_report_data', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'text', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb35ff457a', N'nufrlaunch', N'', N'word', N'wrdaddable', N'Available Fields', N'nu5bad6cb3737e773', 70, 107, 72, 316, 20, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb36018343', N'nufrlaunch', N'', N'word', N'frwrd', N'New Fast Report', N'nu5bad6cb3737e773', 80, 107, 428, 584, 20, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3604269d', N'nufastreportobjects', N'zzzzsys_debug', N'input', N'title', N'Title', N'nu5bad6cb3734c18f', 10, 300, 300, 196, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3608c14b', N'nufastreportobjects', N'zzzzsys_debug', N'input', N'sum', N'Sum', N'nu5bad6cb3734c18f', 30, 339, 295, 50, 18, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'no|No|yes|Yes', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3618939f', N'nufastreportobjects', N'zzzzsys_debug', N'input', N'field', N'Field Name', N'nu5bad6cb3734c18f', 20, 210, 289, 205, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb361c6536', N'nusamplesubformform', N'', N'input', N'todo', N'To Do List', N'nu5bad6cb37405d73', 50, 50, 150, 242, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb362370eb', N'nuhome', N'', N'run', N'system_update', N'Update', N'nu5fd750667019155', 220, 155, 53, 195, 30, N'1', N'center', N'0', N'0', N'', N'', N'nuupdate', N'', N'b', N'-1', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3625fd05', N'nuphp', N'zzzzsys_php', N'html', N'icon', N' ', N'nu5bad6cb36b27343', 90, 4, 369, 40, 40, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'<div></div>', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb36283501', N'nuobject', N'zzzzsys_object', N'html', N'icon', N' ', N'nu5bad6cb369d0088', 430, 206, 55, 40, 36, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'<div></div>', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb362a86e6', N'nuform', N'zzzzsys_form', N'html', N'icon', N' ', N'nu5bad6cb37026348', 260, 12, 224, 40, 36, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'<div></div>', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb362c74c4', N'nutab', N'zzzzsys_tab', N'input', N'syt_help', N'Help', N'nu5bad6cb36c9250f', 30, 52, 100, 625, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb362e7e3f', N'nufrlaunch', N'', N'calc', N'used', N'Used', N'nu5bad6cb3737e773', 40, 588, 922, 70, 20, N'1', N'right', N'1', N'0', N'nuTotal(''fast_report_sf.width'')', N'', N'', N'', N'', N'', N'', N'0', N'0', N'no|No|yes|Yes', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb36308045', N'nufrlaunch', N'', N'calc', N'remaining', N'Remaining', N'nu5bad6cb3737e773', 50, 617, 922, 70, 20, N'1', N'right', N'1', N'0', N'1150 - nuTotal(''fast_report_sf.width'')', N'', N'', N'', N'', N'', N'', N'0', N'0', N'no|No|yes|Yes', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb36334ee9', N'nufrlaunch', N'', N'select', N'orderby', N'Order By', N'nu5bad6cb3737e773', 20, 63, 138, 256, 16, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N' |', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb363bb5b7', N'nuobject', N'zzzzsys_object', N'select', N'sob_html_chart_type', N'Chart Type', N'nu5bad6cb36a71012', 660, 39, 148, 250, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'p|Pie Graph|
l|Line Graph|
b|Bar Graph|
bs|Bar Graph - Stacked|
bh|Bar Graph - Horizontal|
bhs|Bar Graph - Horizontal and Stacked



', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3647b4cb', N'nuobject', N'zzzzsys_object', N'input', N'sob_html_title', N'Title', N'nu5bad6cb36a71012', 680, 97, 148, 250, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb364add63', N'nuobject', N'zzzzsys_object', N'input', N'sob_html_vertical_label', N'Vertical Label', N'nu5bad6cb36a71012', 690, 128, 148, 250, 19, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb36568f2b', N'nuobject', N'zzzzsys_object', N'input', N'sob_html_horizontal_label', N'Horizontal Label', N'nu5bad6cb36a71012', 700, 158, 148, 250, 19, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3658e2e6', N'nuobject', N'zzzzsys_object', N'input', N'sob_html_javascript', N'JavaScript Array', N'nu5bad6cb36a71012', 670, 68, 148, 250, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb366a1df1', N'nuobject', N'zzzzsys_object', N'html', N'google_chart', N' ', N'nu5bad6cb36a71012', 720, 29, 435, 258, 192, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'b', N'[[''Month'', ''Shane'', ''Dave'', ''Adam'', ''Paul'', ''Chris''],[''2004'', 100, 200, 300, 400, 500],[''2005'', 165, 238, 322, 498, 550],[''2006'', 165, 938, 522, 998, 450],[''2007'', 135, 1120, 599, 1268, 288],]', N'1', N'2', N'3', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb366c575f', N'nuobject', N'zzzzsys_object', N'word', N'wordor', N'OR...', N'nu5bad6cb36a71012', 710, 203, 148, 130, 19, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb366e865e', N'nufflaunch', N'', N'input', N'fastform_fk', N'Foreign Key Field Name', N'nu5bad6cb36f36433', 30, 52, 698, 180, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'nuFORM.getTables()', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bad6cb3670b7db', N'nubuildreport', N'zzzzsys_report', N'input', N'open_sql', N'Open', N'nu5bad6cb36804778', 70, 113, 667, 58, 20, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bd10c9148543a6', N'nuaccess', N'zzzzsys_access', N'input', N'sal_description', N'Description', N'nu5bad6cb36ac903f', 30, 124, 115, 326, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5bef30c4f282d05', N'nufile', N'zzzzsys_file', N'html', N'corner', N' ', N'nu5bad6cb3719774c', 50, 546, 520, 14, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'<div></div>', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5dcf3068d69ee0a', N'nuphp', N'zzzzsys_php', N'input', N'sph_hide', N'Hide', N'nu5bad6cb36b27343', 50, 0, 0, 100, 18, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f711b9351ae752', N'nucsvtransfer', N'', N'select', N'csv_transfer', N'Action', N'nu5f711b9343afdbd', 10, 53, 198, 170, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'export|Export to CSV File|import|Import from CSV File', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f711b9352a6c59', N'nucsvtransfer', N'', N'input', N'csv_from', N'_________________________', N'nu5f711b9343afdbd', 20, 119, 198, 300, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'[1,2,3,4]', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f711b9353c3c52', N'nucsvtransfer', N'', N'select', N'csv_delimiter', N'Delimiter', N'nu5f711b9343afdbd', 30, 147, 198, 100, 18, N'1', N'center', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'44|Comma|9|Tab|59|Semicolon', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f711b9354c1105', N'nucsvtransfer', N'', N'input', N'csv_to', N'_________________________', N'nu5f711b9343afdbd', 40, 175, 198, 300, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f712364d1b0afb', N'nuhome', N'', N'run', N'run_csvtransfer', N'CSV Transfer', N'nu5fd750667019155', 230, 43, 270, 195, 30, N'1', N'center', N'0', N'0', N'', N'', N'nucsvtransfer', N'', N'b', N'-1', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9aaac962c91dd', N'nucloner', N'zzzzsys_cloner', N'lookup', N'clo_form_source', N'Form', N'nu5f9aaac95bc52e7', 10, 59, 106, 150, 20, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'sfo_code', N'sfo_description', N'335', N'', N'nuform', N'nuRefreshSelectObject(''clo_tabs'');
nuRefreshSelectObject(''clo_subforms'');
nuRefreshSelectObject(''clo_iframe_forms'');', N'', N'zzzzsys_form', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9aaac963362ca', N'nucloner', N'zzzzsys_cloner', N'lookup', N'clo_form_dest', N'Form', N'nu5f9aaac95bc52e7', 70, 301, 106, 150, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'sfo_code', N'sfo_description', N'250', N'', N'nuform', N'', N'', N'zzzzsys_form', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9aaac963ecc49', N'nucloner', N'zzzzsys_cloner', N'input', N'clo_dump', N'Dump SQL Statements', N'nu5f9aaac95bc52e7', 100, 415, 494, 18, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9aaac9644de7e', N'nucloner', N'zzzzsys_cloner', N'input', N'clo_objects', N'Without Objects', N'nu5f9aaac95bc52e7', 90, 415, 222, 18, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9ab0d78bb5520', N'nucloner', N'zzzzsys_cloner', N'select', N'clo_tabs', N'Tabs', N'nu5f9aaac95bc52e7', 20, 116, 106, 147, 96, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'1', N'0', N'SELECT `zzzzsys_tab_id`, `syt_title` FROM `zzzzsys_tab` 
LEFT JOIN zzzzsys_form on syt_zzzzsys_form_id = zzzzsys_form_id
WHERE zzzzsys_form_id = ''#clo_form_source#''
ORDER BY `syt_order`', N'sfo_code', N'sfo_description', N'250', NULL, N'nutablookup', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9ab47bbbe2540', N'nucloner', N'zzzzsys_cloner', N'html', N'clo_box', N'  ', N'nu5f9aaac95bc52e7', 130, 8, 30, 18, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'<style>

select[multiple]{
    box-sizing: content-box;
    padding: 0 0 0 8px;
}


</style>

<div class="nuContentBox" style=" left: 10px; top: 10px; height: 190px; width: 640px;">
    <div class="title">Source Form</div>    
    <div class="content"></div>
</div>

<div class="nuContentBox" style=" left: 10px; top: 250px; height: 60px; width: 640px;">
    <div class="title">Destination Form</div>    
    <div class="content"></div>
</div>

<div class="nuContentBox" style=" left: 10px; top: 365px; height: 70px; width: 640px;">
    <div class="title">Options</div>
    <div class="content"></div>
</div>
', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9ab63acc9fd0f', N'nucloner', N'zzzzsys_cloner', N'input', N'clo_notes', N'Notes', N'nu5f9aaac95bc52e7', 120, 509, 80, 594, 22, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9ab977463753f', N'nucloner', N'zzzzsys_cloner', N'word', N'clo_form_dest_note', N'Leave blank to create a new form', N'nu5f9aaac95bc52e7', 80, 324, 106, 350, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9ac08ec429699', N'nucloner', N'zzzzsys_cloner', N'word', N'clo_version', N'<small>V. 1.21</small>', N'nu5f9aaac95bc52e7', 150, 19, 628, 47, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'0', N'0', N'', N'sfo_code', N'sfo_description', N'250', NULL, N'nutablookup', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9be5d9ed4f886', N'nucloner', N'zzzzsys_cloner', N'input', N'clo_dummy', N'..', N'nu5f9aaac95bc52e7', 140, -3, 631, 10, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'0', N'0', N'', N'sfo_code', N'sfo_description', N'250', NULL, N'nutablookup', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9d2633027c93e', N'nuhome', N'', N'run', N'run_cloner', N'Cloner', N'nu5fd750667019155', 240, 99, 270, 195, 30, N'0', N'center', N'0', N'0', N'', N'', N'nucloner', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5f9d4ce275c966a', N'nucloner', N'zzzzsys_cloner', N'input', N'clo_new_pks', N'Generate new PKs', N'nu5f9aaac95bc52e7', 110, 445, 494, 18, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fa0ff78688e2c5', N'nucloner', N'zzzzsys_cloner', N'select', N'clo_subforms', N'Subforms', N'nu5f9aaac95bc52e7', 40, 116, 275, 157, 96, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'1', N'0', N'SELECT 
    sob_subform_zzzzsys_form_id, sob_all_id
    FROM zzzzsys_object 
WHERE sob_all_zzzzsys_form_id = ''#clo_form_source#'' AND sob_all_type = ''subform''', N'sfo_code', N'sfo_description', N'250', NULL, N'nutablookup', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fa249be5df47ad', N'nucloner', N'zzzzsys_cloner', N'input', N'clo_subforms_include', N' ', N'nu5f9aaac95bc52e7', 30, 94, 275, 14, 14, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fa2751ed4195b7', N'nucloner', N'zzzzsys_cloner', N'select', N'clo_iframe_forms', N'IFrame forms', N'nu5f9aaac95bc52e7', 60, 118, 454, 157, 96, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'1', N'0', N'SELECT 
    `sob_run_zzzzsys_form_id`, sob_all_id
FROM zzzzsys_object 
WHERE sob_all_zzzzsys_form_id =  ''#clo_form_source#'' AND sob_all_type = ''Run''
AND sob_run_method = ''i'' AND IFNULL(sob_run_zzzzsys_form_id,'''') <> ''''', N'sfo_code', N'sfo_description', N'250', NULL, N'nutablookup', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fa959f97244564', N'nucloner', N'zzzzsys_cloner', N'input', N'clo_iframe_forms_include', N' ', N'nu5f9aaac95bc52e7', 50, 95, 454, 14, 14, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fab2f8952634e4', N'nuformat', N'zzzzsys_format', N'input', N'separator', N'Separator', N'nu5bad6cb36fcbc18', 50, 136, 264, 52, 30, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'['','', ''.'', "''"]', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fab2fa48a504e4', N'nuformat', N'zzzzsys_format', N'input', N'decimal', N'Decimal', N'nu5bad6cb36fcbc18', 60, 136, 413, 52, 30, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'[''.'', '','']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fab2fb6e66f19b', N'nuformat', N'zzzzsys_format', N'input', N'places', N'Places', N'nu5bad6cb36fcbc18', 70, 136, 562, 52, 30, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'browse|Browse|edit|Edit|browseedit|Browse and Edit|criteria|Criteria or Home|procedure|Procedure|report|Report', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'[''0'', ''1'', ''2'', ''3'', ''4'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fab3e0f07cd2d8', N'nuformat', N'zzzzsys_format', N'input', N'srm_currency', N' ', N'nu5bad6cb36fcbc18', 20, 45, 318, 100, 18, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'Number|nuNumber|
Date|nuDate', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fcef1492efb5a5', N'nuuser', N'zzzzsys_user', N'input', N'sus_code', N'Code', N'nu5bad6cb36b63cae', 90, 288, 167, 153, 18, N'1', N'left', N'2', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fcef37de94381d', N'nuuser', N'zzzzsys_user', N'input', N'sus_team', N'Team', N'nu5bad6cb36b63cae', 100, 313, 167, 329, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fcef39d0232810', N'nuuser', N'zzzzsys_user', N'input', N'sus_position', N'Position', N'nu5bad6cb36b63cae', 120, 363, 167, 329, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd29810a6409bc', N'nunotes', N'zzzzsys_note', N'input', N'not_title', N'Title', N'nu5fd29810a60df91', 10, 26, 26, 652, 24, N'1', N'left', N'2', N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd29810a644544', N'nunotes', N'zzzzsys_note', N'input', N'not_updated_on', N'Updated on', N'nu5fd29810a60df91', 50, 29, 1056, 130, 18, N'1', N'left', N'0', N'1', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd29810a646742', N'nunotes', N'zzzzsys_note', N'textarea', N'not_content', N'Content', N'nu5fd29810a60df91', 20, 259, 399, 200, 200, N'1', N'left', N'0', N'2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd29810a654723', N'nunotes', N'zzzzsys_note', N'html', N'not_content_html', N'.', N'nu5fd29810a60df91', 30, 65, 26, 1167, 460, N'1', N'left', N'0', N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, N'<!-- Style -->
<style>

    .ql-editor {
      background-color: white;
}

</style>


<!-- Create the editor container -->

<div id="not_content_container"> </div>', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd3973a43f3930', N'nuhome', N'', N'run', N'run_note', N'Notes', N'nu5bad6cb367c5125', 110, 99, 703, 194, 30, N'1', N'center', N'0', N'0', N'', N'', N'nunotes', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd3a61c5abb1b7', N'nunotes', N'zzzzsys_note', N'lookup', N'not_zzzzsys_note_category_id', N'Category', N'nu5fd29810a60df91', 40, 26, 720, 214, 24, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'noc_name', N'noc_name', N'0', NULL, N'nunotescategroy', N'', NULL, N'zzzzsys_note_category', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd3b22f8c32954', N'nunotescategroy', N'zzzzsys_note_category', N'input', N'noc_name', N'Categroy', N'nu5fd6f697276396f', 10, 30, 102, 150, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd498c9745563b', N'nuuser', N'zzzzsys_user', N'input', N'sus_additional1', N'Additional 1', N'nu5bad6cb36b63cae', 130, 388, 167, 329, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd498d66e837da', N'nuuser', N'zzzzsys_user', N'input', N'sus_additional2', N'Additional 2', N'nu5bad6cb36b63cae', 140, 413, 167, 329, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd6f7819d659bc', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_cloneable_btn_yes', N'✔ Yes', N'nu5bad6cb3686cb0d', 250, 402, 278, 60, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd6f828a1e42b1', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_cloneable_btn_no', N'✖ No', N'nu5bad6cb3686cb0d', 260, 402, 348, 60, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd6fa0428adcd3', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_align_btn_left', N'Left', N'nu5bad6cb3686cb0d', 190, 336, 278, 130, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd6fbe95c2c61d', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_align_btn_right', N'Right', N'nu5bad6cb3686cb0d', 200, 336, 423, 130, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd6fc4a7ccf484', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_align_btn_center', N'Center', N'nu5bad6cb3686cb0d', 210, 336, 569, 130, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd6fdad38e8f5d', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_validate_btn_no_blanks', N'No Blanks', N'nu5bad6cb3686cb0d', 230, 369, 423, 130, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd6fddae953fd3', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_access_btn_hidden', N'Hidden', N'nu5bad6cb3686cb0d', 180, 303, 569, 130, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd6ff14ad0870d', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_access_btn_editable', N'Editable', N'nu5bad6cb3686cb0d', 160, 303, 278, 130, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd6ff6a0ef6017', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_access_btn_readonly', N'Readonly', N'nu5bad6cb3686cb0d', 170, 303, 423, 130, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd757f9266ea99', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_validate_btn_none', N'None', N'nu5bad6cb3686cb0d', 220, 369, 278, 130, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd7583fbdb0750', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_validate_btn_no_duplicates', N'No Duplicates', N'nu5bad6cb3686cb0d', 240, 369, 570, 130, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fd8f88a3539a40', N'nuhome', N'', N'run', N'run_session', N'Sessions', N'nu5fd750667019155', 210, 99, 53, 195, 30, N'1', N'center', N'0', N'0', N'', N'', N'nusession', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb1b5b3b7b123', N'nucodesnippet', N'zzzzsys_code_snippet', N'input', N'cot_code', N'Name', N'nu5fdb1b5b254566f', 10, 38, 166, 355, 20, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb1b5b3c86d2c', N'nucodesnippet', N'zzzzsys_code_snippet', N'textarea', N'cot_source_code', N'Source Code', N'nu5fdb1b5b254566f', 60, 299, 166, 654, 271, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb1b5b3d70508', N'nucodesnippet', N'zzzzsys_code_snippet', N'select', N'cot_language', N'Language', N'nu5fdb1b5b254566f', 40, 174, 166, 110, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'JavaScript|JavaScript|PHP|PHP|SQL|SQL|CSS|CSS|HTML|HTML
', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb1b5b3e7727c', N'nucodesnippet', N'zzzzsys_code_snippet', N'select', N'cot_scope', N'Selectable in', N'nu5fdb1b5b254566f', 50, 211, 166, 195, 69, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'1', N'0', N'0|Forms / Custome Code|1|Setup / Header|2|SQL', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb1b5b41b6fc4', N'nuhome', N'', N'run', N'run_nucodesnippets', N'Code Snippets', N'nu5bad6cb36efb50c', 190, 99, 488, 195, 30, N'0', N'center', N'0', N'0', NULL, NULL, N'nucodesnippet', NULL, N'b', N'', NULL, NULL, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb1f7a0731ba4', N'nucodesnippet', N'zzzzsys_code_snippet', N'textarea', N'cot_description', N'Description', N'nu5fdb1b5b254566f', 20, 77, 166, 654, 40, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
GO
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb21b2b2daac4', N'nucodesnippet', N'zzzzsys_code_snippet', N'input', N'cot_url', N'URL', N'nu5fdb1b5b254566f', 30, 135, 166, 660, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb22ce4a13271', N'nuform', N'zzzzsys_form', N'lookup', N'sfo_code_snippet_lookup', N'Insert-Snippet', N'nu5bad6cb37026348', 270, 22, 950, 2, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'cot_code', N'cot_source_code', N'0', NULL, N'nucodesnippet', N'var c = $(''#sfo_code_snippet_paste'').val();

if (c !== '''') {
   nuInsertTextAtCaret(''sfo_javascript'', c);
   $(''#sfo_code_snippet_lookupcode'').val('''');
}



', NULL, N'zzzzsys_code_snippet', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb25fd26d5e87', N'nuform', N'zzzzsys_form', N'textarea', N'sfo_code_snippet_paste', N' ', N'nu5bad6cb37026348', 250, 2, 710, 40, 40, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb9ff762770', N'nuform', N'zzzzsys_access', N'subform', N'accform', N' ', N'nu5fdb9ff026348', 280, 20, 20, 765, 465, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nu5fdb9ffd45efe', N'slf_zzzzsys_form_id', N'1', N'1', N'g', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb9ffe0330e', N'nu5fdb9ffd45efe', N'', N'select', N'slf_zzzzsys_access_id', N'Access level', N'nu5fdb9ffd6fbca', 10, 20, 250, 315, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_access_id, CONCAT(sal_code,'' : '',sal_description) FROM zzzzsys_access ORDER BY 2', N'sfo_code', N'sfo_description', N'185', N'', N'nunonsystemform', N'', N'', N'zzzzsys_form', N'', N'', N'1', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb9ffe110d9', N'nu5fdb9ffd45efe', N'', N'input', N'slf_add_button', N'<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<span class=''nuActionButton''>Add</span>', N'nu5fdb9ffd6fbca', 20, 46, 79, 53, 15, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'sfo_code', N'sfo_description', N'200', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb9ffe1eb04', N'nu5fdb9ffd45efe', N'', N'input', N'slf_save_button', N'<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=''nuActionButton''>Save</span>', N'nu5fdb9ffd6fbca', 40, 118, 79, 53, 15, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'sfo_code', N'sfo_description', N'200', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb9ffe2bdb4', N'nu5fdb9ffd45efe', N'', N'input', N'slf_delete_button', N'<br>&nbsp;&nbsp;&nbsp;&nbsp;<span class=''nuActionButton''>Delete</span>', N'nu5fdb9ffd6fbca', 60, 94, 79, 53, 15, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'sfo_code', N'sfo_description', N'200', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb9ffe390f2', N'nu5fdb9ffd45efe', N'', N'input', N'slf_clone_button', N'<br>&nbsp;&nbsp;&nbsp;&nbsp;<span class=''nuActionButton''>Clone</span>', N'nu5fdb9ffd6fbca', 50, 70, 79, 53, 15, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'sfo_code', N'sfo_description', N'200', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdb9ffe4b29b', N'nu5fdb9ffd45efe', N'', N'input', N'slf_print_button', N'<br>&nbsp;&nbsp;&nbsp;&nbsp;<span class=''nuActionButton''>Print</span>', N'nu5fdb9ffd6fbca', 30, 22, 79, 53, 15, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'sfo_code', N'sfo_description', N'200', N'', N'nuform', N'', N'', N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdba6246ffc449', N'nusetup', N'zzzzsys_setup', N'input', N'set_denied', N'Access denied', N'nu5bad6cb36d97acd', 70, 556, 181, 20, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'stz_timezone', N'stz_timezone', N'0', NULL, N'nutimezone', N'', NULL, N'zzzzsys_timezone', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbb4226426ddb', N'nusetup', N'zzzzsys_setup', N'lookup', N'set_code_snippet_lookup', N'Insert-Snippet', N'nu5bad6cb36e9143a', 20, 38, 71, 2, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'cot_code', N'cot_source_code', N'0', NULL, N'nucodesnippet', N'
var c = $(''#set_code_snippet_paste'').val();

if (c !== '''') {
   nuInsertTextAtCaret(''set_header'', c);
   $(''#set_code_snippet_lookupcode'').val('''');
}



', NULL, N'zzzzsys_code_snippet', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbb8c159f4b90', N'nusetup', N'zzzzsys_setup', N'textarea', N'set_code_snippet_paste', N' ', N'nu5bad6cb36e9143a', 30, 125, 924, 40, 40, N'1', N'left', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbcb7f8f7e8a4', N'nucodesnippet', N'zzzzsys_code_snippet', N'input', N'cot_updated_on', N'Updated on', N'nu5fdb1b5b254566f', 70, 38, 698, 128, 20, N'1', N'left', N'0', N'1', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d14019', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'select', N'sob_all_type', N'Type', N'nu5fdb9ffd6faaa', 40, 60, 83, 100, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'calc|Calc|
display|Display|
html|HTML|
image|Image|
input|Input|
lookup|Lookup|
run|Run|
select|Select|
subform|Subform|
textarea|Textarea|
word|Word', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d140ab', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'select', N'sob_all_zzzzsys_tab_id', N'Tab', N'nu5fdb9ffd6faaa', 10, 86, 83, 140, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_tab_id,syt_title FROM zzzzsys_tab WHERE 
syt_zzzzsys_form_id in (''#record_id#'')', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d14189', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'input', N'sob_all_id', N'ID', N'nu5fdb9ffd6faaa', 30, 113, 83, 250, 20, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'nuScroll', N'nuFORM.tableSchema[$("#sob_all_table").val()]?nuFORM.tableSchema[$("#sob_all_table").val()].names:[]', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d142ab', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'input', N'sob_all_label', N'Label', N'nu5fdb9ffd6faaa', 50, 86, 83, 200, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d144e1', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'input', N'sob_all_top', N'Top', N'nu5fdb9ffd6faaa', 70, 142, 83, 50, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d145fd', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'input', N'sob_all_left', N'Left', N'nu5fdb9ffd6faaa', 80, 169, 83, 50, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d1470e', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'input', N'sob_all_width', N'Width', N'nu5fdb9ffd6faaa', 90, 142, 200, 50, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d14825', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'input', N'sob_all_height', N'Height', N'nu5fdb9ffd6faaa', 100, 169, 200, 50, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'number', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d1496d', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'select', N'sob_all_cloneable', N'Cloneable', N'nu5fdb9ffd6faaa', 110, 142, 344, 66, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d14a7a', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'select', N'sob_all_align', N'Align', N'nu5fdb9ffd6faaa', 120, 169, 344, 66, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'left|Left|right|Right|center|Center', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d14b7c', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'select', N'sob_all_validate', N'Validation', N'nu5fdb9ffd6faaa', 130, 142, 504, 105, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|None|1|No Blanks|2|No Duplicates', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd25d14ca4', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'select', N'sob_all_access', N'Access', N'nu5fdb9ffd6faaa', 140, 169, 504, 80, 18, N'1', N'right', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|Editable|1|Readonly|2|Hidden', N'syt_title', N'sfo_description', N'200', N'0', N'nutab', N'', N'', N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd8ae17c40b9', N'nuobject', N'zzzzsys_object', N'lookup', N'sob_code_snippet_display_lookup', N'Insert-Snippet', N'nu5bad6cb36974818', 340, 79, 613, 5, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'cot_code', N'cot_source_code', N'0', NULL, N'nucodesnippet', N'
var c = $(''#sob_code_snippet_paste'').val();

if (c !== '''') {
   nuInsertTextAtCaret(''sob_display_sql'', c);
   $(''#sob_code_snippet_display_lookupcode'').val('''');
}


', NULL, N'zzzzsys_code_snippet', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbd8ea4333ed2', N'nuobject', N'zzzzsys_object', N'textarea', N'sob_code_snippet_paste', N' ', N'nu5bad6cb36974818', 350, 69, 643, 5, 18, N'1', N'right', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'', N'', N'0', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbdaee571fbb3', N'nuobject', N'zzzzsys_object', N'lookup', N'sob_code_snippet_select_lookup', N'Insert-Snippet', N'nu5bad6cb369a6ee3', 420, 81, 610, 5, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'cot_code', N'cot_source_code', N'0', NULL, N'nucodesnippet', N'
var c = $(''#sob_code_snippet_paste'').val();

if (c !== '''') {
   nuInsertTextAtCaret(''sob_select_sql'', c);
   $(''#sob_code_snippet_select_lookupcode'').val('''');
}


', NULL, N'zzzzsys_code_snippet', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdbe049f365a', N'nu5fdb9ffd45aaa', N'zzzzsys_object', N'input', N'btnOpenDetails', N'<i class="fa fa-ellipsis-v" aria-hidden="true"></i>', N'nu5fdb9ffd6faaa', 150, 247, 146, 45, 22, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdcde23d2db265', N'nuform', N'zzzzsys_form', N'input', N'width_setter', N'°°', N'nu5fdb9ff026461', 280, 32, 1320, 30, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'browse|Browse|
edit|Edit|browseedit|
Browse and Edit|
launch|Launch|
subform|Subform', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdcef9a8e8c47c', N'nuform', N'zzzzsys_form', N'lookup', N'sfo_code_snippet_sql_lookup', N'Insert-Snippet', N'nu5bad6cb36757b92', 160, 327, 108, 2, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'cot_code', N'cot_source_code', N'0', NULL, N'nucodesnippet', N'var c = $(''#sfo_code_snippet_paste'').val();

if (c !== '''') {
   nuInsertTextAtCaret(''sfo_browse_sql'', c);
   $(''#sfo_code_snippet_sql_lookupcode'').val('''');
}



', NULL, N'zzzzsys_code_snippet', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fddb0a817e8bc2', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_id_datatype', N'Datatype', N'nu5bad6cb3686cb0d', 70, 128, 122, 157, 20, N'1', N'left', N'0', N'1', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fde5c8f1e64a86', N'nuselect', N'zzzzsys_select', N'lookup', N'sse_code_snippet_lookup', N'Insert-Snippet', N'nu5bad6cb371e2de7', 90, 363, 777, 5, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'cot_code', N'cot_source_code', N'0', NULL, N'nucodesnippet', N'
var c = $(''#sse_code_snippet_paste'').val();

if (c !== '''') {
   nuInsertTextAtCaret(''sse_sql'', c);
   $(''#sse_code_snippet_lookupcode'').val('''');
}


', NULL, N'zzzzsys_code_snippet', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fde5d5ad6f69ec', N'nuselect', N'zzzzsys_select', N'textarea', N'sse_code_snippet_paste', N' ', N'nu5bad6cb371e2de7', 100, 103, 660, 5, 18, N'1', N'right', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'', N'', N'0', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fdfbfcaeea14a6', N'nuuser', N'zzzzsys_user', N'input', N'sus_expires_on', N'Expires On', N'nu5bad6cb36b63cae', 150, 460, 167, 84, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'D|yyyy-mm-dd', N'nuDate', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe034cd38a5270', N'nuuser', N'zzzzsys_user', N'input', N'sus_department', N'Department', N'nu5bad6cb36b63cae', 110, 338, 167, 329, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe038d847fbb70', N'nuuser', N'zzzzsys_user', N'input', N'sus_password_show_btn', N'Show', N'nu5bad6cb36b63cae', 60, 183, 389, 15, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe0547b82db3de', N'nuauthentication', N'', N'input', N'auth_code', N'Code', N'nu5fe0547b76e25d6', 10, 80, 144, 150, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe0547b841fb32', N'nuauthentication', N'', N'input', N'auth_verify_btn', N'Verify', N'nu5fe0547b76e25d6', 20, 130, 176, 117, 23, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe19f9d396cc05', N'nusetup', N'zzzzsys_setup', N'display', N'set_db_version', N'DB', N'nu5fe19e93306dd6e', 200, 76, 110, 149, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'SELECT inf_details FROM zzzzsys_info WHERE inf_code = ''nuDBVersion''', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe19fb39693948', N'nusetup', N'zzzzsys_setup', N'display', N'set_files_version', N'Files', N'nu5fe19e93306dd6e', 270, 109, 110, 149, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'SELECT inf_details FROM zzzzsys_info WHERE inf_code = ''nuFilesVersion''', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe1a0f0c355360', N'nusetup', N'zzzzsys_setup', N'display', N'set_db_version_user', N'DB Version', N'nu5bad6cb36d97acd', 80, 65, 182, 128, 18, N'1', N'left', N'0', N'1', N'', N'', N'', N'', N'', N'', N'SELECT inf_details FROM zzzzsys_info WHERE inf_code = ''nuDBVersion''', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe1a1310d52cd7', N'nusetup', N'zzzzsys_setup', N'display', N'set_files_version_user', N'Files Version', N'nu5bad6cb36d97acd', 90, 93, 181, 128, 18, N'1', N'left', N'0', N'1', N'', N'', N'', N'', N'', N'', N'SELECT inf_details FROM zzzzsys_info WHERE inf_code = ''nuFilesVersion''', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe1aeac3363ae7', N'nusetup', N'zzzzsys_setup', N'input', N'set_db_version_inc_btn', N'<i class="fa fa-plus" aria-hidden="true"></i>', N'nu5fe19e93306dd6e', 250, 74, 278, 30, 21, N'1', N'center', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe1af2e2b4455a', N'nusetup', N'zzzzsys_setup', N'input', N'set_db_version_inc', N'DB New', N'nu5fe19e93306dd6e', 230, 76, 410, 149, 18, N'1', N'left', N'0', N'1', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe1b155aed9e46', N'nusetup', N'zzzzsys_setup', N'input', N'set_files_version_inc_btn', N'<i class="fa fa-plus" aria-hidden="true"></i>', N'nu5fe19e93306dd6e', 260, 109, 278, 30, 21, N'1', N'center', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe1b199e2c233e', N'nusetup', N'zzzzsys_setup', N'input', N'set_files_version_inc', N'Files New', N'nu5fe19e93306dd6e', 240, 109, 410, 149, 18, N'1', N'left', N'0', N'1', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe1bb063e6bc77', N'nusetup', N'zzzzsys_setup', N'word', N'set_versions_increase_word', N'Increase Versions:', N'nu5fe19e93306dd6e', 220, 30, 110, 149, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe1bbb6cc15263', N'nusetup', N'zzzzsys_setup', N'input', N'set_dev_reset_tables', N'Reset Tables', N'nu5fe19e93306dd6e', 280, 213, 151, 20, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe2be48bf89e9e', N'nuaccessforms', N'zzzzsys_access_form', N'select', N'slf_data_mode', N'Data Mode', N'nu5bad6cb36b994d2', 70, 196, 88, 100, 15, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No Edits', N'sfo_code', N'sfo_description', N'200', NULL, N'nuform', N'', NULL, N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe94c6815842ec', N'nuphp', N'zzzzsys_php', N'lookup', N'sph_code_snippet_select_lookup', N'Insert-Snippet', N'nu5bad6cb36b27343', 110, 140, 881, 5, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'cot_code', N'cot_source_code', N'0', NULL, N'nucodesnippet', N'
var c = $(''#sph_code_snippet_paste'').val();

if (c !== '''') {
   nuInsertTextAtCaret(''sob_select_sql'', c);
   $(''#sph_code_snippet_select_lookupcode'').val('''');
}


', NULL, N'zzzzsys_code_snippet', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fe94c931478ff2', N'nuphp', N'zzzzsys_php', N'textarea', N'sph_code_snippet_paste', N' ', N'nu5bad6cb36b27343', 100, 100, 643, 5, 18, N'1', N'right', N'0', N'2', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'', N'', N'0', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5feb70700c7bfc2', N'nuupdate', N'', N'html', N'upd_html', N' ', N'nu5feb70e6a6b9cf8', 10, 0, 10, 1000, 800, N'1', N'center', N'0', N'0', N'', N'', N'nunotes', N'', N'b', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'<iframe id="updateiframe" src="update.htm?id=#SESSION_ID#" width="1200" height="800"</iframe>
', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5feb9ff762770', N'nubuildreport', N'zzzzsys_access', N'subform', N'accrept', N' ', N'nu5fdf7fc6680a0b2', 90, 34, 56, 460, 552, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nu5feb9ffd45efe', N'sre_zzzzsys_report_id', N'1', N'1', N'g', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5feb9ffe0330e', N'nu5feb9ffd45efe', N'', N'select', N'sre_zzzzsys_access_id', N'Access levels that can use this report', N'nu5feb9ffd6fbca', 10, 300, 250, 400, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_access_id, CONCAT(sal_code,'' : '',sal_description) FROM zzzzsys_access ORDER BY 2', N'sfo_code', N'sfo_description', N'185', N'', N'nunonsystemform', N'', N'', N'zzzzsys_form', N'', N'', N'1', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fed7cde6f84b9e', N'nuobjectgrid', N'zzzzsys_object', N'subform', N'objform', N' ', N'nu5fed7cde6151088', 10, 17, 24, 1362, 624, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nu5fdb9ffd45aaa', N'sob_all_zzzzsys_form_id', N'1', N'1', N'g', N'zzzzsys_object', 89, N'N|$ 1,000.00', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fed812c36293e7', N'nuobjectgrid', N'zzzzsys_object', N'input', N'sfo_description', N'Description', N'nu5fed7cde6151088', 20, 0, 0, 40, 20, N'1', N'right', N'0', N'2', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'nu5fdb9ffd45aaa', N'sob_all_zzzzsys_form_id', N'1', N'1', N'g', N'zzzzsys_object', 89, N'N|$ 1,000.00', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fed8c73e475b16', N'nuform', N'zzzzsys_form', N'input', N'run_sfo_objects', N'Objects', N'nu5bad6cb36791fd5', 70, 32, 856, 155, 30, N'1', N'center', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'browse|Browse|
edit|Edit|browseedit|
Browse and Edit|
launch|Launch|
subform|Subform', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5feda5bd4324ece', N'nuobjectgrid', N'zzzzsys_object', N'input', N'sfo_code', N'Code', N'nu5fed7cde6151088', 30, 20, 0, 40, 20, N'1', N'right', N'0', N'2', N'', N'', N'', N'', N'', N'', N'SELECT COUNT(*) FROM zzzzsys_debug', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'nu5fdb9ffd45aaa', N'sob_all_zzzzsys_form_id', N'1', N'1', N'g', N'zzzzsys_object', 89, N'N|$ 1,000.00', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5feded627aebfed', N'nuobjectgrid', N'zzzzsys_object', N'select', N'sfo_tabs_filter', N' ', N'nu5fed7cde6151088', 40, 5, 109, 132, 20, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_tab_id, syt_title FROM zzzzsys_tab
JOIN zzzzsys_form ON zzzzsys_form_id = syt_zzzzsys_form_id
WHERE zzzzsys_form_id = ''#record_id#''
ORDER BY syt_order', N'', N'', N'', NULL, N'', N'', NULL, N'', N'nu5fdb9ffd45aaa', N'sob_all_zzzzsys_form_id', N'1', N'1', N'g', N'zzzzsys_object', 89, N'N|$ 1,000.00', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fee9ff762770', N'nuphp', N'zzzzsys_access', N'subform', N'accphp', N' ', N'nu5fdf7df2d873dd1', 120, 58, 56, 370, 500, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'nu5fee9ffd45efe', N'slp_zzzzsys_php_id', N'1', N'1', N'g', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5fee9ffe0330e', N'nu5fee9ffd45efe', N'', N'select', N'slp_zzzzsys_access_id', N'Access levels that can use this procedure', N'nu5fee9ffd6fbca', 10, 300, 250, 300, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_access_id, CONCAT(sal_code, '' : '', sal_description) FROM zzzzsys_access ORDER BY 2', N'sfo_code', N'sfo_description', N'185', N'', N'nunonsystemform', N'', N'', N'zzzzsys_form', N'', N'', N'1', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff0352f501ba8c', N'nuobject', N'zzzzsys_object', N'input', N'sob_calc_formula_edit_mode_checkbox', N'Edit manually', N'nu5bad6cb36f99a7e', 770, 15, 630, 20, 18, N'1', N'right', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT 
   CONCAT(LEFT(srm_type, 1), ''|'', TRIM(srm_format)) AS a, 
   srm_format AS b 
FROM zzzzsys_format
WHERE srm_type = ''Number''', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff2c03acc8a591', N'nuphp', N'zzzzsys_php', N'input', N'sph_global', N'Global Access', N'nu5fdf7df2d873dd1', 130, 25, 402, 24, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff32fdadb8f46f', N'nuobject', N'zzzzsys_object', N'input', N'sob_lookup_zzzzsys_form_open_button', N'<i class="fa fa-external-link" aria-hidden="true"></i>', N'nu5bad6cb369d0088', 510, 33, 657, 40, 20, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'', N'', N'', NULL, N'nublank', N'', NULL, N'', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff48b9c35a7beb', N'nuemailtest', N'', N'input', N'set_smtp_from_address', N'From Address', N'nu5ff48b9c18dbf6f', 10, 49, 148, 300, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff48b9c3634db8', N'nuemailtest', N'', N'input', N'set_smtp_from_name', N'From Name', N'nu5ff48b9c18dbf6f', 20, 76, 148, 300, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff48b9c3731e32', N'nuemailtest', N'', N'textarea', N'ema_body', N'Body', N'nu5ff48b9c18dbf6f', 70, 229, 148, 300, 100, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'N|$ 1,000.00', N'nuScroll', N'[''North'',''South'',''East'',''West'']', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff48b9c37be944', N'nuemailtest', N'', N'input', N'ema_to', N'To', N'nu5ff48b9c18dbf6f', 30, 110, 148, 300, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff48b9c3846ee2', N'nuemailtest', N'', N'input', N'ema_cc', N'CC', N'nu5ff48b9c18dbf6f', 40, 137, 148, 300, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff48b9c38e471a', N'nuemailtest', N'', N'input', N'ema_bcc', N'BCC', N'nu5ff48b9c18dbf6f', 50, 164, 148, 300, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff4a82b76d96d6', N'nusetup', N'zzzzsys_setup', N'input', N'set_nuemailtest_button', N'Test Email', N'nu5bad6cb36e31edf', 190, 390, 167, 180, 39, N'1', N'center', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff4b1040dfffd1', N'nuemailtest', N'', N'input', N'ema_subject', N'Subject', N'nu5ff48b9c18dbf6f', 60, 201, 148, 300, 20, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff4b56934a1973', N'nuemailtest', N'', N'input', N'ema_save_data', N'<i class="fa fa-floppy-o" aria-hidden="true"></i>', N'nu5ff48b9c18dbf6f', 80, 353, 323, 50, 20, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff4b5f53f85f69', N'nuemailtest', N'', N'input', N'ema_load_data', N'<i class="fa fa-arrow-circle-o-up" aria-hidden="true"></i>', N'nu5ff48b9c18dbf6f', 90, 353, 398, 50, 20, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff5afe5716ed04', N'nusetup', N'zzzzsys_setup', N'select', N'set_smtp_use_ssl', N'Use SSL', N'nu5bad6cb36e31edf', 180, 328, 167, 59, 18, N'1', N'left', N'1', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff5b7b1b918a4b', N'nuobject', N'zzzzsys_object', N'input', N'sob_run_zzzzsys_form_open_button', N'<i class="fa fa-external-link" aria-hidden="true"></i>', N'nu5bad6cb368d9c40', 330, 34, 644, 40, 20, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'', N'', N'', NULL, N'nublank', N'', NULL, N'', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ff727ad6f17b85', N'nuuser', N'zzzzsys_user', N'input', N'sus_zzzzsys_access_id_open_button', N'<i class="fa fa-external-link" aria-hidden="true">', N'nu5bad6cb36b63cae', 160, 72, 646, 40, 20, N'1', N'center', N'2', N'0', N'', N'', N'', N'', N'', N'', N'', N'', N'0', N'', N'', N'', N'', NULL, N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu5ffab1ab3b16807', N'nu5fdb9ffd45efe', N'', N'select', N'slf_data_mode', N'Data Mode', N'nu5fdb9ffd6fbca', 70, 196, 88, 100, 15, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No Edits', N'sfo_code', N'sfo_description', N'200', NULL, N'nuform', N'', NULL, N'zzzzsys_form', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu60013e0626d80ce', N'nuobject', N'zzzzsys_object', N'input', N'sob_subform_zzzzsys_form_open_button', N'<i class="fa fa-external-link" aria-hidden="true"></i>', N'nu5bad6cb36a1c024', 580, 38, 679, 40, 20, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'', N'', N'', NULL, N'nublank', N'', NULL, N'', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu60028804f043b86', N'nuobject', N'zzzzsys_object', N'input', N'sob_all_type_open_button', N'<i class="fa fa-external-link" aria-hidden="true"></i>', N'nu5bad6cb3686cb0d', 280, 54, 235, 40, 20, N'1', N'center', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'SELECT zzzzsys_form_id, CONCAT(sfo_code, '' - '', sfo_description)
FROM zzzzsys_form
ORDER BY sfo_code', N'', N'', N'', NULL, N'nublank', N'', NULL, N'', N'nuform', N'', N'1', N'', N'', N'', 0, N'', N'button', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu6004139ce814db8', N'nusetup', N'zzzzsys_setup', N'select', N'set_languages_included', N'Included Languages', N'nu5bad6cb36d97acd', 50, 180, 181, 128, 300, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'1', N'0', N'%LANGUAGES%', N'stz_timezone', N'stz_timezone', N'0', NULL, N'nutimezone', N'', NULL, N'zzzzsys_timezone', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu6006ecf9d0b4ceb', N'nuobject', N'zzzzsys_object', N'input', N'sob_select_2', N'Select2', N'nu5bad6cb369a6ee3', 400, 76, 94, 15, 18, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'checkbox', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[zzzzsys_object] ([zzzzsys_object_id], [sob_all_zzzzsys_form_id], [sob_all_table], [sob_all_type], [sob_all_id], [sob_all_label], [sob_all_zzzzsys_tab_id], [sob_all_order], [sob_all_top], [sob_all_left], [sob_all_width], [sob_all_height], [sob_all_cloneable], [sob_all_align], [sob_all_validate], [sob_all_access], [sob_calc_formula], [sob_calc_format], [sob_run_zzzzsys_form_id], [sob_run_filter], [sob_run_method], [sob_run_id], [sob_display_sql], [sob_select_multiple], [sob_select_2], [sob_select_sql], [sob_lookup_code], [sob_lookup_description], [sob_lookup_description_width], [sob_lookup_autocomplete], [sob_lookup_zzzzsys_form_id], [sob_lookup_javascript], [sob_lookup_php], [sob_lookup_table], [sob_subform_zzzzsys_form_id], [sob_subform_foreign_key], [sob_subform_add], [sob_subform_delete], [sob_subform_type], [sob_subform_table], [sob_input_count], [sob_input_format], [sob_input_type], [sob_input_javascript], [sob_input_datalist], [sob_html_code], [sob_html_chart_type], [sob_html_javascript], [sob_html_title], [sob_html_vertical_label], [sob_html_horizontal_label], [sob_image_zzzzsys_file_id]) VALUES (N'nu60085a561599dfd', N'nuobject', N'zzzzsys_object', N'textarea', N'sob_input_datalist', N'Datalist', N'nu5bad6cb36a4af06', 640, 98, 240, 436, 60, N'1', N'left', N'0', N'0', N'', N'', N'', N'', N'', N'', N'', N'0', N'0', N'0|No|1|Yes', N'syt_title', N'sfo_description', N'200', NULL, N'nutab', N'', NULL, N'zzzzsys_tab', N'', N'', N'', N'', N'', N'', 0, N'', N'text', N'', NULL, N'', N'', N'', N'', N'', N'', N'')
GO
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5bad6cb329dcb6e_AB', N'nu5bad6cb329dcb6e_AB', N'System PHP', N'nubuilder', N'$s  = "
        SELECT * 
        FROM zzzzsys_tab 
        JOIN zzzzsys_form ON zzzzsys_form_id = syt_zzzzsys_form_id
        WHERE zzzzsys_tab_id = ''#LOOKUP_RECORD_ID#''
        
        ";

$t  = nuRunQuery($s);
$c = db_num_rows($t);
if ($c == 1) {$r  = db_fetch_object($t); }

nuSetFormValue(''sob_all_zzzzsys_form_id'', $c == 1 ? $r->syt_zzzzsys_form_id: '''');
nuSetFormValue(''sob_all_table'', $c == 1 ? $r->sfo_table: '''');', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5bad6cb32c9102c_AB', N'nu5bad6cb32c9102c_AB', N'System PHP', N'nubuilder', N'$s  = "
        SELECT * 
        FROM zzzzsys_form
        WHERE zzzzsys_form_id = ''#LOOKUP_RECORD_ID#''
        
        ";

$t  = nuRunQuery($s);
$c = db_num_rows($t);
if ($c == 1) {$r  = db_fetch_object($t); }


nuSetFormValue(''sob_subform_table'', $c == 1 ? $r->sfo_table: '''');', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5bad6cb32dcbcb4_AB', N'nu5bad6cb32dcbcb4_AB', N'System PHP', N'nubuilder', N'
$s  = "
        SELECT * 
        FROM zzzzsys_form
        WHERE zzzzsys_form_id = ''#LOOKUP_RECORD_ID#''
        
        ";

$t  = nuRunQuery($s);
$r  = db_fetch_object($t);

nuSetFormValue(''sob_lookup_table'', $r->sfo_table);
', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5bad6cb33715015_AB', N'57452c417370475_AB', N'', N'nubuilder', N'nuSetFormValue(''slf_add_button'', ''1'');
nuSetFormValue(''slf_print_button'', ''1'');
nuSetFormValue(''slf_save_button'', ''1'');
nuSetFormValue(''slf_clone_button'', ''1'');
nuSetFormValue(''slf_delete_button'', ''1'');
', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5bad6cb35f2188f_AB', N'nu5bad6cb35f2188f_AB', N'System PHP', N'nubuilder', N'$r = nuLookupRecord();

if (isset($r->id)) {
    $tt	= nuTTList($r->id, ''nublank'');				    //-- Field list from Temp table
    
    nuSetFormValue(''fieldlist'', json_encode($tt));
}
', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5f6fe8bd7ff850a', N'CSVTRANSFER', N'CSV Transfer', N'nubuilder', N'if($_SESSION[''nubuilder_session_data''][''IsDemo'']){		
    nuDisplayError(nuTranslate(''Not available in the Demo'')."..");
    return;	
}


if(''#csv_transfer#'' == ''export''){
    nuToCSV(''#csv_from#'', ''#csv_to#'', ''#csv_delimiter#'');
}

if(''#csv_transfer#'' == ''import''){
    nuFromCSV(''#csv_from#'', ''#csv_to#'', ''#csv_delimiter#'');
}', N'window', N'nublank', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5fdb22ce4a13271_AB', N'nu5fdb22ce4a13271_AB', N'System PHP', N'nubuilder', N'nuSetFormValue(''sfo_code_snippet_paste'', nuLookupRecord()->cot_source_code);', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5fdbb4226426ddb_AB', N'nu5fdbb4226426ddb_AB', N'System PHP', N'nubuilder', N'nuSetFormValue(''set_code_snippet_paste'', nuLookupRecord()->cot_source_code);', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5fdbd8ae17c40b9_AB', N'nu5fdbd8ae17c40b9_AB', N'System PHP', N'nubuilder', N'nuSetFormValue(''sob_code_snippet_paste'', nuLookupRecord()->cot_source_code);', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5fdbdaee571fbb3_AB', N'nu5fdbdaee571fbb3_AB', N'System PHP', N'nubuilder', N'nuSetFormValue(''sob_code_snippet_paste'', nuLookupRecord()->cot_source_code);', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5fdcef9a8e8c47c_AB', N'nu5fdcef9a8e8c47c_AB', N'System PHP', N'nubuilder', N'nuSetFormValue(''sfo_code_snippet_paste'', nuLookupRecord()->cot_source_code);', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5fde5c8f1e64a86_AB', N'nu5fde5c8f1e64a86_AB', N'System PHP', N'nubuilder', N'nuSetFormValue(''sse_code_snippet_paste'', nuLookupRecord()->cot_source_code);', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5fdefa3f19faf1e', N'nugetrecord', N'Edit Record Navigator: Get Next/Previous Primary Key', N'nubuilder', N'$eri = json_decode(base64_decode(''#NU_EDIT_RECORD_INFO#''));
$pk = $eri->primary_key;
$action = $eri->_action;

$goto_pk = "";
$cr = "";

if ($action == ''next'' || $action == ''back'') {
    $t = nuRunQuery($eri->browse_sql);

    while ($r = db_fetch_object($t)) {

        if ($eri->record_id == $r->$pk) {
            if ($action == "next") {
                $r = db_fetch_object($t);
                $goto_pk = $r->$pk;
                break;
            }
            else {
                $goto_pk = $cr;
                break;
            }
        }

        $cr = $r->$pk;
    }
}

$j = " onOpenRecord(''$goto_pk'',''$action''); ";

nuJavascriptCallback($j);', N'hide', NULL, N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5fe07d3154346f7', N'nuAuthentication2FA_Template', N'2FA Authentication Send and Verify', N'nubuilder', N'function nuGetEmail() {
    $u = nuUser();
    if ($u == "" ) return  "admin@something.com"; // admin email
    return $u->sus_email;   // user email
} 

function nuSendCodeByEmail($code) {
    $content = ''Your Code: ''.$code;
    $subject = ''nuBuilder Authentication'';
    $fromName = ''nubuilder'';
    $sendTo = nuGetEmail();
    nuEmailPHP($sendTo, $fromAddress, $fromName, $content, $subject);
}

$command = ! isset($nuauthcommand) ? "#nuauthcommand#" : $nuauthcommand;
if ($command == ''send'') {
    
    // Generate a code (7 characters)
    $code = nuGenerateCode(7);
    
    // Store the code in the session
    nuSet2FACode($code);
    
    // Send the code by email
    // nuSendCodeByEmail($code);
    
    // For testing purposes:
    nuOutputCodeToConsole($code);
} 


if ($command == ''verify'') {
    if (nuGet2FACode() == "#auth_code_verify#") {
        nuSetVerified();
        nuRedirectToForm();
    } else {
        nuShowAuthenticationError();
    }
		
}
', N'hide', NULL, N'0', N'1', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5fe94c6815842ec_AB', N'nu5fe94c6815842ec_AB', N'System PHP', N'nubuilder', N'nuSetFormValue(''sph_code_snippet_paste'', nuLookupRecord()->cot_source_code);', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5fee06b1acbe4bb', N'nubackup', N'Create a Database Backup', N'nubuilder', N'if($_SESSION[''nubuilder_session_data''][''IS_DEMO'']){

	nuDisplayError(''Not available in the Demo...'');
	return;

}
	
// *******************************************************************

// Settings. Please modify if different.

//Use nuBuilder DB settings. Path to nuconfig.php
$path_nuconfig_php = __DIR__ . ''/../nuconfig.php'';

// Path to Mysqldump.php
$path_mysqldump_php = __DIR__ . ''/libs/mysqldump/Mysqldump.php'';

// Directory to write the sql dump to
$path_sql_dump = __DIR__ . ''/libs/Mysqldump/dumps/'';

// Save dump to file:
$file_name =  date(''m-d-Y_H:i:s'') . ''_'' . ''nuBuilder_backup'' . ''.sql.gzip'';

// *******************************************************************

try {
    require_once ($path_mysqldump_php);
} catch (Exception $e) {
    nuDisplayError(''require_once failed! Error: ''.$e);
}

try {
    require $path_nuconfig_php;
} catch (Exception $e) {
    nuDisplayError(''require failed! Error: ''.$e);
}

// Dump Settings
$dumpSettings = array();
$dumpSettings[''single-transaction''] = false;
$dumpSettings[''no-create-info''] = false;
$dumpSettings[''lock-tables''] = false;
$dumpSettings[''add-locks''] = false;
$dumpSettings[''extended-insert''] = false;
$dumpSettings[''skip-definer''] = true;
$dumpSettings[''compress''] = Ifsnop\Mysqldump\Mysqldump::GZIP;

// Create Mysqldump
$dumper = new Ifsnop\Mysqldump\Mysqldump("mysql:host=$nuConfigDBHost;dbname=$nuConfigDBName", $nuConfigDBUser, $nuConfigDBPassword, $dumpSettings);

$dump_file = $path_sql_dump . sanitizeFilename($file_name);

// Start the dump
try {
    
    if (!is_dir($path_sql_dump))
    {
        mkdir($path_sql_dump, 0755);
    }
    
    $dumper->start($dump_file);
}
catch(\Exception $e) {
    nuDisplayError(''Export Error: '' . $e->getMessage());
}

$dump_file = base64_encode($path_sql_dump . $file_name);

$js = "
   nuMessage([''<h2>Export completed!</h2><br>SQL Dump saved in '' + atob(''$dump_file'')]);
";

nuJavascriptCallback($js);

function sanitizeFilename($file) {
    $file = mb_ereg_replace("([^\w\s\d\-_~,;\[\]\(\).])", '''', $file);
    return mb_ereg_replace("([\.]{2,})", '''', $file);
}', N'hide', NULL, N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5ff7efb1ed369a6', N'nurefreshselectobject', N'Refresh a select object', N'nubuilder', N'function nuGetSelectValues($formId, $selectId) {

    $sql = "
        SELECT
            sob_select_sql
        FROM
            `zzzzsys_object`
        WHERE
            sob_all_zzzzsys_form_id = ? AND sob_all_id = ?
    ";


    $t = nuRunQuery($sql, array($formId, $selectId));

    $a = array();
    if (db_num_rows($t) == 1) {

        $r = db_fetch_row($t);
        if ($r != false) {
            $disS = nuReplaceHashVariables($r[0]);
            $t = nuRunQuery($disS);

            while ($row = db_fetch_row($t)) {
                $a[] = $row;
            }

            return json_encode($a);
        }

    }


    return $a;

}

function nuPopulateSelectObject($formId, $selectId) {

    $j = nuGetSelectValues($formId, $selectId);

    return "
    	function nuPopulateSelectObject() {
    	
    		var p = $j;
    
    		$(''#$selectId'').empty();
    		// $(''#$selectId'').append(''<option value=\"\"></option>'');
            
            var count = 0;
    
    		if (p != '''') {
    		    var s = nuIsSaved();
    			
    			for (var i = 0; i < p.length; i++) {
    				$(''#$selectId'').append(''<option value=\"'' + p[i][0] + ''\">'' + p[i][1] + ''</option>'');
    				count ++;
    			}
    			
    			if (s) { nuHasNotBeenEdited(); }
    			
    		}
    		
    		return count;
    	}
    	
    	var count = nuPopulateSelectObject();
    	
    	if (window.nuSelectObjectRefreshed) {
    	    nuSelectObjectRefreshed(''$formId'', ''$selectId'', count);
    	}
    ";

}


function nuRefreshSelectObject($selectId, $formId) {

        if (hashCookieNotSetOrEmpty($formId)) {
            $formId = ''#form_id#'';
        }

        $js = nuPopulateSelectObject($formId, $selectId);
        nuJavascriptCallback($js);
        return true;
    

    return false;

}

nuRefreshSelectObject(''#nurefreshselectobject_selectid#'', ''#nurefreshselectobject_formid#'');



', N'hide', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nu5ff8249659aef00', N'nurefreshdisplayobject', N'Refresh a display object', N'nubuilder', N'function nuGetDisplayValue($formId, $obj) {

    $sql = "SELECT sob_display_sql FROM `zzzzsys_object` WHERE sob_all_zzzzsys_form_id = ? AND sob_all_id = ?";
    $t = nuRunQuery($sql, array($formId, $obj));

    if (db_num_rows($t) == 1) {
        $r = db_fetch_row($t);
        if ($r != false) {

            $disS = nuReplaceHashVariables($r[0]);
            $disT = nuRunQuery($disS);
            $disR = db_fetch_row($disT);

            return ($disR != false) ? $disR[0] : false;
        }
    }

    return false;
}

$obj = ''#nurefreshdisplayobject_displayid#'';
$formId = ''#nurefreshdisplayobject_formid#'';

if (hashCookieNotSetOrEmpty($formId)) {
    $formId = ''#form_id#'';
}
        
$value = nuGetDisplayValue($formId, $obj);
if ($value == false) {
    $j = "nuMessage([nuTranslate(''Failed to refresh the Display Object: '') + ''$obj'']); ";
} else {
    $j = "$(''#$obj'').val(''$value'').change();";
}

nuJavascriptCallback($j);', N'hide', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuauthentication_BE', N'nuauthentication_BE', N'System PHP', N'nubuilder', N'$nuauthcommand = "send";

$devMode = nuReplaceHashVariables("#nuDevMode#");

$t = $devMode == ''1'' ? ''_Template'' : '''';

$p  = nuProcedure(''nuAuthentication2FA''.$t);	

if($p != '''') { 
    eval($p); 
} else {
    nuDisplayError(nuTranslate(''The Procedure nuAuthentication2FA does not exist.''));    
}





', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nucalcobjects_BB', N'nucalcobjects_BB', N'System PHP', N'nubuilder', N'
$s = "

CREATE TABLE #TABLE_ID#

SELECT 
   sob_all_zzzzsys_form_id AS theform,
   '''' AS theparent,
   sob_all_id AS thechild,
   CONCAT(sob_all_id) as thevalue
FROM zzzzsys_object 
WHERE sob_input_type = ''number''
OR sob_all_type = ''calc''

UNION 

SELECT 
   su.sob_all_zzzzsys_form_id AS theform,
   su.sob_all_id AS theparent,
   inp.sob_all_id AS thechild,
   CONCAT(su.sob_all_id, ''.'', inp.sob_all_id) as thevalue
FROM zzzzsys_object AS su
JOIN zzzzsys_object AS inp ON su.sob_subform_zzzzsys_form_id = inp.sob_all_zzzzsys_form_id
WHERE su.sob_all_type = ''subform''
AND (
        inp.sob_input_type = ''nuNumber'' OR 
        inp.sob_input_type = ''number'' OR 
        inp.sob_all_type = ''calc''
    )

";
    
nuRunQuery($s);

', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nucloner_BB', N'nucloner_BB', N'System PHP', N'nubuilder', N'
if (nuMSSQL()) {
     nuDisplayError(''Not implemented yet!'');
}', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuclonerphp', N'nucloner', N'Clone Forms, Objects, Events, PHP etc.', N'nubuilder', N'function hashCookieSet($h) {
    return !(preg_match(''/\#(.*)\#/'', $h) || trim($h) == "");
}

function pkWithoutEvent($pk) {
    return substr($pk, 0, -3);
}

function eventFromPk($pk) {
    return substr($pk, -3);
}

function lookupPk($arr, $key) {
    
    $a = array_column($arr, $key);
    return isset($a[0]) ? $a [0] : '''';

}

function addToArray(array & $arr, $key, $value) {
    array_push($arr, array(
        $key => $value
    ));
}

function getPk($pk) {
    return "#cloner_new_pks#" != ''0'' ? nuID() : $pk;
}

function getTabList() {

    $t = "#cloner_tabs#";
    return !hashCookieSet($t) || strlen($t) < 3 ? "" : implode('','', json_decode($t));

}

function getSubformList() {

    $t = "#cloner_subforms#";
    return !hashCookieSet($t) || strlen($t) < 3 ? "" : "''".implode("'',''", json_decode($t))."''";

}

function getIframeFormList() {

    $t = "#cloner_iframe_forms#";
    return !hashCookieSet($t) || strlen($t) < 3 ? "" : "''".implode("'',''", json_decode($t))."''";

}

function getFormSource(&$f1) {

    $f1 = "#cloner_form_source#";
    if (!hashCookieSet($f1)) {
        $f1 = "#form_id#";
        return true;
    }

    return formExists($f1);

}

function dbQuote($s) {

    global $nuDB;
    return $nuDB->quote($s);

}

function getFormDestination(&$f2) {

    $f2 = "#cloner_form_desc#";
    if (!hashCookieSet($f2)) {
        $f2 = "";
        return true;
    }

    return formExists($f2);

}

function formSQL() {
    return "SELECT * FROM zzzzsys_form WHERE zzzzsys_form_id  = ? LIMIT 1";
}

function formExists($f) {

    $t = nuRunQuery(formSQL(), array($f));
    return db_num_rows($t) == 1;

}

function echoPlainText($val) {

    echo ''<pre>'';
    echo htmlspecialchars($val);
    echo ''</pre>'';

}

function dumpFormInfo($f, $dump) {

    if ($dump != ''1'') return;

    $fi = getFormInfo($f);
    echo "<b>";
    echo "-- nuBuilder cloner SQL Dump " . "<br>";
    echo "-- Version 1.21 " . "<br>";
    echo "-- Generation Time: " . date("F d, Y h:i:s A") . "<br><br>";
    echo "-- Form Description: " . $fi["description"] . "<br>";
    echo "-- Form Code: " . $fi["code"] . "<br>";
    echo "-- Form Table: " . $fi["table"] . "<br>";
    echo "-- Form Type: " . $fi["type"] . "<br><br>";

    $notes = "#cloner_notes#";
    echo hashCookieSet($notes) ? "-- Notes: " . $notes . "<br>" . "<br>" : "";
    echo "</b>";

}

function createInsertStatement($table, $columns, $row) {

    $params = array_map(function ($val) {
        return "?";
    }
    , $row);

    return "INSERT INTO $table (" . implode('', '', $columns) . ") VALUES ( " . implode(" , ", $params) . " ) ";

}

function echoHeader($header) {

    echo "<br>--<br>";
    echo "-- <b>" . $header . "</b><br>";
    echo "--<br><br>";
    
}

function dumpInsertStatement($table, $row, &$first, $ident) {

    $values = join('', '', array_map(function ($value) {
        return $value === null ? ''NULL'' : dbQuote($value);
    }
    , $row));

    if (!isset($first)) {
        $ident = $ident == '''' ? '''' : '': ''. $ident;
        echoHeader($table. $ident);
        $first = false;
    }

    echoPlainText("INSERT INTO $table (" . implode('', '', array_keys($row)) . ") ");
    echoPlainText("VALUES ( " . $values . " ); ");

}

function insertRecord($table, $row, &$first, $ident) {

    if ("#cloner_dump#" == ''1'') {
         dumpInsertStatement($table, $row, $first, $ident);
    }
    else {
        $i = createInsertStatement($table, array_keys($row) , $row);
        nuRunQuery($i, array_values($row) , true);
    }

}

function getFormType($f) {

    $t = nuRunQuery(formSQL() , array($f));
    $row = db_fetch_array($t);

    return $row[''sfo_type''];

}

function getFormInfo($f) {

    $t = nuRunQuery(formSQL() , array($f));
    $row = db_fetch_object($t);

    return array(
        "code" => $row->sfo_code,
        "description" => $row->sfo_description,
        "type" => $row->sfo_type,
        "table" => $row->sfo_table
    );

}

function getNewFormCode($code) {

    $s = "SELECT COUNT(zzzzsys_form_id) + 1 FROM zzzzsys_form WHERE sfo_code LIKE ?";
    $t = nuRunQuery($s, array($code . ''_clone%''));
    $r = db_fetch_row($t);
    return $code . ''_clone_'' . $r[0];

}

function cloneForm($f1) {

    $t = nuRunQuery(formSQL() , array($f1));
    $row = db_fetch_array($t);

    $newPk = getPk($row[''zzzzsys_form_id'']);
    $row[''zzzzsys_form_id''] = $newPk;
    $row[''sfo_code''] = getNewFormCode($row[''sfo_code'']);

    insertRecord(''zzzzsys_form'', $row, $first, $row[''sfo_code'']);

    return $newPk;

}

function cloneFormPHP($f1, $f2) {

    $s = "
        SELECT
            zzzzsys_php.*
        FROM
            zzzzsys_php
        LEFT JOIN zzzzsys_form ON zzzzsys_form_id = LEFT(zzzzsys_php_id, LENGTH(zzzzsys_php_id) - 3)
        WHERE
            zzzzsys_form_id = ?
	";

    $t = nuRunQuery($s, array($f1));

    while ($row = db_fetch_array($t)) {

        $event = eventFromPk($row[''zzzzsys_php_id'']);
        $row[''zzzzsys_php_id''] = $f2 . $event;
        $row[''sph_code''] = $f2 . $event;

        insertRecord(''zzzzsys_php'', $row, $first, '''');

    }

}

function cloneFormTabs($f1, $f2) {

    $tabPks = array();
    
    $s = "SELECT * FROM zzzzsys_tab AS tab1 WHERE syt_zzzzsys_form_id  = ?".whereTabs();
    $t = nuRunQuery($s, array($f1));

    while ($row = db_fetch_array($t)) {

        $newPk = getPk($row[''zzzzsys_tab_id'']);
        addToArray($tabPks, $row[''zzzzsys_tab_id''], $newPk);
        $row[''zzzzsys_tab_id''] = $newPk;
        $row[''syt_zzzzsys_form_id''] = $f2;

        insertRecord(''zzzzsys_tab'', $row, $first, '''');

    }

    return $tabPks;

}

function cloneFormBrowse($f1, $f2) {

    $s = "SELECT * FROM zzzzsys_browse WHERE sbr_zzzzsys_form_id  = ?";
    $t = nuRunQuery($s, array($f1));

    while ($row = db_fetch_array($t)) {

        $newPk = getPk($row[''zzzzsys_browse_id'']);
        $row[''zzzzsys_browse_id''] = $newPk;
        $row[''sbr_zzzzsys_form_id''] = $f2;

        insertRecord(''zzzzsys_browse'', $row, $first, '''');

    }

}

function whereTabs() {
    
    $tabs = getTabList();
    
    return $tabs != '''' ? " AND tab1.syt_order DIV 10 IN ($tabs) " : "";
    
}


function getTabIds($f1, $f2) {

    $s = "    
        SELECT
            tab1.zzzzsys_tab_id AS tab1,
            tab2.zzzzsys_tab_id AS tab2
        FROM
            zzzzsys_tab AS tab1
        LEFT JOIN zzzzsys_tab AS tab2
        ON
            tab1.syt_order = tab2.syt_order
        WHERE
            tab1.syt_zzzzsys_form_id = ? AND tab2.syt_zzzzsys_form_id = ? 
    ".whereTabs();

    $t = nuRunQuery($s, array($f1, $f2));

    $tabPks = array();
    while ($r = db_fetch_object($t)) {
        addToArray($tabPks, $r->tab1, $r->tab2);
    }

    return $tabPks;

}

function cloneObjects($f1, $f2, array & $objectPks, $tabPks) {

    $s = "SELECT * FROM zzzzsys_object WHERE sob_all_zzzzsys_form_id = ?";
    $t = nuRunQuery($s, array($f1));
    
    while ($row = db_fetch_array($t)) {

        $row[''sob_all_zzzzsys_form_id''] = $f2;
        
        $newPk = getPk($row[''zzzzsys_object_id'']);
        addToArray($objectPks, $row[''zzzzsys_object_id''], $newPk);

        $row[''zzzzsys_object_id''] = $newPk;

        $tabId = lookupPk($tabPks, $row[''sob_all_zzzzsys_tab_id'']);
        
        
        nuDebug("xxx");
        
        $row[''sob_all_zzzzsys_tab_id''] = $tabId;

        if ($tabId != "") insertRecord(''zzzzsys_object'', $row, $first,'''');

    }

}

function cloneObjectsPHP($f1, $objectPks) {

    $s = "
        SELECT
           zzzzsys_php.* 
        FROM
           zzzzsys_php 
           LEFT JOIN
              zzzzsys_object 
              ON zzzzsys_object_id = LEFT(zzzzsys_php_id, LENGTH(zzzzsys_php_id) - 3) 
        WHERE
           sob_all_zzzzsys_form_id = ?
	";

    $t = nuRunQuery($s, array($f1));

    while ($row = db_fetch_array($t)) {

        $event = eventFromPk($row[''zzzzsys_php_id'']);
        $row[''zzzzsys_php_id''] = lookupPk($objectPks, pkWithoutEvent($row[''zzzzsys_php_id''])) . $event;
        $code = lookupPk($objectPks, pkWithoutEvent($row[''sph_code'']));
        if ($code == '''') { $row[''sph_code''] = $row[''zzzzsys_php_id'']; }
        $code .=  $event;

        insertRecord(''zzzzsys_php'', $row, $first, '''');

    }

}

function cloneFormSelect($f1, $f2, array & $formSelectPks) {

    $s = "
        SELECT
           zzzzsys_select.* 
        FROM
           zzzzsys_select 
        WHERE LEFT(zzzzsys_select_id, LENGTH(zzzzsys_select_id) - 3)  = ?
	";

    $t = nuRunQuery($s, array($f1));

    while ($row = db_fetch_array($t)) {

        $event = eventFromPk($row[''zzzzsys_select_id'']);
        $newPk = $f2 . $event;
        addToArray($formSelectPks, $row[''zzzzsys_select_id''], $newPk);
        $row[''zzzzsys_select_id''] = $newPk;

        insertRecord(''zzzzsys_select'', $row, $first, '''');

    }

}

function cloneFormSelectClause($f1, $formSelectPks) {

    $s = "
        SELECT
           zzzzsys_select_clause.* 
        FROM
           zzzzsys_select_clause 
           LEFT JOIN
              zzzzsys_select 
              ON zzzzsys_select_id = ssc_zzzzsys_select_id 
           LEFT JOIN zzzzsys_form ON LEFT(zzzzsys_select_id, LENGTH(zzzzsys_select_id) - 3) = zzzzsys_form_id
           WHERE zzzzsys_form_id  = ? 
	";

    $t = nuRunQuery($s, array($f1));

    while ($row = db_fetch_array($t)) {

        $row[''ssc_zzzzsys_select_id''] = lookupPk($formSelectPks, $row[''ssc_zzzzsys_select_id'']);
        $row[''zzzzsys_select_clause_id''] = getPk($row[''zzzzsys_select_clause_id'']);
        if ($row[''ssc_zzzzsys_select_id''] != "") insertRecord(''zzzzsys_select_clause'', $row, $first, '''');

    }

}

function cloneObjectsSelect($f1, $objectPks, array & $selectPks) {

    $s = "
        SELECT
           zzzzsys_select.* 
        FROM
           zzzzsys_select 
           LEFT JOIN
              zzzzsys_object 
              ON zzzzsys_object_id = LEFT(zzzzsys_select_id, LENGTH(zzzzsys_select_id) - 3) 
        WHERE
           sob_all_zzzzsys_form_id = ?
	";

    $t = nuRunQuery($s, array($f1));

    while ($row = db_fetch_array($t)) {

        $event = eventFromPk($row[''zzzzsys_select_id'']);
        $newPk = lookupPk($objectPks, pkWithoutEvent($row[''zzzzsys_select_id''])) . $event;
        addToArray($selectPks, $row[''zzzzsys_select_id''], $newPk);
        $row[''zzzzsys_select_id''] = $newPk;

        insertRecord(''zzzzsys_select'', $row, $first, '''');

    }

}

function cloneObjectsSelectClause($f1, $selectPks) {

    $s = "
        SELECT
           zzzzsys_select_clause.* 
        FROM
           zzzzsys_select_clause 
           LEFT JOIN
              zzzzsys_select 
              ON zzzzsys_select_id = ssc_zzzzsys_select_id 
           LEFT JOIN
              zzzzsys_object 
              ON zzzzsys_object_id = LEFT(zzzzsys_select_id, LENGTH(zzzzsys_select_id) - 3) 
        WHERE
           sob_all_zzzzsys_form_id = ?
	";

    $t = nuRunQuery($s, array($f1));

    while ($row = db_fetch_array($t)) {

        $row[''ssc_zzzzsys_select_id''] = lookupPk($selectPks, $row[''ssc_zzzzsys_select_id'']);
        $row[''zzzzsys_select_clause_id''] = getPk($row[''zzzzsys_select_clause_id'']);

        if ($row[''ssc_zzzzsys_select_id''] != "") insertRecord(''zzzzsys_select_clause'', $row, $first, '''');

    }

}

function cloneObjectsEvents($f1, $objectPks) {

    $s = "
        SELECT
            *
        FROM
            zzzzsys_event
        WHERE
            sev_zzzzsys_object_id IN (
            SELECT
                zzzzsys_object_id
            FROM
                zzzzsys_object
            WHERE
                sob_all_zzzzsys_form_id = ?
        )
    ";
    $t = nuRunQuery($s, array($f1));

    while ($row = db_fetch_array($t)) {

        $row[''zzzzsys_event_id''] = getPk($row[''zzzzsys_event_id'']);
        $row[''sev_zzzzsys_object_id''] = lookupPk($objectPks, $row[''sev_zzzzsys_object_id'']);

        insertRecord(''zzzzsys_event'', $row, $first, '''');

    }

}

function getOpenForm($f2) {

    $ft = getFormType($f2);
    $r = $ft == ''browseedit'' ? "" : "-1";

    $code = getFormInfo($f2) ["code"];

    $msg = "
	   var buttons = '' <button onclick=\"$(\''#nuMessageDiv\'').remove();nuForm(\''$f2\'', \''$r\'', \''\'', \''\'', \''2\'');\" class=\"nuActionButton\">Open Form</button>'';
	   nuMessage([''<h2>Cloning complete.</h2><h3>Code: $code</h3>'' + buttons]);
	   console.log(''Cloning complete. Form Code: $code'');
   ";

    return $msg;
    
}

function clearHashCookies() {

    return;
    "
        function clearHashCookies() {
            nuSetProperty(''cloner_form_source'','''');
            nuSetProperty(''cloner_form_dest'','''');
            nuSetProperty(''cloner_tabs'','''');
            nuSetProperty(''cloner_objects'', ''1'');
            nuSetProperty(''cloner_subforms'', ''0'');
            nuSetProperty(''cloner_iframe_forms'', ''0'');
            nuSetProperty(''cloner_dump'',''0'');
            nuSetProperty(''cloner_new_pks'',''1'');
        }
        
        clearHashCookies();
    ";

}

function showError($msg) {
    
    nuJavascriptCallback("nuMessage([''<h2>Error</h2><br>" . $msg . "'']);" . clearHashCookies());
    
}

function showForm($f2, $dump) {

    if ($dump == ''1'') return;
    nuJavascriptCallback(getOpenForm($f2) . clearHashCookies());

}

function whereSubforms() {
    
    $subforms = getSubformList();
    return $subforms != '''' ? " AND sob_all_id IN ($subforms) " : "";
    
}

function whereRunIframeforms() {
    
    $forms = getIframeFormList();
    return $forms != '''' ? " AND sob_all_id IN ($forms) " : "";
    
}

function updateObjectSubform($f1, $f2, $dump) {

   $s = "UPDATE zzzzsys_object SET sob_subform_zzzzsys_form_id = ''$f2'' WHERE sob_subform_zzzzsys_form_id = ''$f1'';";
   
   if ($dump == "1") {
       echoHeader(''zzzzsys_object: UPDATE subform ID'');
       echoPlainText($s);
   } else {
        $t = nuRunQuery($s);
   }
    
}

function updateIframeForm($f1, $f2, $dump) {

   $s = "UPDATE zzzzsys_object SET sob_run_zzzzsys_form_id = ''$f2'' WHERE sob_run_zzzzsys_form_id = ''$f1'';";
   
   if ($dump == "1") {
       echoHeader(''zzzzsys_object: UPDATE Run iframe form'');
       echoPlainText($s);
   } else {
        $t = nuRunQuery($s);
   }
    
}


function processIframeForms($f1, $tabPks, $dump) {

    if ("#cloner_iframe_forms#" == ''0'') return;

    $s = "
        SELECT
            `sob_run_zzzzsys_form_id`
        FROM
            zzzzsys_object
        WHERE
            sob_all_zzzzsys_form_id = ? AND 
            sob_all_type = ? AND 
            sob_run_method = ? AND 
            IFNULL(sob_run_zzzzsys_form_id, '''') <> ''''
        ";
        
    $s .= whereRunIframeforms();
     
    $t = nuRunQuery($s, array($f1,''Run'',''i''));

    while ($row = db_fetch_array($t)) {
            
           $f1 = $row[''sob_run_zzzzsys_form_id''];
           
           processForm($f1, $f2, $tabPks);
           updateIframeForm($row[''sob_run_zzzzsys_form_id''], $f2, $dump);
           processObjects($f1, $f2, $tabPks);
           
           $f2 = "";

    }

}

function processSubforms($f1, $tabPks, $dump) {

    if ("#cloner_subforms#" == ''0'') return;

    $s = "
         SELECT 
            sob_subform_zzzzsys_form_id 
         FROM zzzzsys_object 
         WHERE sob_all_zzzzsys_form_id = ? AND sob_all_type = ?
        ".whereSubforms();

    $t = nuRunQuery($s, array($f1,''subform''));
    while ($row = db_fetch_array($t)) {
            
           $f1 = $row[''sob_subform_zzzzsys_form_id''];

           processForm($f1, $f2, $tabPks);
           updateObjectSubform($row[''sob_subform_zzzzsys_form_id''], $f2, $dump);
           processObjects($f1, $f2, $tabPks);
           
           $f2 = "";

    }

}

function processForm($f1, &$f2, &$tabPks) {

    if ($f2 != "") return;

    $formSelectPks = array();

    $f2 = cloneForm($f1);
    $tabPks = cloneFormTabs($f1, $f2);

    cloneFormSelect($f1, $f2, $formSelectPks);
    cloneFormSelectClause($f1, $formSelectPks);
    cloneFormBrowse($f1, $f2);
    cloneFormPHP($f1, $f2);

}

function processObjects($f1, $f2, &$tabPks) {

    if ("#cloner_objects#" == ''0'') return;

    $objectPks = array();
    $selectPks = array();
    
    cloneObjects($f1, $f2, $objectPks, $tabPks);
    cloneObjectsPHP($f1, $objectPks);
    cloneObjectsSelect($f1, $objectPks, $selectPks);
    cloneObjectsSelectClause($f1, $selectPks);
    cloneObjectsEvents($f1, $objectPks);

}

function startCloner() {

    $dump = "#cloner_dump#";

	if($_SESSION[''nubuilder_session_data''][''IS_DEMO''] && $dump != ''1''){

		showError(''Not available in the Demo...'');
		return;

	}
	
    $newPks = "#cloner_new_pks#";
    if ($newPks == ''0'' && $dump != ''1'') {
        showError(''Primary keys can only be retained in dump mode.'');
        return;
    }

    if (getFormSource($f1) == false) {
        showError(''The form $f1 (cloner_form_source) does not exist!'');
        return;
    }

    if (getFormDestination($f2) == false) {
        showError(''The form $f2 (cloner_form_desc) does not exist!'');
        return;
    }



    dumpFormInfo($f1, $dump);
    processForm($f1, $f2, $tabPks);
    processObjects($f1, $f2, $tabPks);
    processSubforms($f1, $tabPks, $dump);
    processIframeForms($f1, $tabPks, $dump);
    
    showForm($f2, $dump);

}

startCloner();	    
', N'hide', NULL, N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nucsvtransfer_BE', N'nucsvtransfer_BE', N'System PHP', N'nubuilder', N'
function getCSVFiles() {

    $f = array();
    $dir = ''../temp/'';
    $dh = opendir($dir);
    while (false !== ($fileName = readdir($dh))) {
        $ext = substr($fileName, strrpos($fileName, ''.'') + 1);
        if (in_array($ext, array(
            "txt",
            "csv",
            "tab",
            "asc"
        ))) $f[] = $fileName;
    }
    closedir($dh);
    return $f;
}

if (''csvfiles'') {
    $f = getCSVFiles();
}
else {
    $f = array();

}

$a = array();

for ($i = 0;$i < count($f);$i++) {

    if ($f[$i][0] != ''.'') {
        $a[] = "''" . $f[$i] . "''";
    }
}

nuAddJavascript("\n var nuCSVfiles = [" . implode('','', $a) . "];\n");

', NULL, NULL, N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nudebug_BD', N'nudebug_BD', N'System PHP', N'nubuilder', N'
$i  = ''#instruction#'';

if($i == ''all''){
    nuRunQuery("DELETE FROM zzzzsys_debug");
    
}

', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nufastform', N'RUNFF', N'Run Fast Form', N'nubuilder', N'nuBuildFastForm(''#fastform_table#'', ''#fastform_type#'');

', N'', N'nufflaunch', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nufastreport', N'RUNFR', N'Run Fast Report', N'nubuilder', N'nuBuildFastReport();

', N'', N'nufflaunch', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuform_AD', N'nuform_AD', N'System PHP', N'nubuilder', N'nuDeleteForm(''#RECORD_ID#'');', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuform_AS', N'nuform_AS', N'System PHP', N'nubuilder', N'$s  = "
    SELECT * 
    FROM zzzzsys_browse 
    WHERE sbr_zzzzsys_form_id = ''#RECORD_ID#''
    ORDER BY sbr_order;
";


$t = nuRunQuery($s);
$o = 10;

while($r = db_fetch_object($t)){
        
    $s  = "
        UPDATE zzzzsys_browse 
        SET sbr_order = ''$o''
        WHERE zzzzsys_browse_id = ''$r->zzzzsys_browse_id''
        ORDER BY sbr_order;
    ";
    
    nuRunQuery($s);
    
    $o = $o + 10;    
    
}

$s  = "
    SELECT * 
    FROM zzzzsys_tab 
    WHERE syt_zzzzsys_form_id = ''#RECORD_ID#''
    ORDER BY syt_order;
";

$t = nuRunQuery($s);
$o = 10;

while($r = db_fetch_object($t)){
        
    $s  = "
        UPDATE zzzzsys_tab 
        SET syt_order = ''$o''
        WHERE zzzzsys_tab_id = ''$r->zzzzsys_tab_id''
        ORDER BY syt_order;
    ";
    
    nuRunQuery($s);
    
    $o = $o + 10;    
    
}

nuCloneForm();', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuform_BB', N'nuform_BB', N'System PHP', N'nubuilder', N'$w  = "1=1";
if ( $GLOBALS[''nuSetup'']->set_denied == 1 )  { 
    $w  = "zzzzsys_form_id NOT LIKE ''nu%'' OR zzzzsys_form_id = ''nuuserhome''"; 
}

$s  = nuCreateTableFromSelectSQL("#TABLE_ID#", "SELECT zzzzsys_form_id AS theid FROM zzzzsys_form WHERE ".$w);
nuRunQuery($s);
', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuform_BS', N'nuform_BS', N'System PHP', N'nubuilder', N'
    $o = ''#sfo_type#'';

    if(''#sfo_type#''             == ''''){nuDisplayError(''<b>Type</b> Cannot Be Blank..'', ''sfo_type'');}
    if(''#sfo_code#''             == ''''){nuDisplayError(''<b>Code</b> Cannot Be Blank..'', ''sfo_code'');}
    if(''#sfo_description#''      == ''''){nuDisplayError(''<b>Description</b> Cannot Be Blank..'', ''sfo_description'');}


    
    
    if($o == ''browseedit'' || $o == ''subform'' || $o == ''browse''){
        
        if($o != ''browse''){
            nuCheckTabs();
        }
        
        if($o != ''subform''){
            nuCheckBrowse();
        }
        
        if(''#sfo_browse_sql#''   == ''''){nuDisplayError(''<b>Browse SQL</b> Cannot Be Blank..'', ''sfo_browse_sql'');}
    }

    if($o == ''edit'' or $o == ''launch''){
        nuCheckTabs();
    }

    if($o != ''launch''){
        if(''#sfo_table#''            == ''''){nuDisplayError(''<b>Table Name</b> Cannot Be Blank..'', ''sfo_table'');}
        if(''#sfo_primary_key#''      == ''''){nuDisplayError(''<b>Primary Key</b> Cannot Be Blank..'', ''sfo_primary_key'');}
    }

function nuCheckBrowse(){

    $r  = 0;
    $sf = nuSubformObject(''zzzzsys_browse_sf'');
    
    for($i = 0 ; $i < count($sf->rows) ; $i++){
       if($sf->deleted[$i] == 0){$r++;}
    }
    
    if($r == 0){
       nuDisplayError(''<b>Must have at least 1</b> Browse Column Defined..'');
    }
    
}

function nuCheckTabs(){

    $r  = 0;
    $sf = nuSubformObject(''zzzzsys_tab_sf'');
    
    for($i = 0 ; $i < count($sf->rows) ; $i++){
       if($sf->deleted[$i] == 0){$r++;}
    }
    
    if($r == 0){
       nuDisplayError(''<b>Must have at least 1</b> Tab Column Defined..'');
    }
    
}




', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuobject_BB', N'nuobject_BB', N'System PHP', N'nubuilder', N'$w  = "1=1";
if ( $GLOBALS[''nuSetup'']->set_denied == 1 )  { 
    $w  = "sob_all_zzzzsys_form_id NOT LIKE ''nu%'' OR sob_all_zzzzsys_form_id = ''nuuserhome''"; 
}

$s  = nuCreateTableFromSelectSQL("#TABLE_ID#", "SELECT zzzzsys_object_id AS theid FROM zzzzsys_object WHERE ".$w);
nuRunQuery($s);', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuobject_BE', N'nuobject_BE', N'System PHP', N'nubuilder', N'
$s = "



SELECT 
	sob_all_zzzzsys_form_id AS theform,
	sob_all_id AS ids,
	sob_all_type AS type
FROM zzzzsys_object 
WHERE 
sob_all_zzzzsys_form_id = ''#sob_all_zzzzsys_form_id#'' AND 
	((sob_input_type = ''nuNumber'' AND sob_all_type = ''input'')
	OR (sob_input_type = ''number'' AND sob_all_type = ''input'')
	OR sob_all_type = ''calc'' OR sob_all_type = ''select'')

UNION 

SELECT 
   su.sob_all_zzzzsys_form_id AS theform,
   CONCAT(su.sob_all_id, ''.'', inp.sob_all_id) AS ids,
   inp.sob_all_type AS type
FROM zzzzsys_object AS su
JOIN zzzzsys_object AS inp ON su.sob_subform_zzzzsys_form_id = inp.sob_all_zzzzsys_form_id
WHERE 
su.sob_all_type = ''subform'' AND 
su.sob_all_zzzzsys_form_id = ''#sob_all_zzzzsys_form_id#'' AND 
	((inp.sob_input_type = ''nuNumber'' AND inp.sob_all_type = ''input'')
	OR (inp.sob_input_type = ''number'' AND inp.sob_all_type = ''input'')
	OR inp.sob_all_type = ''calc'' OR inp.sob_all_type = ''select'')

";


$t  = nuRunQuery($s);
$a  = array();

while($r = db_fetch_object($t)){
    $a[]  = $r;    
}

$j  = json_encode($a);
$js = "

function nuCalcObjects(){
    return $j;
}

";

nuAddJavascript($js);

', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuobject_BS', N'nuobject_BS', N'System PHP', N'nubuilder', N'$r = ''#RECORD_ID#'';
$f = ''#sob_all_zzzzsys_form_id#'';
$o = ''#sob_all_id#'';

$s = "
    
        SELECT COUNT(*) 
        FROM zzzzsys_object
        WHERE sob_all_zzzzsys_form_id = ''$f''
        AND sob_all_id = ''$o''
        AND zzzzsys_object_id != ''$r''

    ";

$t = nuRunQuery($s);
$r = db_fetch_row($t);

if ($r[0] > 0) {
    nuDisplayError(nuTranslate(''This <b>ID</b> is already used on this Form..''));
}

if (''#sob_all_label#'' == '''') {
    nuDisplayErrorNotBlank(''Label'');
}

$o = ''#sob_all_type#'';

if ($o == ''display'') {
    if (''#sob_display_sql#'' == '''') {
        nuDisplayErrorNotBlank(''Display'');
    }
}

if ($o == ''html'') {

    if (''#sob_html_code#'' == '''' && ''#sob_html_chart_type#'' == '''') {
        nuDisplayError(nuTranslate(''HTML Fields Cannot Both Be Blank..''));
    }
    if (''#sob_html_javascript#'' == '''' && ''#sob_html_chart_type#'' != '''') {
        nuDisplayErrorNotBlank(''HTML Javascript Array'');
    }

}

if ($o == ''lookup'') {
    if (''#sob_lookup_zzzzsys_form_id#'' == '''') {
        nuDisplayErrorNotBlank(''Form'');
    }
    if (''#sob_lookup_code#'' == '''') {
        nuDisplayErrorNotBlank(''Code'');
    }
    if (''#sob_lookup_description#'' == '''') {
        nuDisplayErrorNotBlank(''Descrition'');
    }
    if (''#sob_lookup_description_width#'' == '''') {
        nuDisplayErrorNotBlank(''Width'');
    }
}

if ($o == ''run'') {
    if (''#sob_run_zzzzsys_form_id#'' == '''') {
        nuDisplayErrorNotBlank(''Run'');
    }
    if (''#sob_run_method#'' == '''') {
        nuDisplayErrorNotBlank(''Method'');
    }
}

if ($o == ''input'') {

    if (''#sob_input_type#'' == '''') {
        nuDisplayErrorNotBlank("Input''s Input Type");
    }

    if (''#sob_input_type#'' == ''nuNumber'' || ''#sob_input_type#'' == ''nuDate'') {
        if (''#sob_input_format#'' == '''') {
            nuDisplayErrorNotBlank(''Input Format'');
        }
    }

    if (''#sob_input_type#'' == ''nuAutoNumber'') {
        if (''#sob_input_count#'' == '''') {
            nuDisplayErrorNotBlank(''Next Number'');
        }
    }

}

if ($o == ''select'') {
    if (''#sob_select_multiple#'' == '''') {
        nuDisplayErrorNotBlank(''Multiple'');
    }
    if (''#sob_select_sql#'' == '''') {
        nuDisplayErrorNotBlank(''SQL/List'');
    }
}

if ($o == ''subform'') {
    if (''#sob_subform_zzzzsys_form_id#'' == '''') {
        nuDisplayErrorNotBlank(''Form'');
    }
    if (''#sob_subform_foreign_key#'' == '''') {
        nuDisplayErrorNotBlank(''Foreign Key'');
    }
    if (''#sob_subform_add#'' == '''') {
        nuDisplayErrorNotBlank(''Addable'');
    }
    if (''#sob_subform_delete#'' == '''') {
        nuDisplayErrorNotBlank(''Deletable'');
    }
    if (''#sob_subform_type#'' == '''') {
        nuDisplayErrorNotBlank(''Type'');
    }
}

if ($o == '''') {
    if (''#sfo_browse_sql#'' == '''') {
        nuDisplayErrorNotBlank(''Browse SQL'');
    }
}

function nuDisplayErrorNotBlank($label) {

    $label = ''<b>'' . $label . ''</b>'';
    nuDisplayError($label . '' '' . nuTranslate(''cannot be left blank''));

}

', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuobjectgrid_AD', N'nuobjectgrid_AD', N'System PHP', N'nubuilder', N'nuDeleteForm(''#RECORD_ID#'');', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuobjectgrid_AS', N'nuobjectgrid_AS', N'System PHP', N'nubuilder', N'$s  = "
    SELECT * 
    FROM zzzzsys_browse 
    WHERE sbr_zzzzsys_form_id = ''#RECORD_ID#''
    ORDER BY sbr_order;
";


$t = nuRunQuery($s);
$o = 10;

while($r = db_fetch_object($t)){
        
    $s  = "
        UPDATE zzzzsys_browse 
        SET sbr_order = ''$o''
        WHERE zzzzsys_browse_id = ''$r->zzzzsys_browse_id''
        ORDER BY sbr_order;
    ";
    
    nuRunQuery($s);
    
    $o = $o + 10;    
    
}

$s  = "
    SELECT * 
    FROM zzzzsys_tab 
    WHERE syt_zzzzsys_form_id = ''#RECORD_ID#''
    ORDER BY syt_order;
";

$t = nuRunQuery($s);
$o = 10;

while($r = db_fetch_object($t)){
        
    $s  = "
        UPDATE zzzzsys_tab 
        SET syt_order = ''$o''
        WHERE zzzzsys_tab_id = ''$r->zzzzsys_tab_id''
        ORDER BY syt_order;
    ";
    
    nuRunQuery($s);
    
    $o = $o + 10;    
    
}

nuCloneForm();', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuobjectgrid_BB', N'nuobjectgrid_BB', N'System PHP', N'nubuilder', N'$s  = "CREATE TABLE #TABLE_ID# SELECT zzzzsys_form_id AS theid FROM zzzzsys_form WHERE ";
$w  = "1";
if ( $GLOBALS[''nuSetup'']->set_denied == 1 )  { 
$w  = "zzzzsys_form_id NOT LIKE ''nu%'' OR zzzzsys_form_id = ''nuuserhome''"; 
}
nuRunQuery("$s$w");
', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuobjectgrid_BD', N'nuobjectgrid_BD', N'System PHP', N'nubuilder', N'nuDisplayError(nuTranslate(''The Delete Operation is not available.''));', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuobjectgrid_BS', N'nuobjectgrid_BS', N'System PHP', N'nubuilder', N'
    $o = ''#sfo_type#'';

    if(''#sfo_type#''             == ''''){nuDisplayError(''<b>Type</b> Cannot Be Blank..'', ''sfo_type'');}
    if(''#sfo_code#''             == ''''){nuDisplayError(''<b>Code</b> Cannot Be Blank..'', ''sfo_code'');}
    if(''#sfo_description#''      == ''''){nuDisplayError(''<b>Description</b> Cannot Be Blank..'', ''sfo_description'');}


    
    
    if($o == ''browseedit'' || $o == ''subform'' || $o == ''browse''){
        
        if($o != ''browse''){
            nuCheckTabs();
        }
        
        if($o != ''subform''){
            nuCheckBrowse();
        }
        
        if(''#sfo_browse_sql#''   == ''''){nuDisplayError(''<b>Browse SQL</b> Cannot Be Blank..'', ''sfo_browse_sql'');}
    }

    if($o == ''edit'' or $o == ''launch''){
        nuCheckTabs();
    }

    if($o != ''launch''){
        if(''#sfo_table#''            == ''''){nuDisplayError(''<b>Table Name</b> Cannot Be Blank..'', ''sfo_table'');}
        if(''#sfo_primary_key#''      == ''''){nuDisplayError(''<b>Primary Key</b> Cannot Be Blank..'', ''sfo_primary_key'');}
    }

function nuCheckBrowse(){

    $r  = 0;
    $sf = nuSubformObject(''zzzzsys_browse_sf'');
    
    for($i = 0 ; $i < count($sf->rows) ; $i++){
       if($sf->deleted[$i] == 0){$r++;}
    }
    
    if($r == 0){
       nuDisplayError(''<b>Must have at least 1</b> Browse Column Defined..'');
    }
    
}

function nuCheckTabs(){

    $r  = 0;
    $sf = nuSubformObject(''zzzzsys_tab_sf'');
    
    for($i = 0 ; $i < count($sf->rows) ; $i++){
       if($sf->deleted[$i] == 0){$r++;}
    }
    
    if($r == 0){
       nuDisplayError(''<b>Must have at least 1</b> Tab Column Defined..'');
    }
    
}




', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nupassword_BS', N'nupassword_BS', N'System PHP', N'nubuilder', N'
$is		= md5(''#old_password#'');
$was	= md5(''#new_password_check#'');
$will	= md5(''#new_password#'');
$ses	= ''#SESSION_ID#'';

$s      = "

    SELECT * 
    FROM zzzzsys_session
    WHERE zzzzsys_session_id = ''$ses''

";

$t  = nuRunQuery($s);
$r  = db_fetch_object($t);
$j  = json_decode($r->sss_access);

$s      = "

    SELECT * 
    FROM zzzzsys_user
    WHERE zzzzsys_user_id = ''#USER_ID#''
    AND sus_login_password = ''$is''

";

$t  = nuRunQuery($s);

if(db_num_rows($t) == 0){

    nuDisplayError(''Incorrect Password'');
    return;
    
}

//-- added by toms

$p	= nuProcedure(''nuCheckPasswordPolicy'');

if($p != ''''){

	eval($p);
	
	if($check == false){
		return;
	}

}

//--

if($will == $was){

    $s  = "

    UPDATE zzzzsys_user 
    SET sus_login_password = ''$will''
    WHERE zzzzsys_user_id = ''#RECORD_ID#''
    AND sus_login_password = ''$is''
    
    ";

    nuRunQuery($s);

}else{
    nuDisplayError(''"Enter New Password" Must be the same as "Re-Enter New Password"'');
}







', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuphp_AS', N'nuphp_AS', N'System PHP', N'nubuilder', N'$justphp = nuObjKey(nuHash(),''filter'') == ''justphp'';

if (''#nuDevMode#'' != 1 && substr(''#RECORD_ID#'', 0, 2) === ''nu'' ) {
   if ($justphp) {
        nuDisplayError(nuTranslate(''<h2>''.nuTranslate(''Information'').''</h2><br>Changes in system forms are overwritten with an update''));  
   } 
}


  ', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuphp_BB', N'nuphp_BB', N'System PHP', N'nubuilder', N'$w  = "sph_system != ''1''";
$s  = nuCreateTableFromSelectSQL("#TABLE_ID#", "SELECT zzzzsys_php_id AS theid FROM zzzzsys_php WHERE ".$w);
nuRunQuery($s);', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuphp_BE', N'nuphp_BE', N'System PHP', N'nubuilder', N'$rid    = ''#RECORD_ID#'';

if($rid != ''-1'' and $rid != ''-2''){ 
    
    $s      = "SELECT * FROM zzzzsys_php WHERE zzzzsys_php_id = ''$rid''";
    $t      = nuRunQuery($s);
    $r      = db_fetch_object($t);
    
    if(db_num_rows($t) == 0){
    
        $s              = "
        INSERT INTO zzzzsys_php
        (
            zzzzsys_php_id,
            sph_code,
            sph_description,
            sph_group,
            sph_system
        )
        VALUES
        (
            ''$rid'', 
            ''$rid'', 
            ''System PHP'', 
            ''nubuilder'', 
            ''1''
        )
        ";
        
        nuRunQuery($s);
        
    }
    
}

', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuphp_BS', N'nuphp_BS', N'System PHP', N'nubuilder', N'$justphp = nuObjKey(nuHash(),''filter'') == ''justphp'';

if (''#nuDevMode#'' != 1 && substr(''#RECORD_ID#'', 0, 2) === ''nu'' ) {
   if (! $justphp) {
        nuDisplayError(nuTranslate("Templates cannot be saved. Clone it instead."));
   } 
}', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuselect_BS', N'nuselect_BS', N'System PHP', N'nubuilder', N'$rid    = ''#RECORD_ID#'';

if($rid != ''-1'' and $rid != ''-2''){ 
    
    $s      = "SELECT * FROM zzzzsys_select WHERE zzzzsys_select_id = ''$rid''";
    $t      = nuRunQuery($s);
    $r      = db_fetch_object($t);
    
    if(db_num_rows($t) == 0){
        
        $s              = "
        INSERT INTO zzzzsys_select
        (zzzzsys_select_id, sse_system)
        VALUES
        (''$rid'', ''1'')
        ";
        
        nuRunQuery($s);
        
    }
    
}

', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nusession_BB', N'nusession_BB', N'System PHP', N'nubuilder', N'if (nuMSSQL()) {
     nuDisplayError(''Not implemented yet!'');
}

if($_SESSION[''nubuilder_session_data''][''IsDemo'']){		
	nuDisplayError(nuTranslate(''Not available in the Demo'')."..");
}', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nusethashcookie', N'nusethashcookie', N'Sets session persistent hash cookies', N'nubuilder', N'// Set session persistent hash cookies
// Usage: Call from JavaScript: nuSetProperty("YourHashCookieName","YourValue",true);
// Credits: Neil

$i = ''#hcname#'';
$nj = ''#hcvalue#'';
$s = "SELECT sss_hashcookies FROM zzzzsys_session WHERE zzzzsys_session_id = ? ";
$t = nuRunQuery($s, array($_SESSION[''nubuilder_session_data''][''SESSION_ID'']));
$r = db_fetch_object($t);
$j = json_decode($r->sss_hashcookies, true);
$j[$i] = $nj;
$J = json_encode($j);
$s = "UPDATE zzzzsys_session SET sss_hashcookies = ? WHERE zzzzsys_session_id = ? ";
$t = nuRunQuery($s, array($J, $_SESSION[''nubuilder_session_data''][''SESSION_ID'']));

$js = "
if(window.nuOnPropertySet){
    nuOnPropertySet(''$i'', ''$nj'');
}
";

nuJavascriptCallback($js);', N'hide', NULL, N'1', N'1', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nusetup_AS', N'nusetup_AS', N'System PHP', N'nubuilder', N'function writeVersionToFile($dbVersion, $filesVersion) {
    
      $f = fopen(__DIR__ . ''/../version.txt'', "w+")  or die("Unable to open file!");
      fwrite($f, "nuBuilder Forte 4.5\n\n");
      fwrite($f,"DB Version: "."$dbVersion\n");
      fwrite($f, "Files Version: "."$filesVersion\n\n");
      fwrite($f,"(V.MajorVersion-CurrentDate.BuildNumber)");
      fclose($f);

}

 
$nuDevOde = ''#nuDevMode#'' == ''1'';

// Write Version Info

if ($nuDevOde ) {
    
    $nuNewDBV = ''#set_db_version_inc#'';
    if ($nuNewDBV != '''') {
        $qry = "UPDATE zzzzsys_info SET inf_details = ? WHERE  inf_code = ''nuDBVersion''";
        nuRunQuery($qry, array($nuNewDBV));
		$nuDBV = $nuNewDBV;
    } else {
        $nuDBV = ''#set_db_version#'';
    }

    $nuNewFilesV = ''#set_files_version_inc#'';
    if ($nuNewFilesV != '''') {
        $qry = "UPDATE zzzzsys_info SET inf_details = ? WHERE  inf_code = ''nuFilesVersion''";
        nuRunQuery($qry, array($nuNewFilesV));
		$nuFilesV = $nuNewFilesV;
    } else {
        $nuFilesV = ''#set_files_version#'';
    }
    
    if ($nuNewFilesV != '''' || $nuNewDBV != '''') {
        writeVersionToFile($nuDBV, $nuFilesV);
    }
    
    if (''#set_dev_reset_tables#'' == true) { 
        
        $lang = array(''["Arabic","Armenian","Chinese","Czech","French","German","Greek","Hindi","Italian","Malay","Russian","Spanish","Tamil","Vietnamese"]'');
        nuRunQuery(''UPDATE zzzzsys_setup SET set_languages_included = ?, set_language = NULL, set_denied = 1 WHEREzzzzsys_setup_id = 1'', $lang);
        
        $q = "
            DELETE FROM zzzzsys_user WHERE zzzzsys_user_id not like ''nu%'';
            DELETE FROM zzzzsys_access WHERE zzzzsys_access_id not like ''nu%'';
            DELETE FROM zzzzsys_access_form WHERE zzzzsys_access_form_id not like ''nu%'';
            DELETE FROM zzzzsys_access_php WHERE zzzzsys_access_php_id not like ''nu%'';
            DELETE FROM zzzzsys_access_report WHERE zzzzsys_access_report_id not like ''nu%'';
            DELETE FROM zzzzsys_cloner WHERE zzzzsys_cloner_id not like ''nu%'';
            DELETE FROM zzzzsys_file where sfi_group <> ''nubuilder'';
            DELETE FROM zzzzsys_format where zzzzsys_format_id  not like ''nu%'';
            DELETE FROM zzzzsys_note where zzzzsys_note_id not like ''nu%'';
            DELETE FROM zzzzsys_note_category where zzzzsys_note_category_id not like ''nu%'';
            DELETE FROM zzzzsys_select where zzzzsys_select_id not like ''nu%'';
            DELETE FROM zzzzsys_select_clause where zzzzsys_select_clause_id not like ''nu%'';
            DELETE FROM zzzzsys_php WHERE sph_php = '''' or sph_php is null;
            DELETE FROM zzzzsys_translate;
            DELETE FROM zzzzsys_debug;
            DELETE FROM zzzzsys_session;
        ";
        
        nuRunQuery($q);

        
    }

}

function nuImportSelectedLanguageFiles($l) {
	try{
		for($i = 0; $i < count($l); $i++) {
		    if (trim($l[$i]) == '''')  continue;
			$file = dirname(__FILE__). ''/languages/''. $l[$i].''.sql'';
			$sql = file_get_contents($file);
			if ($sql) {
				nuRunQuery($sql);
			} else {
				nuDisplayError("Error opening the file: $file");
			}
		}
	}catch (Exception $e) {
        nuDisplayError(nuTranslate(''<h2>''.nuTranslate(''Error'').''</h2><br>Error while importing language files.''));    		
	}
}


// Include/Exclude languages
$t = "#set_languages_included_json#";
if ($t != ''-1'') { // no language change
    
    nuRunQuery("DELETE FROM zzzzsys_translate WHERE zzzzsys_translate_id LIKE ''nu%''");
    if ($t != '''') nuImportSelectedLanguageFiles(json_decode($t));
    
}

// Check if header textarea changed 

if ("#set_header_current#" != "#set_header#" ||  "#set_language_current#" != "#set_language#" ) {
     nuDisplayError(nuTranslate(''<h2>''.nuTranslate(''Information'').''</h2><br>You will need to log in again for the changes to take effect.''));    
}


', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nusetup_BD', N'nusetup_BD', N'System PHP', N'nubuilder', N'nuDisplayError(''The Setup cannot be deleted!'');', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nusetup_BE', N'nusetup_BE', N'System PHP', N'nubuilder', N'function getFileVersion() {
    $f = __DIR__ . ''/../version.txt'';
    if (is_readable($f)) {
        $lines = file($f) [3];
        $lines = preg_replace("/\r|\n/", "", $lines);
        $v = substr($lines, 15, strlen($lines) - 15);
        return $v;

    }
    return "Unknown";
}

$v = getFileVersion();

$j = "

    function nuGetFilesVersion() {
        return ''$v'';
    }

";

nuAddJavascript($j);', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nutablookup_BB', N'nutablookup_BB', N'System PHP', N'nubuilder', N'$w  = "1=1";
if ( $GLOBALS[''nuSetup'']->set_denied == 1 )  { 
    $w  = "zzzzsys_form_id NOT LIKE ''nu%'' OR zzzzsys_form_id = ''nuuserhome''"; 
}

$s  = nuCreateTableFromSelectSQL("#TABLE_ID#", "SELECT zzzzsys_form_id AS theid FROM zzzzsys_form WHERE ".$w);
nuRunQuery($s);', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nutestemail', N'nutestemail', N'Send a test email', N'nubuilder', N'$to = ''#ema_to#'';
$fromAddress = ''#set_smtp_from_address#'';
$fromName = ''#set_smtp_from_name#'';
$body = ''#ema_body#'';
$subject = ''#ema_subject#'';
$bcc = ''#ema_bcc#'';
$cc = ''#ema_cc#'';

$recipient = ($to == '''' && $bcc  =='''' && $cc == '''') ? false : true;

if (! $recipient || $fromAddress == '''' || $fromName = '''' || $body == '''' || $subject == '''') {
    showMessage(nuTranslate(''Error''), nuTranslate(''Required fields cannot be blank.''));
    return;
}

$result = nuSendEmail($to, $fromAddress, $fromName, $body, $subject, array(), true, $cc, $bcc);
if ($result == ''1'') {
    showMessage(nuTranslate(''Result''), $result[1]);
} else {
    showMessage(nuTranslate(''Result''), $result[1].''<br>''.$result[2]);  
}    

function showMessage($title, $msg) {
    nuJavascriptCallback("nuMessage([''<h2>".$title."</h2><br>" . $msg . "'']);");
}', N'hide', NULL, N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nutranslate_AS', N'nutranslate_AS', N'System PHP', N'nubuilder', N'$i  = ''trl_english'';
$t  = nuRunQuery(''SELECT COUNT(*) FROM zzzzsys_debug'');
$c  = db_fetch_row($t)[0];

$j  = ";$(''#$i'').val($c);";

nuJavascriptCallback($j);
', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nutranslate_BD', N'nutranslate_BD', N'System PHP', N'nubuilder', N'if (''#nuDevMode#'' != 1 && substr(''#RECORD_ID#'', 0, 2) === ''nu'') {
   nuDisplayError("nuBuilder''s translation strings cannot be modified");
}', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nutranslate_BE', N'nutranslate_BE', N'System PHP', N'nubuilder', N'
$t          = nuRunQuery("SELECT MAX(trl_language) FROM zzzzsys_translate GROUP BY trl_language");
$a          = array();

while($r = db_fetch_row($t)){
    $a[]    = $r[0];    
}

$j          = json_encode($a);
$f          = "

function nuLanguages(){
    
    return $j;
    
}

";

nuAddJavascript($f);', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nutranslate_BS', N'nutranslate_BS', N'System PHP', N'nubuilder', N'if (''#nuDevMode#'' != 1 && substr(''#RECORD_ID#'', 0, 2) === ''nu'') {
   nuDisplayError("nuBuilder''s translation strings cannot be modified");
}', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuupdate_BE', N'nuupdate_BE', N'System PHP', N'nubuilder', N'
if (nuMSSQL()) {
     nuDisplayError(''Not implemented yet!'');
}', NULL, NULL, N'1', N'0', NULL)
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuupdatesystemids', N'USI', N'Update System IDs', N'nubuilder', N'nuUpdateSystemIds();', N'window', N'nublank', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuuser_AS', N'nuuser_AS', N'System PHP', N'nubuilder', N'
if(''#check_password#'' != ''''){

	$pw	= md5(''#check_password#'');
	nuRunQuery("UPDATE zzzzsys_user SET sus_login_password = ''$pw'' WHERE zzzzsys_user_id = ''#RECORD_ID#''");

}

', N'', N'', N'1', N'0', N'')
INSERT [dbo].[zzzzsys_php] ([zzzzsys_php_id], [sph_code], [sph_description], [sph_group], [sph_php], [sph_run], [sph_zzzzsys_form_id], [sph_system], [sph_global], [sph_hide]) VALUES (N'nuuser_BS', N'nuuser_BS', N'System PHP', N'nubuilder', N'if(''#check_password#'' != ''''){
    if(''#new_password#'' != ''#check_password#''){
        nuDisplayError(''<b>Enter New Password</b> and <b>Reenter New Password</b> must match'');
    }
    
}

', N'', N'', N'1', N'0', N'')
GO
INSERT [dbo].[zzzzsys_setup] ([zzzzsys_setup_id], [set_time_out_minutes], [set_zzzzsys_timezone_id], [set_language], [set_languages_included], [set_smtp_username], [set_smtp_password], [set_smtp_host], [set_smtp_from_address], [set_smtp_from_name], [set_smtp_port], [set_smtp_use_authentication], [set_smtp_use_ssl], [set_header], [set_denied]) VALUES (N'1', 480, N'5281a1220508372', NULL, N'["Arabic","Armenian","Chinese","Czech","French","German","Greek","Hindi","Italian","Malay","Russian","Spanish","Tamil","Vietnamese"]', N'1', N'1', N'1', N'1', N'1', 1, N'1', N'1', N'function nuHeaderTest() {
  console.log(''Functions placed here are available anywhere in nuBuilder Forte.'');
}

// nuOnLoad() will be run after each Browse and Edit Form loads. 

function nuOnLoad() {

 if(nuFormType() == ''edit''){
     // Edit Form loaded
 } else
 if(nuFormType() == ''browse''){
     // Browse Form loaded
 }
 
}

function nuBeforeAddActionButtons() {
   nuAddBackButton();
}

</script>

<!-- Define your own styles, override styles from nubuilder4.css -->

<style> 

 /*.nuActionButton {background-color:#0073aa;} */



</style>


<script>


', N'0')
GO
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36757b92', N'nuform', N'Browse', 20, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Forms'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36791fd5', N'nuform', N'Main', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Forms'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb367c5125', N'nuhome', N'Setup', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36804778', N'nubuildreport', N'Report', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Reports'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb3683fa36', N'nubrowse', N'Browse', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb3686cb0d', N'nuobject', N'All', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Objects_#Tab_-_All'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb368d9c40', N'nuobject', N'Run', 20, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Objects#Tab_-_Run'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36974818', N'nuobject', N'Display', 30, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Objects#Tab_-_Display'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb369a6ee3', N'nuobject', N'Select', 40, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Objects_#Tab_-_Select'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb369d0088', N'nuobject', N'Lookup', 50, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Objects#Tab_-_Lookup'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36a1c024', N'nuobject', N'Subform', 60, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Objects#Tab_-_Subform'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36a4af06', N'nuobject', N'Input', 80, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Objects#Tab_-_Input'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36a71012', N'nuobject', N'HTML', 90, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Objects#Tab_-_HTML'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36aaa539', N'nuevent', N'Event', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36ac903f', N'nuaccess', N'User', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/User_Access#Creating_an_Access_Level'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36af0c58', N'nuaccess', N'Forms', 20, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/User_Access#Creating_an_Access_Level'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36b12637', N'nunonsystemform', N'Forms', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36b27343', N'nuphp', N'PHP', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Procedures'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36b63cae', N'nuuser', N'User Details', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/User_Access#Adding_a_User'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36b994d2', N'nuaccessforms', N'Form', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36bc9e21', N'nublank', N'Launch', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36bdec72', N'nuaccessgroup', N'Access Group', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36bf8d38', N'nudebug', N'Debug', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36c16b42', N'nuaccess', N'Procedures', 30, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/User_Access#Creating_an_Access_Level'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36c39fc8', N'nuaccess', N'Reports', 40, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/User_Access#Creating_an_Access_Level'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36c55179', N'nuaccessreport', N'Access', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36c75655', N'nuaccesslevelreport', N'Access', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36c9250f', N'nutab', N'Tabs', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Forms#Tabs_.28Subform.29'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36cb6102', N'nurunreport', N'Report', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36ce06d9', N'nurunphp', N'PHP', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36cfbbfa', N'nulaunchdates', N'Launch', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36d2177c', N'nurunlist', N'Test', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36d582df', N'nutimezone', N'Zone', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36d97acd', N'nusetup', N'Setup', 20, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Setup#Setup'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36e31edf', N'nusetup', N'Email Settings', 30, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Setup#Email_Settings'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36e9143a', N'nusetup', N'Header', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Setup#Header'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36eb07f0', N'nutranslate', N'Phrase', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Translations'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36ed494f', N'nupassword', N'Change Password', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36efb50c', N'nuhome', N'Builders', 20, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36f36433', N'nufflaunch', N'Form', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Form_Builder'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36f72f8e', N'nufastformobjects', N'Label', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36f99a7e', N'nuobject', N'Calc', 100, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Objects#Tab_-_Calc'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36fcbc18', N'nuformat', N'Format', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Format_Builder'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb36ffc300', N'nuformatcurrency', N'Currency', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb37026348', N'nuform', N'Custom Code', 30, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Functions'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb370b409e', N'nuobject', N'Custom Code', 110, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Objects#Tab_-_Custom_Code'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb370eb06a', N'nusample', N'Other Objects', 30, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb3719774c', N'nufile', N'Main', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Files'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb371c865e', N'nuobject', N'Image', 70, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Objects#Tab_-_Image'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb371e2de7', N'nuselect', N'SQL', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/SQL_Builder'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb3721b534', N'nulaunchable', N'Main', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb3722f122', N'nulaunchable', N'Browse', 20, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb3724c6ca', N'nulaunchable', N'Custom Code', 30, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb37296979', N'nuclause', N'Clause', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb3732c76e', N'nusample', N'Subform', 20, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb3734c18f', N'nufastreportobjects', N'Label', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb3737e773', N'nufrlaunch', N'Main', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Report_Builder'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb373c384f', N'nusample', N'Inputs', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb37405d73', N'nusamplesubformform', N'Main', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb374207e3', N'nuuserhome', N'Main', 20, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb37434d3a', N'nulaunchform', N'Forms', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5bad6cb374482e8', N'nutablookup', N'Tabs', 10, N'window.open(''http://wiki.nubuilder.net/nubuilderforte/index.php/Forms#Tabs_.28Subform.29'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5f711b9343afdbd', N'nucsvtransfer', N'Transfer', 10, N'window.open(''https://wiki.nubuilder.net/nubuilderforte/index.php/CSV_Transfer'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5f9aaac95bc52e7', N'nucloner', N'Form', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fd29810a60df91', N'nunotes', N'Notes', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fd6f697276396f', N'nunotescategroy', N'Main', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fd750667019155', N'nuhome', N'Database', 30, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fd8ed305105aa6', N'nuuserlogged', N'Main', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fdb1b5b254566f', N'nucodesnippet', N'Main', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fdb9ff026348', N'nuform', N'Access Levels', 40, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fdb9ffd6faaa', N'nu5fdb9ffd45aaa', N'Form', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fdb9ffd6fbca', N'nu5fdb9ffd45efe', N'Form', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fdf7df2d873dd1', N'nuphp', N'Access Levels', 20, N'window.open(''https://wiki.nubuilder.net/nubuilderforte/index.php/User_Access'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fdf7fc6680a0b2', N'nubuildreport', N'Access Levels', 20, N'window.open(''https://wiki.nubuilder.net/nubuilderforte/index.php/User_Access'');')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fe0547b76e25d6', N'nuauthentication', N'Authentication', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fe19e93306dd6e', N'nusetup', N'Developer', 40, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5feb70e6a6b9cf8', N'nuupdate', N'Update', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5feb9ffd6fbca', N'nu5feb9ffd45efe', N'Form', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fed7cde6151088', N'nuobjectgrid', N'Main', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5fee9ffd6fbca', N'nu5fee9ffd45efe', N'Form', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nu5ff48b9c18dbf6f', N'nuemailtest', N'Main', 10, N'')
INSERT [dbo].[zzzzsys_tab] ([zzzzsys_tab_id], [syt_zzzzsys_form_id], [syt_title], [syt_order], [syt_help]) VALUES (N'nufastforms', N'nuuserhome', N'Fast Forms', -1, NULL)
GO
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fa3409d46f', N'Africa/Abidjan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fa44106fdd', N'Africa/Accra')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fa54a1c5c4', N'Africa/Addis_Ababa')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fa64a81c45', N'Africa/Algiers')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fa74aef179', N'Africa/Asmara')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fa84b5bed6', N'Africa/Asmera')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fa94bc9a93', N'Africa/Bamako')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819faa4c334ed', N'Africa/Bangui')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fab4c9ff3f', N'Africa/Banjul')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fac4d0b2f3', N'Africa/Bissau')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fad4d6d2ab', N'Africa/Blantyre')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fae4dd596d', N'Africa/Brazzaville')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819faf4e3ea69', N'Africa/Bujumbura')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fb04ea2165', N'Africa/Cairo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fb14f0c347', N'Africa/Casablanca')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fb24f7a1a9', N'Africa/Ceuta')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fb34feb2b9', N'Africa/Conakry')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fb4505727a', N'Africa/Dakar')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fb550bf3bd', N'Africa/Dar_es_Salaam')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fb6512b354', N'Africa/Djibouti')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fb7519de97', N'Africa/Douala')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fb8520ef05', N'Africa/El_Aaiun')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fb9527a466', N'Africa/Freetown')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fba52e8bfe', N'Africa/Gaborone')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fbb535a8db', N'Africa/Harare')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fbc53cc7cb', N'Africa/Johannesburg')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fbd543bb3d', N'Africa/Juba')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fbe54a483a', N'Africa/Kampala')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fbf550c406', N'Africa/Khartoum')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fc055a94f7', N'Africa/Kigali')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fc156a0bb9', N'Africa/Kinshasa')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fc2584bf74', N'Africa/Lagos     ')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fc358f7f66', N'Africa/Libreville')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fc45965c0d', N'Africa/Lome')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fc559d1824', N'Africa/Luanda')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fc65a72a20', N'Africa/Lubumbashi')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fc75ae5c44', N'Africa/Lusaka')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fc85b5ca8c', N'Africa/Malabo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fc95bd505d', N'Africa/Maputo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fca5e1862c', N'Africa/Maseru')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fcb5e82cb2', N'Africa/Mbabane')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fcc5eebbe0', N'Africa/Mogadishu')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fcd5f56d2d', N'Africa/Monrovia')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fce5fbef7c', N'Africa/Nairobi')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fcf6025798', N'Africa/Ndjamena')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fd0608eabc', N'Africa/Niamey')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fd160f38e7', N'Africa/Nouakchott')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fd26198388', N'Africa/Ouagadougou')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fd36cef7d3', N'Africa/Porto-Novo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fd46d5db96', N'Africa/Sao_Tome')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fd56e465c5', N'Africa/Timbuktu')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fd66eb1b1d', N'Africa/Tripoli')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fd76f1d1cf', N'Africa/Tunis')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fd86f894da', N'Africa/Windhoek')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fd96ff36de', N'America/Adak')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fda705d5db', N'America/Anchorage')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fdb70ca47b', N'America/Anguilla')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fdc713665a', N'America/Antigua')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fdd71a44c6', N'America/Araguaina')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fde7211b94', N'America/Argentina/Buenos_Aires')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fdf727d3b7', N'America/Argentina/Catamarca')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fe072e958b', N'America/Argentina/ComodRivadavia')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fe17352bc1', N'America/Argentina/Cordoba')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fe274021b6', N'America/Argentina/Jujuy')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fe37477a3e', N'America/Argentina/La_Rioja')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fe474f1b3c', N'America/Argentina/Mendoza')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fe5756aca9', N'America/Argentina/Rio_Gallegos')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fe675e3a45', N'America/Argentina/Salta')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fe7765b813', N'America/Argentina/San_Juan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fe876d4888', N'America/Argentina/San_Luis')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fe97747d84', N'America/Argentina/Tucuman')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fea77c0dbe', N'America/Argentina/Ushuaia')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819feb783abf9', N'America/Aruba')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fec78b6d98', N'America/Asuncion')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fed7926984', N'America/Atikokan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fee799c9bd', N'America/Atka')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fef7a0e5c7', N'America/Bahia')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ff087e6620', N'America/Bahia_Banderas')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ff18856b00', N'America/Barbados')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ff2890b040', N'America/Belem')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ff3897c302', N'America/Belize')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ff489eb768', N'America/Blanc-Sablon')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ff58a5b604', N'America/Boa_Vista')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ff68acf15d', N'America/Bogota')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ff78b49038', N'America/Boise')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ff88bbf287', N'America/Buenos_Aires')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ff98c31a7c', N'America/Cambridge_Bay')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ffa8c9fd3d', N'America/Campo_Grande')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ffb8d0e9f3', N'America/Cancun')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ffc8d8294c', N'America/Caracas')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ffd8e40c54', N'America/Catamarca')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819ffe8ebf7a8', N'America/Cayenne')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'52819fff8f3deef', N'America/Cayman')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0008fb91da', N'America/Chicago')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a001902eacc', N'America/Chihuahua')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00290a5cdf', N'America/Coral_Harbour')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0039121eb5', N'America/Cordoba')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00491d04fe', N'America/Costa_Rica')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00592545ff', N'America/Creston')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00692d3646', N'America/Cuiaba')
GO
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a007935bea0', N'America/Curacao')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00893dac77', N'America/Danmarkshavn')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00994592a4', N'America/Dawson')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00a94e4d56', N'America/Dawson_Creek')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00b956da59', N'America/Denver')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00c95f4f78', N'America/Detroit')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00d9672fc4', N'America/Dominica')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00e96f1a71', N'America/Edmonton')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a00f976ef28', N'America/Eirunepe')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a01097ec36c', N'America/El_Salvador')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a011986a4c9', N'America/Ensenada')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a01298eb04c', N'America/Fort_Wayne')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a013996e3cc', N'America/Fortaleza')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a01499ee0d7', N'America/Glace_Bay')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0159a6738f', N'America/Godthab')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0169ae60fb', N'America/Goose_Bay')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0179b64421', N'America/Grand_Turk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0189be3e29', N'America/Grenada')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0199c6344a', N'America/Guadeloupe')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a01a9ce3844', N'America/Guatemala')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a01b9d64472', N'America/Guayaquil')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a01c9de431f', N'America/Guyana')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a01d9e64a89', N'America/Halifax')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a01e9ee5729', N'America/Havana')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a01fa582b0b', N'America/Hermosillo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a020a60c1cb', N'America/Indiana/Indianapolis')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a021a68ad1b', N'America/Indiana/Knox')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a022a70ab7e', N'America/Indiana/Marengo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a023a78a9f8', N'America/Indiana/Petersburg')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a024b6c65d2', N'America/Indiana/Tell_City')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a025b743617', N'America/Indiana/Vevay')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a026b7bd32b', N'America/Indiana/Vincennes')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a027b83c7b7', N'America/Indiana/Winamac')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a028b8b5382', N'America/Indianapolis')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a029b92b8a4', N'America/Inuvik')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a02ab9a5642', N'America/Iqaluit')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a02bba2319a', N'America/Jamaica')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a02cc3580ca', N'America/Jujuy')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a02dc3d9b4a', N'America/Juneau')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a02ec4b4b08', N'America/Kentucky/Louisville')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a02fc57ddcd', N'America/Kentucky/Monticello')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a030c5f7f87', N'America/Knox_IN')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a031c67163d', N'America/Kralendijk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a032c6ecabc', N'America/La_Paz')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a033c7667a3', N'America/Lima')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a034c7e4ccf', N'America/Los_Angeles')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a035c860612', N'America/Louisville')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a036c8dfceb', N'America/Lower_Princes')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a037c95acd2', N'America/Maceio')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a038c9dae4d', N'America/Managua')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a039ca5fd3d', N'America/Manaus')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a03ad4029d7', N'America/Marigot')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a03bd4800a8', N'America/Martinique')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a03cd4f8d9d', N'America/Matamoros')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a03dd56f298', N'America/Mazatlan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a03ed5eb8a2', N'America/Mendoza')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a03fd6686ad', N'America/Menominee')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a040d6e2a6f', N'America/Merida')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a041d776ec4', N'America/Metlakatla')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a042d7f6261', N'America/Mexico_City')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a043d874e50', N'America/Miquelon')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a044d8f40df', N'America/Moncton')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a045d96f56b', N'America/Monterrey')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a046d9eebc9', N'America/Montevideo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a047da6f51b', N'America/Montreal')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a048daec32f', N'America/Montserrat')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a049db6c822', N'America/Nassau')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a04adbebf83', N'America/New_York')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a04be29de22', N'America/Nipigon')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a04ce3791ab', N'America/Nome')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a04de4621e6', N'America/Noronha')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a04ee4e9d8a', N'America/North_Dakota/Beulah')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a04fe56a837', N'America/North_Dakota/Center')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a050e5ec3bf', N'America/North_Dakota/New_Salem')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a051e66c226', N'America/Ojinaga')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a052e6eb6b1', N'America/Panama')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a053e771ebf', N'America/Pangnirtung')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a054e7f5d06', N'America/Paramaribo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a055e87432b', N'America/Phoenix')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a056f3e39a9', N'America/Port-au-Prince')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a058008a8ad', N'America/Port_of_Spain')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a059011444a', N'America/Porto_Acre')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a05a019da2e', N'America/Porto_Velho')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a05b02270ec', N'America/Puerto_Rico')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a05c02b2d2e', N'America/Rainy_River')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a05d0abd421', N'America/Rankin_Inlet')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a05e0b23bbb', N'America/Recife')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a05f0ba9fac', N'America/Regina')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0600c2a582', N'America/Resolute')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0610cf1e16', N'America/Rio_Branco')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0620d6e73e', N'America/Rosario')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0630df269f', N'America/Santa_Isabel')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0640e7c243', N'America/Santarem')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0650f00b2b', N'America/Santiago')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0660f81e90', N'America/Santo_Domingo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0671001fe9', N'America/Sao_Paulo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a06816b015a', N'America/Scoresbysund')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0691738a17', N'America/Shiprock')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a06a17c07af', N'America/Sitka')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a06b184793e', N'America/St_Barthelemy')
GO
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a06c18cefca', N'America/St_Johns')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a06d195ad37', N'America/St_Kitts')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a06e19dcad8', N'America/St_Lucia')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a06f1ab84cc', N'America/St_Thomas')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0701b4895b', N'America/St_Vincent')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0711bdc9cb', N'America/Swift_Current')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0721c6d284', N'America/Tegucigalpa')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0731cfe848', N'America/Thule')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0741d90667', N'America/Thunder_Bay')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0751e22f0d', N'America/Tijuana')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0761efa34f', N'America/Toronto')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0771f90738', N'America/Tortola')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0782119266', N'America/Vancouver')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a07921a60bc', N'America/Virgin')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a07a2262248', N'America/Whitehorse')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a07b22f5dc0', N'America/Winnipeg')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a07c2387969', N'America/Yakutat')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a07d24138e6', N'America/Yellowknife')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a07e24a3926', N'Antarctica/Casey')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a07f253cc33', N'Antarctica/Davis')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a080261a293', N'Antarctica/DumontDUrville')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a08126af775', N'Antarctica/Macquarie')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a082274083d', N'Antarctica/Mawson')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0832b865db', N'Antarctica/McMurdo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0842c1a6a4', N'Antarctica/Palmer')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0852cac95d', N'Antarctica/Rothera')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0862d3c98a', N'Antarctica/South_Pole')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0872dca2fd', N'Antarctica/Syowa')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0882e5a3db', N'Antarctica/Vostok')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0892ef8f3e', N'Arctic/Longyearbyen')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a08a2f8c58e', N'Asia/Aden')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a08b392c116', N'Asia/Almaty')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a08c39bfc99', N'Asia/Amman')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a08d3a9af97', N'Asia/Anadyr')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a08e3afe663', N'Asia/Aqtau')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a08f3b8ffbf', N'Asia/Aqtobe')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0903c1eb18', N'Asia/Ashgabat')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0913cad956', N'Asia/Ashkhabad')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0923d493e0', N'Asia/Baghdad')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0933db361c', N'Asia/Bahrain')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0943e4d693', N'Asia/Baku')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0953ee5155', N'Asia/Bangkok')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0963f77c2f', N'Asia/Beirut')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a09740551ac', N'Asia/Bishkek')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a09840eba22', N'Asia/Brunei')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0994183708', N'Asia/Calcutta')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a09a421c122', N'Asia/Choibalsan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a09b42b4a59', N'Asia/Chongqing')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a09c434d7a2', N'Asia/Chungking')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a09d5004cfc', N'Asia/Colombo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a09e50a0bc7', N'Asia/Dacca')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a09f5139227', N'Asia/Damascus')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0a051ccb15', N'Asia/Dhaka')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0a15264929', N'Asia/Dili')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0a25931d48', N'Asia/Dubai')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0a359c69e6', N'Asia/Dushanbe')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0a45a5d9dd', N'Asia/Gaza')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0a55af5fb5', N'Asia/Harbin')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0a6683a809', N'Asia/Hebron')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0a768ccd66', N'Asia/Ho_Chi_Minh')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0a87491a25', N'Asia/Hong_Kong')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0a975249f9', N'Asia/Hovd')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0aa75b1122', N'Asia/Irkutsk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0ab763ee82', N'Asia/Istanbul')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0ac76d0bba', N'Asia/Jakarta')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0ad7762040', N'Asia/Jayapura')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0ae77f9979', N'Asia/Jerusalem')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0af7888b2a', N'Asia/Kabul')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0b07f60fbd', N'Asia/Kamchatka')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0b17ff7b93', N'Asia/Karachi')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0b2808875b', N'Asia/Kashgar')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0b38121eec', N'Asia/Kathmandu')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0b481b3f82', N'Asia/Katmandu')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0b582467de', N'Asia/Khandyga')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0b682d7c6b', N'Asia/Kolkata')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0b7836a737', N'Asia/Krasnoyarsk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0b883fc097', N'Asia/Kuala_Lumpur')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0b984900e1', N'Asia/Kuching')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0ba9625309', N'Asia/Kuwait')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0bb9995a61', N'Asia/Macao')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0bc9b6658f', N'Asia/Macau')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0bda2c3f39', N'Asia/Magadan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0bea353642', N'Asia/Makassar')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0bfa3e3403', N'Asia/Manila')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0c0a47b670', N'Asia/Muscat')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0c1a513266', N'Asia/Nicosia')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0c2a5a914a', N'Asia/Novokuznetsk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0c3a63e893', N'Asia/Novosibirsk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0c4a6cfff2', N'Asia/Omsk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0c5ac5370d', N'Asia/Oral')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0c6ad3a016', N'Asia/Phnom_Penh')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0c7add4a83', N'Asia/Pontianak')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0c8ae6fc1d', N'Asia/Pyongyang')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0c9af084a7', N'Asia/Qatar')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0caaf9a3f7', N'Asia/Qyzylorda')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0cbb029a0f', N'Asia/Rangoon')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0ccb0b8ed7', N'Asia/Riyadh')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0cdb14f26f', N'Asia/Saigon')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0ceb1e6900', N'Asia/Sakhalin')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0cfb27e770', N'Asia/Samarkand')
GO
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0d0b310ab9', N'Asia/Seoul')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0d1b3a71fe', N'Asia/Shanghai')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0d2b43caed', N'Asia/Singapore')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0d3b4ce508', N'Asia/Taipei')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0d4b5675f0', N'Asia/Tashkent')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0d5b6195f2', N'Asia/Tbilisi')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0d6b6a9048', N'Asia/Tehran')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0d7b738dfa', N'Asia/Tel_Aviv')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0d8b7ca13e', N'Asia/Thimbu')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0d9c3af580', N'Asia/Thimphu')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0dac410be3', N'Asia/Tokyo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0dbc498d19', N'Asia/Ujung_Pandang')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0dcc5452d8', N'Asia/Ulaanbaatar')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0ddc5cffcb', N'Asia/Ulan_Bator')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0dec72d2c8', N'Asia/Urumqi')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0dfc802643', N'Asia/Ust-Nera')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0e0c8a8864', N'Asia/Vientiane')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0e1c97ee98', N'Asia/Vladivostok')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0e2c9f8bff', N'Asia/Yakutsk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0e3ca96355', N'Asia/Yekaterinburg')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0e4cb41fb8', N'Asia/Yerevan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0e5cbd2ab3', N'Atlantic/Azores')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0e6cc39d74', N'Atlantic/Bermuda')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0e7cd08d1f', N'Atlantic/Canary')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0e8cdf71cd', N'Atlantic/Cape_Verde')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0e9cee78d7', N'Atlantic/Faeroe')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0eacf865b6', N'Atlantic/Faroe')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0ebd023d83', N'Atlantic/Jan_Mayen')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0ecd083a61', N'Atlantic/Madeira')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0edd11319e', N'Atlantic/Reykjavik')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0eed19481b', N'Atlantic/South_Georgia')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0efd1f32fb', N'Atlantic/St_Helena')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0f0d28596b', N'Atlantic/Stanley')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0f1d34022d', N'Australia/ACT')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0f2d414c2c', N'Australia/Adelaide')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0f3d50b948', N'Australia/Brisbane')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0f4d5ad53b', N'Australia/Broken_Hill')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0f5d6511b5', N'Australia/Canberra')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0f6d6f2fcb', N'Australia/Currie')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0f7d793413', N'Australia/Darwin')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0f8d837181', N'Australia/Eucla')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0f9d8d96a3', N'Australia/Hobart')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0fad975081', N'Australia/LHI')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0fbda115d9', N'Australia/Lindeman')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0fcdab0d34', N'Australia/Lord_Howe')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0fddb58517', N'Australia/Melbourne')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0fedbfa7e6', N'Australia/North')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a0ffdc99118', N'Australia/NSW')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a100dd385a2', N'Australia/Perth')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a101ddd8257', N'Australia/Queensland')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a102de7b7a9', N'Australia/South')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a103df20a58', N'Australia/Sydney')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a104dfc5885', N'Australia/Tasmania')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a105e06a9b6', N'Australia/Victoria')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a106e10f94a', N'Australia/West')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a107e1b7664', N'Australia/Yancowinna')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a108e25bc93', N'Brazil/Acre')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a109e3d5d6e', N'Brazil/DeNoronha')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a10ae43d03b', N'Brazil/East')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a10be4de708', N'Brazil/West')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a10ce57f01e', N'Canada/Atlantic')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a10de622257', N'Canada/Central')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a10ee6bf449', N'Canada/East-Saskatchewan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a10fe75f2c4', N'Canada/Eastern')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a110e80412c', N'Canada/Mountain')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a111e8ab026', N'Canada/Newfoundland')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a112e94ed84', N'Canada/Pacific')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a113e9f0daa', N'Canada/Saskatchewan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a114f0b9085', N'Canada/Yukon')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a115f1557e0', N'CET')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a116f1f4f2e', N'Chile/Continental')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a117f296fd5', N'Chile/EasterIsland')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a118f33df3d', N'CST6CDT')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a119f3e04e9', N'Cuba')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a11b005e55d', N'EET')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a11c00fa005', N'Egypt')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a11d01970ad', N'Eire')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a11e027c729', N'EST')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a11f031f564', N'EST5EDT')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a12003bd2d8', N'Etc/GMT')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a121045accb', N'Etc/GMT+0')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1220508372', N'Etc/GMT+1')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a12305b7170', N'Etc/GMT+10')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a12406b3d0a', N'Etc/GMT+11')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a125075e837', N'Etc/GMT+12')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a126080e0f2', N'Etc/GMT+2')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a12708c2a64', N'Etc/GMT+3')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a128097255f', N'Etc/GMT+4')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1290a6ffbc', N'Etc/GMT+5')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a12a0b21a7c', N'Etc/GMT+6')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a12b0bcc422', N'Etc/GMT+7')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a12c0c747f2', N'Etc/GMT+8')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a12d0d21e28', N'Etc/GMT+9')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a12e0dd3691', N'Etc/GMT-0')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a12f14f8806', N'Etc/GMT-1')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a13015ad04a', N'Etc/GMT-10')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a131165c9a8', N'Etc/GMT-11')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a132170a862', N'Etc/GMT-12')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a13317ba384', N'Etc/GMT-13')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1341865467', N'Etc/GMT-14')
GO
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1351915ab2', N'Etc/GMT-2')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a13619c9d77', N'Etc/GMT-3')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1371a7a768', N'Etc/GMT-4')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1381b291ad', N'Etc/GMT-5')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1391bd512c', N'Etc/GMT-6')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a13a1cdc706', N'Etc/GMT-7')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a13b1dde432', N'Etc/GMT-8')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a13c1e901f3', N'Etc/GMT-9')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a13d1f4118d', N'Etc/GMT0')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a13e1fecf31', N'Etc/Greenwich')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a13f20ea1f3', N'Etc/UCT')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a14021ecc1a', N'Etc/Universal')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a141276c8dd', N'Etc/UTC')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1422870f52', N'Etc/Zulu')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a14328d7e27', N'Europe/Amsterdam')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a144293e781', N'Europe/Andorra')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a14529a6597', N'Europe/Athens')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1462a2183d', N'Europe/Belfast')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1472b27ab5', N'Europe/Belgrade')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1482b95f9d', N'Europe/Berlin')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1492c3f8d0', N'Europe/Bratislava')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a14a2d40451', N'Europe/Brussels')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a14b2de356d', N'Europe/Bucharest')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a14c2e8003e', N'Europe/Budapest')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a14d2ef47a3', N'Europe/Busingen')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a14e2f9d4cf', N'Europe/Chisinau')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a14f3048453', N'Europe/Copenhagen')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a15030f2b55', N'Europe/Dublin')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1513ce8a90', N'Europe/Gibraltar')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1523d9455c', N'Europe/Guernsey')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1533e3ecc9', N'Europe/Helsinki')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1543ee5f5a', N'Europe/Isle_of_Man')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1553fb3f61', N'Europe/Istanbul')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a15640623f7', N'Europe/Jersey')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1574109a27', N'Europe/Kaliningrad')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a158421be40', N'Europe/Kiev')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a15942d2df1', N'Europe/Lisbon')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a15a4387b4d', N'Europe/Ljubljana')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a15b443824d', N'Europe/London')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a15c44ee825', N'Europe/Luxembourg')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a15d459a699', N'Europe/Madrid')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a15e46aa01e', N'Europe/Malta')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a15f4756ead', N'Europe/Mariehamn')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a16048033d3', N'Europe/Minsk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a16148b02d8', N'Europe/Monaco')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a162495ae00', N'Europe/Moscow')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1634a06938', N'Europe/Nicosia')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1644ab2537', N'Europe/Oslo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1654b607a0', N'Europe/Paris')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1664c0a464', N'Europe/Podgorica')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1675297098', N'Europe/Prague')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a168534cbef', N'Europe/Riga')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a16953c1632', N'Europe/Rome')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a16a546eb1c', N'Europe/Samara')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a16b55183d6', N'Europe/San_Marino')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a16c55c3e49', N'Europe/Sarajevo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a16d567a909', N'Europe/Simferopol')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a16e578c5ca', N'Europe/Skopje')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a16f58a0561', N'Europe/Sofia')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a17059b7e00', N'Europe/Stockholm')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1715ada39c', N'Europe/Tallinn')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1725b981dd', N'Europe/Tirane')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1735c520ab', N'Europe/Tiraspol')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1745d0c5ff', N'Europe/Uzhgorod')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1755dc75a3', N'Europe/Vaduz')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1765e7ec77', N'Europe/Vatican')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1775f33528', N'Europe/Vienna')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1785fee51e', N'Europe/Vilnius')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a17960a75a5', N'Europe/Volgograd')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a17a61653f3', N'Europe/Warsaw')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a17b621c391', N'Europe/Zagreb')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a17c62d8149', N'Europe/Zaporozhye')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a17d6394bdc', N'Europe/Zurich')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a17e64b04e6', N'Factory')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a17f6566ce7', N'GB')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a180667b0ff', N'GB-Eire')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a18167364aa', N'GMT')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a18267f39f3', N'GMT+0')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a183690a029', N'GMT-0')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a18469c9b45', N'GMT0')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1856a822c1', N'Greenwich')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1866b3a73f', N'Hongkong')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1876bf5f3f', N'HST')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1886cbc018', N'Iceland')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1896d7af41', N'Indian/Antananarivo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a18a6e38d94', N'Indian/Chagos')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a18b6ef1055', N'Indian/Christmas')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a18c6fa914a', N'Indian/Cocos')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a18d716cac2', N'Indian/Comoro')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a18e727f96b', N'Indian/Kerguelen')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a18f7335833', N'Indian/Mahe')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1907dbe28e', N'Indian/Maldives')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1917e7a840', N'Indian/Mauritius')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1927f358dc', N'Indian/Mayotte')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1937ffce01', N'Indian/Reunion')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a19480b8eb3', N'Iran')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1958174e03', N'Israel')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1968236672', N'Jamaica')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1978349c3b', N'Japan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a19884666fe', N'Kwajalein')
GO
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a19985161dc', N'Libya')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a19a85d936f', N'MET')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a19b869ac55', N'Mexico/BajaNorte')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a19c8755b50', N'Mexico/BajaSur')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a19d8805651', N'Mexico/General')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a19e88c6791', N'MST')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a19f8a9df7c', N'MST7MDT')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1a08b568c9', N'Navajo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1a18c10637', N'NZ')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1a28cc076a', N'NZ-CHAT')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1a38db68d2', N'Pacific/Apia')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1a48edbfe0', N'Pacific/Auckland')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1a58f97f6b', N'Pacific/Chatham')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1a690adea0', N'Pacific/Chuuk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1a7914900c', N'Pacific/Easter')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1a89202f8f', N'Pacific/Efate')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1a992be08a', N'Pacific/Enderbury')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1aa9376832', N'Pacific/Fakaofo')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1ab969470b', N'Pacific/Fiji')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1ac9755655', N'Pacific/Funafuti')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1ad9816446', N'Pacific/Galapagos')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1ae98d3fae', N'Pacific/Gambier')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1af9991f3e', N'Pacific/Guadalcanal')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1b09a4fddd', N'Pacific/Guam')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1b19b0cfd2', N'Pacific/Honolulu')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1b29faa3dd', N'Pacific/Johnston')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1b3a0d3019', N'Pacific/Kiritimati')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1b4a18cdc0', N'Pacific/Kosrae')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1b5a2a9fe4', N'Pacific/Kwajalein')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1b6a366199', N'Pacific/Majuro')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1b7a41e352', N'Pacific/Marquesas')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1b8a543c50', N'Pacific/Midway')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1b9a65d08d', N'Pacific/Nauru')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1baa7229e2', N'Pacific/Niue')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1bba7e9f84', N'Pacific/Norfolk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1bca8aff1f', N'Pacific/Noumea')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1bda973ea9', N'Pacific/Pago_Pago')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1beaa37ad1', N'Pacific/Palau')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1bfaaf8959', N'Pacific/Pitcairn')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1c0abb94a6', N'Pacific/Pohnpei')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1c1ac7d9a4', N'Pacific/Ponape')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1c2adaeefc', N'Pacific/Port_Moresby')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1c3ae74c55', N'Pacific/Rarotonga')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1c4af3715e', N'Pacific/Saipan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1c5aff8b7a', N'Pacific/Samoa')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1c6b0be317', N'Pacific/Tahiti')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1c7b7d1d5a', N'Pacific/Tarawa')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1c8b88aa9e', N'Pacific/Tongatapu')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1c9b9b4eb9', N'Pacific/Truk')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1caba3a73f', N'Pacific/Wake')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1cbbb03788', N'Pacific/Wallis')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1ccc0a2ed7', N'Pacific/Yap')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1cdc1ce40f', N'Poland')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1cec2b8c7b', N'Portugal')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1cfc380ffd', N'PRC')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1d0c44a02a', N'PST8PDT')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1d1c5090a1', N'ROC')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1d2c5cc7f0', N'ROK')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1d3c69078e', N'Singapore')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1d4c757c4b', N'Turkey')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1d5c82280a', N'UCT')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1d6c8ec435', N'Universal')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1d7c9af2ed', N'US/Alaska')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1d8cabf7f1', N'US/Aleutian')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1d9cb7bad5', N'US/Arizona')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1dacc37651', N'US/Central')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1dbccf3617', N'US/East-Indiana')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1dcce1ad1c', N'US/Eastern')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1ddcee9e3c', N'US/Hawaii')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1decfb3884', N'US/Indiana-Starke')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1dfd0d95b2', N'US/Michigan')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1e0d1a0e86', N'US/Mountain')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1e1d267cf9', N'US/Pacific')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1e2d332a62', N'US/Pacific-New')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1e3d3f844f', N'US/Samoa')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1e4d4c2232', N'UTC')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1e5d5896c1', N'W-SU')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1e6d64f54c', N'WET')
INSERT [dbo].[zzzzsys_timezone] ([zzzzsys_timezone_id], [stz_timezone]) VALUES (N'5281a1e7d719d77', N'Zulu')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [zzzzsys_note$title]    Script Date: 17.03.2021 19:30:57 ******/
ALTER TABLE [dbo].[zzzzsys_note] ADD  CONSTRAINT [zzzzsys_note$title] UNIQUE NONCLUSTERED 
(
	[not_title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[zzzzsys_access] ADD  DEFAULT (N'') FOR [zzzzsys_access_id]
GO
ALTER TABLE [dbo].[zzzzsys_access] ADD  DEFAULT (NULL) FOR [sal_code]
GO
ALTER TABLE [dbo].[zzzzsys_access] ADD  DEFAULT (NULL) FOR [sal_description]
GO
ALTER TABLE [dbo].[zzzzsys_access] ADD  DEFAULT (NULL) FOR [sal_zzzzsys_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_access_form] ADD  DEFAULT (N'') FOR [zzzzsys_access_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_access_form] ADD  DEFAULT (NULL) FOR [slf_zzzzsys_access_id]
GO
ALTER TABLE [dbo].[zzzzsys_access_form] ADD  DEFAULT (NULL) FOR [slf_zzzzsys_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_access_form] ADD  DEFAULT (NULL) FOR [slf_add_button]
GO
ALTER TABLE [dbo].[zzzzsys_access_form] ADD  DEFAULT (NULL) FOR [slf_save_button]
GO
ALTER TABLE [dbo].[zzzzsys_access_form] ADD  DEFAULT (NULL) FOR [slf_delete_button]
GO
ALTER TABLE [dbo].[zzzzsys_access_form] ADD  DEFAULT (NULL) FOR [slf_clone_button]
GO
ALTER TABLE [dbo].[zzzzsys_access_form] ADD  DEFAULT (NULL) FOR [slf_new_button]
GO
ALTER TABLE [dbo].[zzzzsys_access_form] ADD  DEFAULT (NULL) FOR [slf_print_button]
GO
ALTER TABLE [dbo].[zzzzsys_access_form] ADD  DEFAULT (NULL) FOR [slf_data_mode]
GO
ALTER TABLE [dbo].[zzzzsys_access_php] ADD  DEFAULT (NULL) FOR [slp_zzzzsys_access_id]
GO
ALTER TABLE [dbo].[zzzzsys_access_php] ADD  DEFAULT (NULL) FOR [slp_zzzzsys_php_id]
GO
ALTER TABLE [dbo].[zzzzsys_access_report] ADD  DEFAULT (NULL) FOR [sre_zzzzsys_access_id]
GO
ALTER TABLE [dbo].[zzzzsys_access_report] ADD  DEFAULT (NULL) FOR [sre_zzzzsys_report_id]
GO
ALTER TABLE [dbo].[zzzzsys_browse] ADD  DEFAULT (N'') FOR [zzzzsys_browse_id]
GO
ALTER TABLE [dbo].[zzzzsys_browse] ADD  DEFAULT (NULL) FOR [sbr_zzzzsys_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_browse] ADD  DEFAULT (NULL) FOR [sbr_title]
GO
ALTER TABLE [dbo].[zzzzsys_browse] ADD  DEFAULT (NULL) FOR [sbr_display]
GO
ALTER TABLE [dbo].[zzzzsys_browse] ADD  DEFAULT (NULL) FOR [sbr_align]
GO
ALTER TABLE [dbo].[zzzzsys_browse] ADD  DEFAULT (NULL) FOR [sbr_format]
GO
ALTER TABLE [dbo].[zzzzsys_browse] ADD  DEFAULT (NULL) FOR [sbr_order]
GO
ALTER TABLE [dbo].[zzzzsys_browse] ADD  DEFAULT (NULL) FOR [sbr_width]
GO
ALTER TABLE [dbo].[zzzzsys_cloner] ADD  DEFAULT (NULL) FOR [clo_form_source]
GO
ALTER TABLE [dbo].[zzzzsys_cloner] ADD  DEFAULT (NULL) FOR [clo_form_dest]
GO
ALTER TABLE [dbo].[zzzzsys_cloner] ADD  DEFAULT (NULL) FOR [clo_tabs]
GO
ALTER TABLE [dbo].[zzzzsys_cloner] ADD  DEFAULT (NULL) FOR [clo_dump]
GO
ALTER TABLE [dbo].[zzzzsys_cloner] ADD  DEFAULT (NULL) FOR [clo_objects]
GO
ALTER TABLE [dbo].[zzzzsys_cloner] ADD  DEFAULT (NULL) FOR [clo_subforms_include]
GO
ALTER TABLE [dbo].[zzzzsys_cloner] ADD  DEFAULT (NULL) FOR [clo_subforms]
GO
ALTER TABLE [dbo].[zzzzsys_cloner] ADD  DEFAULT (NULL) FOR [clo_iframe_forms_include]
GO
ALTER TABLE [dbo].[zzzzsys_cloner] ADD  DEFAULT (NULL) FOR [clo_iframe_forms]
GO
ALTER TABLE [dbo].[zzzzsys_cloner] ADD  DEFAULT (NULL) FOR [clo_new_pks]
GO
ALTER TABLE [dbo].[zzzzsys_cloner] ADD  DEFAULT (NULL) FOR [clo_notes]
GO
ALTER TABLE [dbo].[zzzzsys_code_snippet] ADD  DEFAULT (NULL) FOR [cot_code]
GO
ALTER TABLE [dbo].[zzzzsys_code_snippet] ADD  DEFAULT (NULL) FOR [cot_description]
GO
ALTER TABLE [dbo].[zzzzsys_code_snippet] ADD  DEFAULT (NULL) FOR [cot_url]
GO
ALTER TABLE [dbo].[zzzzsys_code_snippet] ADD  DEFAULT (NULL) FOR [cot_source_code]
GO
ALTER TABLE [dbo].[zzzzsys_code_snippet] ADD  DEFAULT (NULL) FOR [cot_language]
GO
ALTER TABLE [dbo].[zzzzsys_code_snippet] ADD  DEFAULT (NULL) FOR [cot_scope]
GO
ALTER TABLE [dbo].[zzzzsys_code_snippet] ADD  DEFAULT (getdate()) FOR [cot_updated_on]
GO
ALTER TABLE [dbo].[zzzzsys_debug] ADD  DEFAULT (NULL) FOR [deb_message]
GO
ALTER TABLE [dbo].[zzzzsys_debug] ADD  DEFAULT (NULL) FOR [deb_added]
GO
ALTER TABLE [dbo].[zzzzsys_event] ADD  DEFAULT (NULL) FOR [sev_zzzzsys_object_id]
GO
ALTER TABLE [dbo].[zzzzsys_event] ADD  DEFAULT (NULL) FOR [sev_event]
GO
ALTER TABLE [dbo].[zzzzsys_event] ADD  DEFAULT (NULL) FOR [sev_javascript]
GO
ALTER TABLE [dbo].[zzzzsys_file] ADD  DEFAULT (NULL) FOR [sfi_code]
GO
ALTER TABLE [dbo].[zzzzsys_file] ADD  DEFAULT (NULL) FOR [sfi_description]
GO
ALTER TABLE [dbo].[zzzzsys_file] ADD  DEFAULT (NULL) FOR [sfi_group]
GO
ALTER TABLE [dbo].[zzzzsys_file] ADD  DEFAULT (NULL) FOR [sfi_json]
GO
ALTER TABLE [dbo].[zzzzsys_file] ADD  DEFAULT (NULL) FOR [sfi_system]
GO
ALTER TABLE [dbo].[zzzzsys_form] ADD  DEFAULT (NULL) FOR [sfo_type]
GO
ALTER TABLE [dbo].[zzzzsys_form] ADD  DEFAULT (NULL) FOR [sfo_code]
GO
ALTER TABLE [dbo].[zzzzsys_form] ADD  DEFAULT (NULL) FOR [sfo_description]
GO
ALTER TABLE [dbo].[zzzzsys_form] ADD  DEFAULT (NULL) FOR [sfo_table]
GO
ALTER TABLE [dbo].[zzzzsys_form] ADD  DEFAULT (NULL) FOR [sfo_primary_key]
GO
ALTER TABLE [dbo].[zzzzsys_form] ADD  DEFAULT (NULL) FOR [sfo_browse_redirect_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_form] ADD  DEFAULT (NULL) FOR [sfo_browse_row_height]
GO
ALTER TABLE [dbo].[zzzzsys_form] ADD  DEFAULT (NULL) FOR [sfo_browse_rows_per_page]
GO
ALTER TABLE [dbo].[zzzzsys_form] ADD  DEFAULT (NULL) FOR [sfo_browse_sql]
GO
ALTER TABLE [dbo].[zzzzsys_form] ADD  DEFAULT (NULL) FOR [sfo_javascript]
GO
ALTER TABLE [dbo].[zzzzsys_format] ADD  DEFAULT (NULL) FOR [srm_type]
GO
ALTER TABLE [dbo].[zzzzsys_format] ADD  DEFAULT (NULL) FOR [srm_format]
GO
ALTER TABLE [dbo].[zzzzsys_format] ADD  DEFAULT (NULL) FOR [srm_currency]
GO
ALTER TABLE [dbo].[zzzzsys_info] ADD  DEFAULT (N'') FOR [zzzzsys_info_id]
GO
ALTER TABLE [dbo].[zzzzsys_info] ADD  DEFAULT (NULL) FOR [inf_code]
GO
ALTER TABLE [dbo].[zzzzsys_info] ADD  DEFAULT (NULL) FOR [inf_details]
GO
ALTER TABLE [dbo].[zzzzsys_note] ADD  DEFAULT (NULL) FOR [not_content]
GO
ALTER TABLE [dbo].[zzzzsys_note] ADD  DEFAULT (getdate()) FOR [not_updated_on]
GO
ALTER TABLE [dbo].[zzzzsys_note] ADD  DEFAULT (NULL) FOR [not_zzzzsys_note_category_id]
GO
ALTER TABLE [dbo].[zzzzsys_note_category] ADD  DEFAULT (NULL) FOR [noc_name]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_zzzzsys_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_table]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_type]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_id]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_label]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_zzzzsys_tab_id]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT ((0)) FOR [sob_all_order]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_top]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_left]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_width]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_height]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_cloneable]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_align]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_validate]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_all_access]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_calc_formula]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_calc_format]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_run_zzzzsys_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_run_filter]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_run_method]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_run_id]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_display_sql]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_select_multiple]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (N'0') FOR [sob_select_2]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_select_sql]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_lookup_code]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_lookup_description]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_lookup_description_width]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_lookup_autocomplete]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_lookup_zzzzsys_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_lookup_javascript]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_lookup_php]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_lookup_table]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_subform_zzzzsys_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_subform_foreign_key]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_subform_add]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_subform_delete]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_subform_type]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_subform_table]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT ((0)) FOR [sob_input_count]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_input_format]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_input_type]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_input_javascript]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_input_datalist]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_html_code]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_html_chart_type]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_html_javascript]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_html_title]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_html_vertical_label]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_html_horizontal_label]
GO
ALTER TABLE [dbo].[zzzzsys_object] ADD  DEFAULT (NULL) FOR [sob_image_zzzzsys_file_id]
GO
ALTER TABLE [dbo].[zzzzsys_php] ADD  DEFAULT (NULL) FOR [sph_code]
GO
ALTER TABLE [dbo].[zzzzsys_php] ADD  DEFAULT (NULL) FOR [sph_description]
GO
ALTER TABLE [dbo].[zzzzsys_php] ADD  DEFAULT (NULL) FOR [sph_group]
GO
ALTER TABLE [dbo].[zzzzsys_php] ADD  DEFAULT (NULL) FOR [sph_php]
GO
ALTER TABLE [dbo].[zzzzsys_php] ADD  DEFAULT (NULL) FOR [sph_run]
GO
ALTER TABLE [dbo].[zzzzsys_php] ADD  DEFAULT (NULL) FOR [sph_zzzzsys_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_php] ADD  DEFAULT (NULL) FOR [sph_system]
GO
ALTER TABLE [dbo].[zzzzsys_php] ADD  DEFAULT (N'0') FOR [sph_global]
GO
ALTER TABLE [dbo].[zzzzsys_php] ADD  DEFAULT (NULL) FOR [sph_hide]
GO
ALTER TABLE [dbo].[zzzzsys_report] ADD  DEFAULT (NULL) FOR [sre_code]
GO
ALTER TABLE [dbo].[zzzzsys_report] ADD  DEFAULT (NULL) FOR [sre_description]
GO
ALTER TABLE [dbo].[zzzzsys_report] ADD  DEFAULT (NULL) FOR [sre_group]
GO
ALTER TABLE [dbo].[zzzzsys_report] ADD  DEFAULT (NULL) FOR [sre_zzzzsys_php_id]
GO
ALTER TABLE [dbo].[zzzzsys_report] ADD  DEFAULT (NULL) FOR [sre_zzzzsys_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_report] ADD  DEFAULT (NULL) FOR [sre_layout]
GO
ALTER TABLE [dbo].[zzzzsys_select] ADD  DEFAULT (NULL) FOR [sse_description]
GO
ALTER TABLE [dbo].[zzzzsys_select] ADD  DEFAULT (NULL) FOR [sse_json]
GO
ALTER TABLE [dbo].[zzzzsys_select] ADD  DEFAULT (NULL) FOR [sse_sql]
GO
ALTER TABLE [dbo].[zzzzsys_select] ADD  DEFAULT (NULL) FOR [sse_edit]
GO
ALTER TABLE [dbo].[zzzzsys_select] ADD  DEFAULT (NULL) FOR [sse_system]
GO
ALTER TABLE [dbo].[zzzzsys_select_clause] ADD  DEFAULT (NULL) FOR [ssc_zzzzsys_select_id]
GO
ALTER TABLE [dbo].[zzzzsys_select_clause] ADD  DEFAULT (NULL) FOR [ssc_type]
GO
ALTER TABLE [dbo].[zzzzsys_select_clause] ADD  DEFAULT (NULL) FOR [ssc_field]
GO
ALTER TABLE [dbo].[zzzzsys_select_clause] ADD  DEFAULT (NULL) FOR [ssc_clause]
GO
ALTER TABLE [dbo].[zzzzsys_select_clause] ADD  DEFAULT (NULL) FOR [ssc_sort]
GO
ALTER TABLE [dbo].[zzzzsys_select_clause] ADD  DEFAULT (NULL) FOR [ssc_order]
GO
ALTER TABLE [dbo].[zzzzsys_session] ADD  DEFAULT (N'') FOR [zzzzsys_session_id]
GO
ALTER TABLE [dbo].[zzzzsys_session] ADD  DEFAULT (NULL) FOR [sss_access]
GO
ALTER TABLE [dbo].[zzzzsys_session] ADD  DEFAULT (NULL) FOR [sss_hashcookies]
GO
ALTER TABLE [dbo].[zzzzsys_session] ADD  DEFAULT (NULL) FOR [sss_time]
GO
ALTER TABLE [dbo].[zzzzsys_session] ADD  DEFAULT (getdate()) FOR [sss_login_time]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (N'') FOR [zzzzsys_setup_id]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_time_out_minutes]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_zzzzsys_timezone_id]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_language]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_languages_included]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_smtp_username]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_smtp_password]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_smtp_host]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_smtp_from_address]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_smtp_from_name]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_smtp_port]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_smtp_use_authentication]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_smtp_use_ssl]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_header]
GO
ALTER TABLE [dbo].[zzzzsys_setup] ADD  DEFAULT (NULL) FOR [set_denied]
GO
ALTER TABLE [dbo].[zzzzsys_tab] ADD  DEFAULT (NULL) FOR [syt_zzzzsys_form_id]
GO
ALTER TABLE [dbo].[zzzzsys_tab] ADD  DEFAULT (NULL) FOR [syt_title]
GO
ALTER TABLE [dbo].[zzzzsys_tab] ADD  DEFAULT (NULL) FOR [syt_order]
GO
ALTER TABLE [dbo].[zzzzsys_tab] ADD  DEFAULT (NULL) FOR [syt_help]
GO
ALTER TABLE [dbo].[zzzzsys_timezone] ADD  DEFAULT (NULL) FOR [stz_timezone]
GO
ALTER TABLE [dbo].[zzzzsys_translate] ADD  DEFAULT (NULL) FOR [trl_language]
GO
ALTER TABLE [dbo].[zzzzsys_translate] ADD  DEFAULT (NULL) FOR [trl_english]
GO
ALTER TABLE [dbo].[zzzzsys_translate] ADD  DEFAULT (NULL) FOR [trl_translation]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (N'') FOR [zzzzsys_user_id]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_zzzzsys_access_id]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_language]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_name]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_code]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_position]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_department]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_team]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_email]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_additional1]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_additional2]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_login_name]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_login_password]
GO
ALTER TABLE [dbo].[zzzzsys_user] ADD  DEFAULT (NULL) FOR [sus_expires_on]
GO
