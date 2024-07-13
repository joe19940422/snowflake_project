
use schema employees.public

create stage my_stage_s3
    url = 's3://feiawstest/data/'
    credentials = (
        aws_key_id = 'AKIAQQHIR4BTHKBI7JMR'
        aws_secret_key = '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'
    );

list @my_stage_s3

copy into table from @my_stage_S3/

show stages;