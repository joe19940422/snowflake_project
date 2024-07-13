
use schema employees.public

create stage my_stage_s3
    url = 's3://feiawstest/data/'
    credentials = (
        aws_key_id = '**'
        aws_secret_key = '**'
    );

list @my_stage_s3

copy into table from @my_stage_S3/

show stages;