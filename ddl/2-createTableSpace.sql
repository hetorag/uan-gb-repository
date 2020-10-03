/**
  Precondition: The specified folder as a parameter must exist.
  Example: 'K:\PostgreSQL124\data\pg_uan_rmdbs_workshoplive_ts'
 */
CREATE TABLESPACE uan_rmdbs_workshoplive_ts
  OWNER postgres
  LOCATION 'C:\opt\table_space\uan_rmdbs_workshoplive_ts';

ALTER TABLESPACE uan_rmdbs_workshoplive_ts
  OWNER TO universitydbuserlive;