-- CREATING DATABASE
create database uzbekistan_regions;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- CREATING TABLE REGIONS
drop table if exists regions cascade;
create table if not exists regions(
    region_id varchar DEFAULT uuid_generate_v4() primary key,
    region_name varchar(64) not null unique,
    region_created_at timestamp with time zone default current_timestamp
);

-- CREATING TABLE districts
drop table if exists districts cascade;
create table if not exists districts(
    district_id varchar DEFAULT uuid_generate_v4() primary key,
    district_name varchar(64) not null unique,
    region_id varchar not null references regions(region_id),
    district_created_at timestamp with time zone default current_timestamp
);