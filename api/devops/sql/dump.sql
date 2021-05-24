CREATE EXTENSION "uuid-ossp";

CREATE EXTENSION "pgcrypto";

SET client_encoding = 'UTF8';

SET TIMEZONE TO 'UTC';

CREATE FUNCTION public.trigger_set_timestamp ()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;

CREATE SCHEMA users;

CREATE TABLE users.tbl_users (
    id bigint GENERATED ALWAYS AS IDENTITY NOT NULL
    , email character varying(200) NOT NULL
    , passwd text NOT NULL
    , created_at timestamp with time zone DEFAULT now() NOT NULL
    , pwd_updated_at timestamp with time zone DEFAULT now() NOT NULL
    , updated_at timestamp with time zone
    , disabled_at timestamp with time zone
    , enabled boolean DEFAULT TRUE NOT NULL
    , name character varying(255)
    , token character varying(255)
    , reset_token character varying(255)
    , identifier uuid DEFAULT public.uuid_generate_v4 () NOT NULL
);

INSERT INTO users.tbl_users (email, passwd, name) VALUES (
    'admin@jaspion-tests.com',
    crypt('admin180', gen_salt('bf',8)),
    'Administrator Admin Master'
    );


