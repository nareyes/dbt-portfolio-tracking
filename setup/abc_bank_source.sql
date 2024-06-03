use role data_engineer;

-- create schema
create or replace schema nreyes.portfolio_tracking_src;


-- create abc bank source data table
create or replace table nreyes.portfolio_tracking_src.abc_bank_position (
     account_id	    text,
     symbol	        text,
     description	text,
     exchange	    text,
     report_date	date,
     quantity	    number(38,0),
     cost_base	    number(38,5),
     position_value	number(38,5),
     currency	    text
);


-- create file format object
create file format nreyes.portfolio_tracking_src.abc_bank_csv_ff
    type = 'CSV'
        compression = 'AUTO'
        field_delimiter = ','
        record_delimiter = '\n'
        skip_header = 1
        field_optionally_enclosed_by = '\042'
        trim_space = FALSE
        error_on_column_count_mismatch = TRUE
        escape = 'NONE'
        escape_unenclosed_field = '\134'
        date_format = 'AUTO'
        timestamp_format = 'AUTO'
        null_if = ('\\N');


-- load data from csv using snowflake ui