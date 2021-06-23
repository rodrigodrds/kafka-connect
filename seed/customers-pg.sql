create table "CUSTOMERS" (
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        email VARCHAR(50),
        gender VARCHAR(50),
	club_status VARCHAR(8),
        comments VARCHAR(90),
        create_ts timestamp DEFAULT CURRENT_TIMESTAMP ,
        update_ts timestamp DEFAULT CURRENT_TIMESTAMP
);


-- -- Courtesy of https://techblog.covermymeds.com/databases/on-update-timestamps-mysql-vs-postgres/
-- CREATE FUNCTION update_updated_at_column() RETURNS trigger
--     LANGUAGE plpgsql
--     AS $$
--   BEGIN
--     NEW.update_ts = NOW();
--     RETURN NEW;
--   END;
-- $$;

-- CREATE TRIGGER t1_updated_at_modtime BEFORE UPDATE ON CUSTOMERS FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();

insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Rica', 'Blaisdell', 'rblaisdell0@rambler.ru', 'Female', 'bronze', 'Universal optimal hierarchy');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Ruthie', 'Brockherst', 'rbrockherst1@ow.ly', 'Female', 'platinum', 'Reverse-engineered tangible interface');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Mariejeanne', 'Cocci', 'mcocci2@techcrunch.com', 'Female', 'bronze', 'Multi-tiered bandwidth-monitored capability');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Hashim', 'Rumke', 'hrumke3@sohu.com', 'Male', 'platinum', 'Self-enabling 24/7 firmware');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Hansiain', 'Coda', 'hcoda4@senate.gov', 'Male', 'platinum', 'Centralized full-range approach');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Robinet', 'Leheude', 'rleheude5@reddit.com', 'Female', 'platinum', 'Virtual upward-trending definition');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Fay', 'Huc', 'fhuc6@quantcast.com', 'Female', 'bronze', 'Operative composite capacity');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Patti', 'Rosten', 'prosten7@ihg.com', 'Female', 'silver', 'Integrated bandwidth-monitored instruction set');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Even', 'Tinham', 'etinham8@facebook.com', 'Male', 'silver', 'Virtual full-range info-mediaries');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Brena', 'Tollerton', 'btollerton9@furl.net', 'Female', 'silver', 'Diverse tangible methodology');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Alexandro', 'Peeke-Vout', 'apeekevouta@freewebs.com', 'Male', 'gold', 'Ameliorated value-added orchestration');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Sheryl', 'Hackwell', 'shackwellb@paginegialle.it', 'Female', 'gold', 'Self-enabling global parallelism');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Laney', 'Toopin', 'ltoopinc@icio.us', 'Female', 'platinum', 'Phased coherent alliance');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Isabelita', 'Talboy', 'italboyd@imageshack.us', 'Female', 'gold', 'Cloned transitional synergy');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Rodrique', 'Silverton', 'rsilvertone@umn.edu', 'Male', 'gold', 'Re-engineered static application');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Clair', 'Vardy', 'cvardyf@reverbnation.com', 'Male', 'bronze', 'Expanded bottom-line Graphical User Interface');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Brianna', 'Paradise', 'bparadiseg@nifty.com', 'Female', 'bronze', 'Open-source global toolset');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Waldon', 'Keddey', 'wkeddeyh@weather.com', 'Male', 'gold', 'Business-focused multi-state functionalities');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Josiah', 'Brockett', 'jbrocketti@com.com', 'Male', 'gold', 'Realigned didactic info-mediaries');
insert into "CUSTOMERS" (first_name, last_name, email, gender, club_status, comments) values ('Anselma', 'Rook', 'arookj@europa.eu', 'Female', 'gold', 'Cross-group 24/7 application');
