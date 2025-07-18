--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: neon_auth; Type: SCHEMA; Schema: -; Owner: neondb_owner
--

CREATE SCHEMA neon_auth;


ALTER SCHEMA neon_auth OWNER TO neondb_owner;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO neondb_owner;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO neondb_owner;

--
-- Name: ch_favorites; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.ch_favorites (
    id uuid NOT NULL,
    user_id bigint NOT NULL,
    favorite_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ch_favorites OWNER TO neondb_owner;

--
-- Name: ch_messages; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.ch_messages (
    id uuid NOT NULL,
    from_id bigint NOT NULL,
    to_id bigint NOT NULL,
    body character varying(5000),
    attachment character varying(255),
    seen boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ch_messages OWNER TO neondb_owner;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO neondb_owner;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO neondb_owner;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: feedback; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.feedback (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    subject character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.feedback OWNER TO neondb_owner;

--
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_id_seq OWNER TO neondb_owner;

--
-- Name: feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.feedback_id_seq OWNED BY public.feedback.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO neondb_owner;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO neondb_owner;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO neondb_owner;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    from_user_id bigint NOT NULL,
    to_user_id bigint NOT NULL,
    order_id bigint,
    message text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.messages OWNER TO neondb_owner;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO neondb_owner;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO neondb_owner;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO neondb_owner;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    data json,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notifications OWNER TO neondb_owner;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO neondb_owner;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    partner_id bigint NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    duration integer NOT NULL,
    total_price numeric(10,2) NOT NULL,
    status character varying(255) DEFAULT 'waiting'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    pickup_address character varying(255),
    contact_number character varying(255),
    pickup_time character varying(255),
    notes text,
    return_information text,
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY ((ARRAY['waiting'::character varying, 'ready'::character varying, 'rented'::character varying, 'return_now'::character varying, 'finished'::character varying, 'canceled'::character varying])::text[])))
);


ALTER TABLE public.orders OWNER TO neondb_owner;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO neondb_owner;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO neondb_owner;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO neondb_owner;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO neondb_owner;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    partner_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    storage character varying(255) NOT NULL,
    color character varying(255) NOT NULL,
    rent_price numeric(10,2) NOT NULL,
    max_rent_day integer NOT NULL,
    stock integer NOT NULL,
    image character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.products OWNER TO neondb_owner;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO neondb_owner;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO neondb_owner;

--
-- Name: users; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    role character varying(255) DEFAULT 'customer'::character varying NOT NULL,
    phone character varying(255),
    ktp_photo character varying(255),
    address character varying(255),
    is_verified boolean DEFAULT false NOT NULL,
    active_status boolean DEFAULT false NOT NULL,
    avatar character varying(255) DEFAULT 'avatar.png'::character varying NOT NULL,
    dark_mode boolean DEFAULT false NOT NULL,
    messenger_color character varying(255),
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['customer'::character varying, 'partner'::character varying, 'admin'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO neondb_owner;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO neondb_owner;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wire_actions; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.wire_actions (
    id bigint NOT NULL,
    actionable_id bigint NOT NULL,
    actionable_type character varying(255) NOT NULL,
    actor_id bigint NOT NULL,
    actor_type character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    data character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wire_actions OWNER TO neondb_owner;

--
-- Name: COLUMN wire_actions.data; Type: COMMENT; Schema: public; Owner: neondb_owner
--

COMMENT ON COLUMN public.wire_actions.data IS 'Some additional information about the action';


--
-- Name: wire_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.wire_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wire_actions_id_seq OWNER TO neondb_owner;

--
-- Name: wire_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.wire_actions_id_seq OWNED BY public.wire_actions.id;


--
-- Name: wire_attachments; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.wire_attachments (
    id bigint NOT NULL,
    attachable_type character varying(255) NOT NULL,
    attachable_id bigint NOT NULL,
    file_path character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    original_name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    mime_type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wire_attachments OWNER TO neondb_owner;

--
-- Name: wire_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.wire_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wire_attachments_id_seq OWNER TO neondb_owner;

--
-- Name: wire_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.wire_attachments_id_seq OWNED BY public.wire_attachments.id;


--
-- Name: wire_conversations; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.wire_conversations (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    disappearing_started_at timestamp(0) without time zone,
    disappearing_duration integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wire_conversations OWNER TO neondb_owner;

--
-- Name: COLUMN wire_conversations.type; Type: COMMENT; Schema: public; Owner: neondb_owner
--

COMMENT ON COLUMN public.wire_conversations.type IS 'Private is 1-1 , group or channel';


--
-- Name: wire_conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.wire_conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wire_conversations_id_seq OWNER TO neondb_owner;

--
-- Name: wire_conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.wire_conversations_id_seq OWNED BY public.wire_conversations.id;


--
-- Name: wire_groups; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.wire_groups (
    id bigint NOT NULL,
    conversation_id bigint NOT NULL,
    name character varying(255),
    description text,
    avatar_url character varying(255),
    type character varying(255) DEFAULT 'private'::character varying NOT NULL,
    allow_members_to_send_messages boolean DEFAULT true NOT NULL,
    allow_members_to_add_others boolean DEFAULT true NOT NULL,
    allow_members_to_edit_group_info boolean DEFAULT false NOT NULL,
    admins_must_approve_new_members boolean DEFAULT false NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wire_groups OWNER TO neondb_owner;

--
-- Name: COLUMN wire_groups.admins_must_approve_new_members; Type: COMMENT; Schema: public; Owner: neondb_owner
--

COMMENT ON COLUMN public.wire_groups.admins_must_approve_new_members IS 'when turned on, admins must approve anyone who wants to join group';


--
-- Name: wire_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.wire_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wire_groups_id_seq OWNER TO neondb_owner;

--
-- Name: wire_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.wire_groups_id_seq OWNED BY public.wire_groups.id;


--
-- Name: wire_messages; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.wire_messages (
    id bigint NOT NULL,
    conversation_id bigint NOT NULL,
    sendable_id bigint NOT NULL,
    sendable_type character varying(255) NOT NULL,
    reply_id bigint,
    body text,
    type character varying(255) DEFAULT 'text'::character varying NOT NULL,
    kept_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wire_messages OWNER TO neondb_owner;

--
-- Name: COLUMN wire_messages.kept_at; Type: COMMENT; Schema: public; Owner: neondb_owner
--

COMMENT ON COLUMN public.wire_messages.kept_at IS 'filled when a message is kept from disappearing';


--
-- Name: wire_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.wire_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wire_messages_id_seq OWNER TO neondb_owner;

--
-- Name: wire_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.wire_messages_id_seq OWNED BY public.wire_messages.id;


--
-- Name: wire_participants; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.wire_participants (
    id bigint NOT NULL,
    conversation_id bigint NOT NULL,
    role character varying(255) NOT NULL,
    participantable_id bigint NOT NULL,
    participantable_type character varying(255) NOT NULL,
    exited_at timestamp(0) without time zone,
    last_active_at timestamp(0) without time zone,
    conversation_cleared_at timestamp(0) without time zone,
    conversation_deleted_at timestamp(0) without time zone,
    conversation_read_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.wire_participants OWNER TO neondb_owner;

--
-- Name: wire_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.wire_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wire_participants_id_seq OWNER TO neondb_owner;

--
-- Name: wire_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.wire_participants_id_seq OWNED BY public.wire_participants.id;


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: feedback id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.feedback ALTER COLUMN id SET DEFAULT nextval('public.feedback_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wire_actions id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_actions ALTER COLUMN id SET DEFAULT nextval('public.wire_actions_id_seq'::regclass);


--
-- Name: wire_attachments id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_attachments ALTER COLUMN id SET DEFAULT nextval('public.wire_attachments_id_seq'::regclass);


--
-- Name: wire_conversations id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_conversations ALTER COLUMN id SET DEFAULT nextval('public.wire_conversations_id_seq'::regclass);


--
-- Name: wire_groups id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_groups ALTER COLUMN id SET DEFAULT nextval('public.wire_groups_id_seq'::regclass);


--
-- Name: wire_messages id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_messages ALTER COLUMN id SET DEFAULT nextval('public.wire_messages_id_seq'::regclass);


--
-- Name: wire_participants id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_participants ALTER COLUMN id SET DEFAULT nextval('public.wire_participants_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.cache (key, value, expiration) VALUES ('laravel_cache_customer1@example.com|127.0.0.1:timer', 'i:1750510242;', 1750510244);
INSERT INTO public.cache (key, value, expiration) VALUES ('laravel_cache_admin@example.com|125.166.3.166:timer', 'i:1750515114;', 1750515114);
INSERT INTO public.cache (key, value, expiration) VALUES ('laravel_cache_partner1@example.com|127.0.0.1:timer', 'i:1750518187;', 1750518188);
INSERT INTO public.cache (key, value, expiration) VALUES ('laravel_cache_custaplha@example.com|127.0.0.1:timer', 'i:1750570723;', 1750570724);
INSERT INTO public.cache (key, value, expiration) VALUES ('laravel_cache_custaplha@example.com|127.0.0.1', 'i:2;', 1750570726);
INSERT INTO public.cache (key, value, expiration) VALUES ('irent_cache_partner1@example.com|127.0.0.1:timer', 'i:1750958836;', 1750958837);
INSERT INTO public.cache (key, value, expiration) VALUES ('laravel_cache_admin1@example.com|140.213.170.125:timer', 'i:1751010617;', 1751010617);
INSERT INTO public.cache (key, value, expiration) VALUES ('laravel_cache_admin1@example.com|140.213.170.125', 'i:0;', 1751010617);


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- Data for Name: ch_favorites; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.ch_favorites (id, user_id, favorite_id, created_at, updated_at) VALUES ('78c2c22f-354e-45bc-83b9-bc4432f039bf', 3, 1, '2025-06-27 07:50:49', '2025-06-27 07:50:49');


--
-- Data for Name: ch_messages; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('085c8e4e-9f8d-461d-afc5-2538efdb2e08', 3, 1, 'hello', NULL, true, '2025-06-19 13:44:51', '2025-06-19 13:46:08');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('9c07824a-b94e-4784-b7de-f81c515b6229', 1, 3, 'hi', NULL, true, '2025-06-19 13:46:12', '2025-06-19 13:46:17');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('3d4a2a55-2fc8-4f18-bb83-713253e8b401', 1, 3, 'hello', NULL, true, '2025-06-20 09:30:05', '2025-06-20 09:30:28');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('1f0ae21d-4019-42ea-acdb-8ca0de614acb', 3, 1, 'ya', NULL, true, '2025-06-20 09:30:35', '2025-06-20 09:31:24');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('40f6e227-8656-4ca3-b1ea-5538ac169aee', 1, 3, '≡ƒÿ£', NULL, true, '2025-06-20 09:33:04', '2025-06-20 09:34:27');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('e5828361-7d77-4ba9-9c06-cad736980f9d', 1, 3, 'woi', NULL, true, '2025-06-20 09:38:14', '2025-06-20 09:38:23');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('055dbff4-8dc9-438b-87e9-8d9b27f9e431', 3, 1, 'iya', NULL, false, '2025-06-26 08:21:06', '2025-06-26 08:21:06');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('6cba9b2d-5507-49cb-ac54-a364a43419d0', 3, 1, 'nig', NULL, false, '2025-06-26 08:21:11', '2025-06-26 08:21:11');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('a5d56250-7fb9-47ad-b76d-6d87f64c0986', 3, 1, 'joo', NULL, false, '2025-06-26 08:21:30', '2025-06-26 08:21:30');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('40cfb2b9-1265-43b7-a8f9-dd8c71e07bb5', 10, 1, 'hai, apakah produk tersedia?', NULL, false, '2025-06-27 10:59:02', '2025-06-27 10:59:02');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('2e7414ab-40e5-4515-b774-dbe2cdd99b4c', 10, 11, 'halo iphone x nya masih bagus ya?', NULL, true, '2025-06-27 11:22:52', '2025-06-27 11:24:16');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('a6b85d17-71f3-4393-8e75-2e6766fdf188', 10, 11, 'kira kira minusnya apa ya', NULL, true, '2025-06-27 11:23:01', '2025-06-27 11:24:16');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('761b2aef-c02a-4363-8b6f-f741a1d73159', 13, 1, 'halo apakah barang tersedia dan bagus?', NULL, false, '2025-06-27 12:17:24', '2025-06-27 12:17:24');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('33382492-4526-4828-94c4-f1be5cc75cd3', 11, 10, 'barangnya masi baru kak', NULL, true, '2025-06-27 11:24:28', '2025-06-27 12:18:29');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('160d025d-d6f6-4339-ac67-5aaccf2f5ac6', 10, 14, 'barnagnya masih bagus kak?', NULL, true, '2025-06-27 12:30:58', '2025-06-27 12:35:59');
INSERT INTO public.ch_messages (id, from_id, to_id, body, attachment, seen, created_at, updated_at) VALUES ('76508d4c-7bb7-4f94-a54d-a03e17ae417a', 14, 10, 'halo produknya masih ada', NULL, true, '2025-06-27 12:36:29', '2025-06-27 12:45:41');


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (1, '2f65c943-47d7-4abb-a55d-c555b6960369', 'database', 'default', '{"uuid":"2f65c943-47d7-4abb-a55d-c555b6960369","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:5:\"tyson\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750164549,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 12:49:16');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (2, '49a9fb5b-055f-464e-adca-81dee79e3f31', 'database', 'default', '{"uuid":"49a9fb5b-055f-464e-adca-81dee79e3f31","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:5:\"tyson\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750164717,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 12:52:12');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (3, '0d806be5-5d82-40f8-9924-28f25729bedb', 'database', 'default', '{"uuid":"0d806be5-5d82-40f8-9924-28f25729bedb","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:5:\"tyson\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750164791,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 12:53:19');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (4, 'c45a6af9-faac-45ac-a2d9-91ef603eba1e', 'database', 'default', '{"uuid":"c45a6af9-faac-45ac-a2d9-91ef603eba1e","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:5:\"tyson\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750168306,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 13:52:02');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (5, '91fedb57-1808-4e2c-9419-54b5da5bb74b', 'database', 'default', '{"uuid":"91fedb57-1808-4e2c-9419-54b5da5bb74b","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:1:\"f\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750168365,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 13:52:50');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (6, '1b805a50-1910-4510-9a02-08425cc47979', 'database', 'default', '{"uuid":"1b805a50-1910-4510-9a02-08425cc47979","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"f1\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750168415,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 13:53:43');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (7, 'd7b14132-9ec1-4375-bb63-ab0cf8c1554f', 'database', 'default', '{"uuid":"d7b14132-9ec1-4375-bb63-ab0cf8c1554f","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750169123,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:05:34');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (8, 'a252cdd4-421d-414a-afe6-832c6fe7d4b0', 'database', 'default', '{"uuid":"a252cdd4-421d-414a-afe6-832c6fe7d4b0","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750169221,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:07:08');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (9, '9a64d43b-3e6d-473d-b4e9-152ad77d66ac', 'database', 'default', '{"uuid":"9a64d43b-3e6d-473d-b4e9-152ad77d66ac","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750169263,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:07:47');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (10, 'c67a87b6-9533-4d91-a4f5-395079297333', 'database', 'default', '{"uuid":"c67a87b6-9533-4d91-a4f5-395079297333","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750169390,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:09:55');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (11, '7f1baf65-ec63-4dcd-ae34-4911d034b440', 'database', 'default', '{"uuid":"7f1baf65-ec63-4dcd-ae34-4911d034b440","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750169526,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:12:13');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (12, '2f2f555f-52e6-48c1-9119-88677d61b5f3', 'database', 'default', '{"uuid":"2f2f555f-52e6-48c1-9119-88677d61b5f3","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750169639,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:14:10');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (13, 'ef8b3c3e-68af-41f8-af96-78ff0cc074b9', 'database', 'default', '{"uuid":"ef8b3c3e-68af-41f8-af96-78ff0cc074b9","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750169664,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:14:35');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (14, '3dde6446-e0fe-4f4c-a471-30698afbaca2', 'database', 'default', '{"uuid":"3dde6446-e0fe-4f4c-a471-30698afbaca2","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750169807,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:16:56');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (15, '12ab1755-5dcd-4493-bfc1-3808a47d6c88', 'database', 'default', '{"uuid":"12ab1755-5dcd-4493-bfc1-3808a47d6c88","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750169897,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:18:22');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (16, '22b9d8e5-7e73-4ad7-8b30-e919b30d7971', 'database', 'default', '{"uuid":"22b9d8e5-7e73-4ad7-8b30-e919b30d7971","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750169908,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:18:37');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (17, '5d5ecf6d-9e7d-4ffa-81ea-db552d8567e4', 'database', 'default', '{"uuid":"5d5ecf6d-9e7d-4ffa-81ea-db552d8567e4","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750170060,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:21:07');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (18, 'f4e14aee-4ba2-4ff7-9a7b-bb0e5be28209', 'database', 'default', '{"uuid":"f4e14aee-4ba2-4ff7-9a7b-bb0e5be28209","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750170080,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:21:30');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (19, 'ef184031-833c-4b79-9177-824996c4337f', 'database', 'default', '{"uuid":"ef184031-833c-4b79-9177-824996c4337f","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750170247,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:24:19');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (20, 'b940f086-654b-4fb5-8389-cc3eefa1101a', 'database', 'default', '{"uuid":"b940f086-654b-4fb5-8389-cc3eefa1101a","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750170263,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:24:28');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (21, '8bc04ab2-15af-4afc-9030-4ed5dc9bfefb', 'database', 'default', '{"uuid":"8bc04ab2-15af-4afc-9030-4ed5dc9bfefb","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750170369,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:26:14');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (22, '0834194d-2738-47a8-8269-e9b5b98051c5', 'database', 'default', '{"uuid":"0834194d-2738-47a8-8269-e9b5b98051c5","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750170382,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:26:29');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (23, 'e0520247-bdec-4267-a3dc-86e23c811d4a', 'database', 'default', '{"uuid":"e0520247-bdec-4267-a3dc-86e23c811d4a","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:1:\"u\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750170437,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:27:27');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (24, '5e0d7760-01ff-43f5-a473-27f83eb9fda4', 'database', 'default', '{"uuid":"5e0d7760-01ff-43f5-a473-27f83eb9fda4","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:1:\"1\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750170693,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:31:44');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (25, '8e246714-b03a-4d8a-a433-c16496d3746e', 'database', 'default', '{"uuid":"8e246714-b03a-4d8a-a433-c16496d3746e","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:1:\"2\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750170700,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:31:53');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (26, 'ac412354-0b1d-4ae4-b94a-2f1168bb532d', 'database', 'default', '{"uuid":"ac412354-0b1d-4ae4-b94a-2f1168bb532d","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750171303,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:41:51');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (27, 'cafb2198-3a0b-47b7-8c8c-34c99c9d45e8', 'database', 'default', '{"uuid":"cafb2198-3a0b-47b7-8c8c-34c99c9d45e8","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750172127,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:55:32');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (28, '3b10eb62-f0a8-4661-a868-9d73e861d7e8', 'database', 'default', '{"uuid":"3b10eb62-f0a8-4661-a868-9d73e861d7e8","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750172165,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 14:56:19');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (29, '2c552669-e6b7-48ef-973e-4b28add0b832', 'database', 'default', '{"uuid":"2c552669-e6b7-48ef-973e-4b28add0b832","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750172418,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:00:28');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (30, '4db0c795-1659-4067-ae78-ee685fff3658', 'database', 'default', '{"uuid":"4db0c795-1659-4067-ae78-ee685fff3658","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750172429,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:00:43');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (31, 'f6a1e219-233f-4176-9325-7dfbf3c1d096', 'database', 'default', '{"uuid":"f6a1e219-233f-4176-9325-7dfbf3c1d096","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750172495,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:01:47');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (32, '14899c2f-342c-42ce-bb2e-fcba420b12a4', 'database', 'default', '{"uuid":"14899c2f-342c-42ce-bb2e-fcba420b12a4","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750172507,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:01:55');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (33, '9122403e-268b-4369-9a5f-c00294e55c64', 'database', 'default', '{"uuid":"9122403e-268b-4369-9a5f-c00294e55c64","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750172587,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:03:13');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (34, 'a448a62d-99dd-48b6-a916-cb94e79063ef', 'database', 'default', '{"uuid":"a448a62d-99dd-48b6-a916-cb94e79063ef","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750172598,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:03:23');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (35, '119a6262-5ae8-4417-8495-a8ca4c5ab608', 'database', 'default', '{"uuid":"119a6262-5ae8-4417-8495-a8ca4c5ab608","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750173128,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:12:18');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (36, '0ecc6efb-6bd2-4a2b-911f-be88ac3b17f7', 'database', 'default', '{"uuid":"0ecc6efb-6bd2-4a2b-911f-be88ac3b17f7","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750173494,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:18:26');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (37, '408bed4b-9408-40e6-a9a6-5300f694dbe2', 'database', 'default', '{"uuid":"408bed4b-9408-40e6-a9a6-5300f694dbe2","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750173511,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:18:38');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (38, 'e9deeed0-289a-4d43-acf2-3b879ad1dc71', 'database', 'default', '{"uuid":"e9deeed0-289a-4d43-acf2-3b879ad1dc71","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750173849,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:24:20');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (39, '1eb2ee4e-0c24-4a51-8767-c92d96367b88', 'database', 'default', '{"uuid":"1eb2ee4e-0c24-4a51-8767-c92d96367b88","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750173858,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:24:31');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (40, 'beb0736b-be28-433c-96e6-34890b3a66ff', 'database', 'default', '{"uuid":"beb0736b-be28-433c-96e6-34890b3a66ff","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750173921,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:25:28');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (41, 'bb2edc95-4ca7-42c2-833d-e290a7db66ed', 'database', 'default', '{"uuid":"bb2edc95-4ca7-42c2-833d-e290a7db66ed","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750173974,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:26:20');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (42, 'fc54bfd9-d20a-4ca2-9ec5-5724e11e913f', 'database', 'default', '{"uuid":"fc54bfd9-d20a-4ca2-9ec5-5724e11e913f","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750174183,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:29:55');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (43, '40eb9a85-9823-4a73-a048-128f9736b97c', 'database', 'default', '{"uuid":"40eb9a85-9823-4a73-a048-128f9736b97c","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750174198,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:30:07');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (44, 'a2431032-0e2a-46f6-8c16-fc47181b6864', 'database', 'default', '{"uuid":"a2431032-0e2a-46f6-8c16-fc47181b6864","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:5:\"hello\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750174205,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:30:16');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (45, '1fdb472f-0286-4f9a-8c9a-b990155c2eb4', 'database', 'default', '{"uuid":"1fdb472f-0286-4f9a-8c9a-b990155c2eb4","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750174412,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:33:37');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (46, '186e8028-812f-4e1b-8b9e-98914f543a4e', 'database', 'default', '{"uuid":"186e8028-812f-4e1b-8b9e-98914f543a4e","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:5:\"heloo\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750174429,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:34:01');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (47, '7bf2ada7-f2ae-478d-9385-a408718005c6', 'database', 'default', '{"uuid":"7bf2ada7-f2ae-478d-9385-a408718005c6","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750174528,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:35:37');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (48, '8f457830-1d21-42cf-a8b6-58305b1faee8', 'database', 'default', '{"uuid":"8f457830-1d21-42cf-a8b6-58305b1faee8","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750174612,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:37:00');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (49, '0245ebf1-c703-4dbd-a579-7c534aa628d0', 'database', 'default', '{"uuid":"0245ebf1-c703-4dbd-a579-7c534aa628d0","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750174707,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:38:37');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (50, 'a9c67470-ef44-40fa-8969-7dd829cffc1c', 'database', 'default', '{"uuid":"a9c67470-ef44-40fa-8969-7dd829cffc1c","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"fd\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750174719,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:38:47');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (51, '1e9c1ead-5ff3-4b2b-8224-1d4ad4ada099', 'database', 'default', '{"uuid":"1e9c1ead-5ff3-4b2b-8224-1d4ad4ada099","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer Two\";s:7:\"message\";s:2:\"fe\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750174726,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-17 15:38:56');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (52, 'e7361e60-048b-4a6e-8926-327580d9b512', 'database', 'default', '{"uuid":"e7361e60-048b-4a6e-8926-327580d9b512","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":4:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hi\";s:8:\"senderId\";i:3;s:10:\"receiverId\";i:1;}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750243407,"delay":null}', 'Error: Typed property App\Events\Message::$partnerId must not be accessed before initialization in C:\Users\aazzk\Desktop\irent-web\app\Events\Message.php:23
Stack trace:
#0 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(80): App\Events\Message->broadcastOn()
#1 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Broadcasting\BroadcastEvent->handle(Object(Illuminate\Broadcasting\BroadcastManager))
#2 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#3 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#4 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#5 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#6 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Bus\Dispatcher.php(132): Illuminate\Container\Container->call(Array)
#7 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Pipeline\Pipeline.php(169): Illuminate\Bus\Dispatcher->Illuminate\Bus\{closure}(Object(Illuminate\Broadcasting\BroadcastEvent))
#8 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Pipeline\Pipeline.php(126): Illuminate\Pipeline\Pipeline->Illuminate\Pipeline\{closure}(Object(Illuminate\Broadcasting\BroadcastEvent))
#9 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Bus\Dispatcher.php(136): Illuminate\Pipeline\Pipeline->then(Object(Closure))
#10 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(125): Illuminate\Bus\Dispatcher->dispatchNow(Object(Illuminate\Broadcasting\BroadcastEvent), false)
#11 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Pipeline\Pipeline.php(169): Illuminate\Queue\CallQueuedHandler->Illuminate\Queue\{closure}(Object(Illuminate\Broadcasting\BroadcastEvent))
#12 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Pipeline\Pipeline.php(126): Illuminate\Pipeline\Pipeline->Illuminate\Pipeline\{closure}(Object(Illuminate\Broadcasting\BroadcastEvent))
#13 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(120): Illuminate\Pipeline\Pipeline->then(Object(Closure))
#14 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#15 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#16 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(444): Illuminate\Queue\Jobs\Job->fire()
#17 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(394): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#18 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(180): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#19 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->daemon(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#20 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#21 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#22 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#23 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#24 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#25 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#26 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#27 C:\Users\aazzk\Desktop\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#28 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#29 C:\Users\aazzk\Desktop\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#30 C:\Users\aazzk\Desktop\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#31 C:\Users\aazzk\Desktop\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#32 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#33 C:\Users\aazzk\Desktop\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#34 C:\Users\aazzk\Desktop\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#35 {main}', '2025-06-18 10:43:34');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (53, '39d12644-919c-48b5-b7f4-b6720290db28', 'database', 'default', '{"uuid":"39d12644-919c-48b5-b7f4-b6720290db28","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hi\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750250454,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-18 12:41:07');
INSERT INTO public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) VALUES (54, '41226817-cecd-4dfe-aeb5-e51022c27d60', 'database', 'default', '{"uuid":"41226817-cecd-4dfe-aeb5-e51022c27d60","displayName":"App\\Events\\Message","job":"Illuminate\\Queue\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\Broadcasting\\BroadcastEvent","command":"O:38:\"Illuminate\\Broadcasting\\BroadcastEvent\":14:{s:5:\"event\";O:18:\"App\\Events\\Message\":2:{s:8:\"username\";s:12:\"Customer One\";s:7:\"message\";s:2:\"hg\";}s:5:\"tries\";N;s:7:\"timeout\";N;s:7:\"backoff\";N;s:13:\"maxExceptions\";N;s:10:\"connection\";N;s:5:\"queue\";N;s:5:\"delay\";N;s:11:\"afterCommit\";N;s:10:\"middleware\";a:0:{}s:7:\"chained\";a:0:{}s:15:\"chainConnection\";N;s:10:\"chainQueue\";N;s:19:\"chainCatchCallbacks\";N;}"},"createdAt":1750256194,"delay":null}', 'Error: The script tried to call a method on an incomplete object. Please ensure that the class definition "App\Events\Message" of the object you are trying to operate on was loaded _before_ unserialize() gets called or provide an autoloader to load the class definition in D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php:181
Stack trace:
#0 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Broadcasting\BroadcastEvent.php(181): method_exists(Object(__PHP_Incomplete_Class), ''middleware'')
#1 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(119): Illuminate\Broadcasting\BroadcastEvent->middleware()
#2 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\CallQueuedHandler.php(68): Illuminate\Queue\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Broadcasting\BroadcastEvent))
#3 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Jobs\Job.php(102): Illuminate\Queue\CallQueuedHandler->call(Object(Illuminate\Queue\Jobs\DatabaseJob), Array)
#4 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(441): Illuminate\Queue\Jobs\Job->fire()
#5 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(391): Illuminate\Queue\Worker->process(''database'', Object(Illuminate\Queue\Jobs\DatabaseJob), Object(Illuminate\Queue\WorkerOptions))
#6 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Worker.php(334): Illuminate\Queue\Worker->runJob(Object(Illuminate\Queue\Jobs\DatabaseJob), ''database'', Object(Illuminate\Queue\WorkerOptions))
#7 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(148): Illuminate\Queue\Worker->runNextJob(''database'', ''default'', Object(Illuminate\Queue\WorkerOptions))
#8 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Queue\Console\WorkCommand.php(131): Illuminate\Queue\Console\WorkCommand->runWorker(''database'', ''default'')
#9 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(36): Illuminate\Queue\Console\WorkCommand->handle()
#10 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Util.php(43): Illuminate\Container\BoundMethod::Illuminate\Container\{closure}()
#11 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(96): Illuminate\Container\Util::unwrapIfClosure(Object(Closure))
#12 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\BoundMethod.php(35): Illuminate\Container\BoundMethod::callBoundMethod(Object(Illuminate\Foundation\Application), Array, Object(Closure))
#13 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Container\Container.php(754): Illuminate\Container\BoundMethod::call(Object(Illuminate\Foundation\Application), Array, Array, NULL)
#14 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(211): Illuminate\Container\Container->call(Array)
#15 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Command\Command.php(318): Illuminate\Console\Command->execute(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#16 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Console\Command.php(180): Symfony\Component\Console\Command\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Illuminate\Console\OutputStyle))
#17 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(1092): Illuminate\Console\Command->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#18 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(341): Symfony\Component\Console\Application->doRunCommand(Object(Illuminate\Queue\Console\WorkCommand), Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#19 D:\Coding\GIT Repo\irent-web\vendor\symfony\console\Application.php(192): Symfony\Component\Console\Application->doRun(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#20 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Console\Kernel.php(197): Symfony\Component\Console\Application->run(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#21 D:\Coding\GIT Repo\irent-web\vendor\laravel\framework\src\Illuminate\Foundation\Application.php(1234): Illuminate\Foundation\Console\Kernel->handle(Object(Symfony\Component\Console\Input\ArgvInput), Object(Symfony\Component\Console\Output\ConsoleOutput))
#22 D:\Coding\GIT Repo\irent-web\artisan(16): Illuminate\Foundation\Application->handleCommand(Object(Symfony\Component\Console\Input\ArgvInput))
#23 {main}', '2025-06-18 14:16:48');


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (1, 3, 'chat', 'something wrong', '2025-06-20 00:55:15', '2025-06-20 00:55:15');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (2, 3, 'good', 'amazing', '2025-06-20 01:27:45', '2025-06-20 01:27:45');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (3, 3, 'a', 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', '2025-06-20 01:38:04', '2025-06-20 01:38:04');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (4, 3, 'g', 'a', '2025-06-20 08:21:37', '2025-06-20 08:21:37');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (5, 3, 'q', 'w', '2025-06-20 08:24:59', '2025-06-20 08:24:59');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (6, 3, 'a', 'a', '2025-06-20 08:33:30', '2025-06-20 08:33:30');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (7, 3, 'a', 'a', '2025-06-20 08:35:38', '2025-06-20 08:35:38');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (8, 1, 'p', 'a', '2025-06-20 08:42:52', '2025-06-20 08:42:52');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (9, 1, 'woi', 'website kampret saia kena tipu penjual', '2025-06-20 09:01:24', '2025-06-20 09:01:24');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (10, 3, 'a', 'a', '2025-06-21 11:56:03', '2025-06-21 11:56:03');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (11, 3, 'a', 'a', '2025-06-22 05:13:47', '2025-06-22 05:13:47');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (12, 11, 'bug banyak', 'maaf mas bugnya kebanyakan loadingnya lama', '2025-06-27 11:29:03', '2025-06-27 11:29:03');
INSERT INTO public.feedback (id, user_id, subject, content, created_at, updated_at) VALUES (13, 13, 'bug', 'banyak bug', '2025-06-27 12:20:30', '2025-06-27 12:20:30');


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.migrations (id, migration, batch) VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (4, '2025_06_07_023742_create_personal_access_tokens_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (5, '2025_06_07_024733_create_products_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (6, '2025_06_07_024743_create_orders_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (7, '2025_06_07_024750_create_messages_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (8, '2025_06_07_024756_create_notifications_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (9, '2025_06_07_024814_create_feedback_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (10, '2025_06_07_025244_add_fields_to_users_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (11, '2025_06_13_999999_recreate_products_table', 2);
INSERT INTO public.migrations (id, migration, batch) VALUES (12, '2025_06_17_000001_add_partner_info_to_orders_table', 3);
INSERT INTO public.migrations (id, migration, batch) VALUES (13, '2025_06_18_000001_add_return_information_to_orders_table', 4);
INSERT INTO public.migrations (id, migration, batch) VALUES (14, '2024_11_01_000001_create_wirechat_conversations_table', 5);
INSERT INTO public.migrations (id, migration, batch) VALUES (15, '2024_11_01_000002_create_wirechat_attachments_table', 5);
INSERT INTO public.migrations (id, migration, batch) VALUES (16, '2024_11_01_000003_create_wirechat_messages_table', 5);
INSERT INTO public.migrations (id, migration, batch) VALUES (17, '2024_11_01_000004_create_wirechat_participants_table', 5);
INSERT INTO public.migrations (id, migration, batch) VALUES (18, '2024_11_01_000006_create_wirechat_actions_table', 5);
INSERT INTO public.migrations (id, migration, batch) VALUES (19, '2024_11_01_000007_create_wirechat_groups_table', 5);
INSERT INTO public.migrations (id, migration, batch) VALUES (20, '2025_06_18_999999_add_active_status_to_users', 6);
INSERT INTO public.migrations (id, migration, batch) VALUES (21, '2025_06_18_999999_add_avatar_to_users', 6);
INSERT INTO public.migrations (id, migration, batch) VALUES (22, '2025_06_18_999999_add_dark_mode_to_users', 6);
INSERT INTO public.migrations (id, migration, batch) VALUES (23, '2025_06_18_999999_add_messenger_color_to_users', 6);
INSERT INTO public.migrations (id, migration, batch) VALUES (24, '2025_06_18_999999_create_chatify_favorites_table', 6);
INSERT INTO public.migrations (id, migration, batch) VALUES (25, '2025_06_18_999999_create_chatify_messages_table', 6);
INSERT INTO public.migrations (id, migration, batch) VALUES (26, '2025_06_19_000001_add_indexes_to_orders_table', 7);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (129, 14, 'order_status', '{"message":"You have a new order for iPhone X","details":"Order ID: 78. Please confirm the order.","order_id":78}', NULL, '2025-06-27 12:47:52', '2025-06-27 12:47:52');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (130, 10, 'order_status', '{"message":"Your order for iPhone X has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":78}', NULL, '2025-06-27 12:47:53', '2025-06-27 12:47:53');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (135, 10, 'order_status', '{"message":"Rental period for iPhone X has ended.","details":"Please return the item to the partner as soon as possible.","order_id":78}', NULL, '2025-06-27 12:53:51', '2025-06-27 12:53:51');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (136, 14, 'order_status', '{"message":"Rental period for iPhone X has ended.","details":"Customer: customer demo should return the item soon.","order_id":78}', NULL, '2025-06-27 12:53:52', '2025-06-27 12:53:52');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (33, 2, 'order_status', '{"message":"You have a new order for iPhone 13 Pro Max 128GB Gold","details":"Order ID: 60. Please confirm the order.","order_id":60}', NULL, '2025-06-21 14:06:41', '2025-06-21 14:06:41');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (57, 9, 'order_status', '{"message":"Your rental for iPhone 15 Pro Black Titanium 128GB has finished.","details":"Thank you for your order!","order_id":64}', '2025-06-22 05:36:39', '2025-06-22 05:35:44', '2025-06-22 05:36:39');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (43, 3, 'order_status', '{"message":"Your order for iPhone 8 64GB Gold has been confirmed.","details":"The item is now ready for pickup. Please contact the partner.","order_id":63}', '2025-06-25 14:00:45', '2025-06-21 15:27:05', '2025-06-25 14:00:45');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (35, 3, 'order_status', '{"message":"Your order for iPhone 11  128GB White has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":61}', '2025-06-21 15:14:26', '2025-06-21 14:36:29', '2025-06-21 15:14:26');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (36, 3, 'order_status', '{"message":"Your order for iPhone 11  128GB White has been confirmed.","details":"The item is now ready for pickup. Please contact the partner.","order_id":61}', '2025-06-21 15:14:26', '2025-06-21 14:39:33', '2025-06-21 15:14:26');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (38, 3, 'order_status', '{"message":"Your order for iPhone 8 64GB Gold has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":62}', '2025-06-21 15:14:26', '2025-06-21 14:59:39', '2025-06-21 15:14:26');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (39, 3, 'order_status', '{"message":"Your order for iPhone 8 64GB Gold has been confirmed.","details":"The item is now ready for pickup. Please contact the partner.","order_id":62}', '2025-06-21 15:14:26', '2025-06-21 15:09:01', '2025-06-21 15:14:26');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (42, 3, 'order_status', '{"message":"Your order for iPhone 8 64GB Gold has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":63}', '2025-06-21 15:14:26', '2025-06-21 15:13:41', '2025-06-21 15:14:26');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (54, 9, 'order_status', '{"message":"Your order for iPhone 15 Pro Black Titanium 128GB has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":64}', '2025-06-22 05:33:53', '2025-06-22 05:33:47', '2025-06-22 05:33:53');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (55, 9, 'order_status', '{"message":"Your order for iPhone 15 Pro Black Titanium 128GB has been confirmed.","details":"The item is now ready for pickup. Please contact the partner.","order_id":64}', '2025-06-22 05:34:24', '2025-06-22 05:34:10', '2025-06-22 05:34:24');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (60, 9, 'order_status', '{"message":"Your order for iPhone 12 Pro Max 256GB Blue has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":65}', '2025-06-22 05:41:43', '2025-06-22 05:39:15', '2025-06-22 05:41:43');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (61, 9, 'order_status', '{"message":"Your order for iPhone 12 Pro Max 256GB Blue has been confirmed.","details":"The item is now ready for pickup. Please contact the partner.","order_id":65}', '2025-06-22 05:41:43', '2025-06-22 05:40:15', '2025-06-22 05:41:43');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (63, 9, 'order_status', '{"message":"Rental period for iPhone 12 Pro Max 256GB Blue has ended.","details":"Please return the item to the partner as soon as possible.","order_id":65}', '2025-06-22 05:48:38', '2025-06-22 05:45:33', '2025-06-22 05:48:38');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (45, 3, 'order_status', '{"message":"Pickup information for iPhone 8 64GB Gold has been updated.","details":"The partner has updated the pickup details for your order.","order_id":63}', '2025-06-25 14:00:45', '2025-06-21 15:27:35', '2025-06-25 14:00:45');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (47, 3, 'order_status', '{"message":"Pickup information for iPhone 8 64GB Gold has been updated.","details":"The partner has updated the pickup details for your order.","order_id":63}', '2025-06-25 14:00:45', '2025-06-21 15:46:14', '2025-06-25 14:00:45');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (49, 3, 'order_status', '{"message":"Your rental for ipon has finished.","details":"Thank you for your order!","order_id":57}', '2025-06-25 14:00:45', '2025-06-22 05:27:45', '2025-06-25 14:00:45');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (131, 10, 'order_status', '{"message":"Your order for iPhone X has been confirmed.","details":"The item is now ready for pickup. Please contact the partner.","order_id":78}', NULL, '2025-06-27 12:52:49', '2025-06-27 12:52:49');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (132, 14, 'order_status', '{"message":"You confirmed order for iPhone X.","details":"Order is now ready for customer pickup. Customer: customer demo","order_id":78}', NULL, '2025-06-27 12:52:50', '2025-06-27 12:52:50');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (137, 10, 'order_status', '{"message":"Your rental for iPhone X has finished.","details":"Thank you for your order!","order_id":78}', NULL, '2025-06-27 12:54:31', '2025-06-27 12:54:31');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (138, 14, 'order_status', '{"message":"You completed order for iPhone X.","details":"Order has been successfully finished. Customer: customer demo","order_id":78}', NULL, '2025-06-27 12:54:32', '2025-06-27 12:54:32');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (65, 9, 'order_status', '{"message":"Your rental for iPhone 12 Pro Max 256GB Blue has finished.","details":"Thank you for your order!","order_id":65}', '2025-06-22 06:08:36', '2025-06-22 05:48:32', '2025-06-22 06:08:36');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (68, 9, 'order_status', '{"message":"Your order for iPhone 7 has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":66}', '2025-06-22 06:08:36', '2025-06-22 05:50:13', '2025-06-22 06:08:36');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (69, 9, 'order_status', '{"message":"Your order for iPhone 7 has been confirmed.","details":"The item is now ready for pickup. Please contact the partner.","order_id":66}', '2025-06-22 06:08:36', '2025-06-22 05:51:24', '2025-06-22 06:08:36');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (72, 9, 'order_status', '{"message":"Your order for iPhone 11  128GB White has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":67}', '2025-06-22 06:08:36', '2025-06-22 06:01:30', '2025-06-22 06:08:36');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (73, 9, 'order_status', '{"message":"Your order for iPhone 11  128GB White has been confirmed.","details":"The item is now ready for pickup. Please contact the partner.","order_id":67}', '2025-06-22 06:08:36', '2025-06-22 06:02:14', '2025-06-22 06:08:36');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (75, 9, 'order_status', '{"message":"Your rental for iPhone 11  128GB White has started.","details":"The rental period will end on 28 Jun 2025","order_id":67}', '2025-06-22 06:08:36', '2025-06-22 06:06:29', '2025-06-22 06:08:36');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (77, 9, 'order_status', '{"message":"Rental period for iPhone 11  128GB White has ended.","details":"Please return the item to the partner as soon as possible.","order_id":67}', '2025-06-22 06:08:36', '2025-06-22 06:07:34', '2025-06-22 06:08:36');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (79, 9, 'order_status', '{"message":"Your rental for iPhone 11  128GB White has finished.","details":"Thank you for your order!","order_id":67}', '2025-06-22 06:08:36', '2025-06-22 06:07:56', '2025-06-22 06:08:36');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (82, 3, 'order_status', '{"message":"Your order for iPhone 15 Pro Black Titanium 128GB has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":69}', '2025-06-25 14:00:45', '2025-06-25 14:00:25', '2025-06-25 14:00:45');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (83, 3, 'order_status', '{"message":"Your rental for iPhone 15 Pro Black Titanium 128GB has been completed.","details":"Thank you for using our service!","order_id":68}', NULL, '2025-06-26 16:23:31', '2025-06-26 16:23:31');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (84, 1, 'order_status', '{"message":"Order for iPhone 15 Pro Black Titanium 128GB has been completed.","details":"Customer: Customer One - order is now finished.","order_id":68}', NULL, '2025-06-26 16:23:32', '2025-06-26 16:23:32');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (85, 3, 'order_status', '{"message":"Your order for iPhone 15 Pro Black Titanium 128GB has been canceled.","details":"Please contact support if you have any questions.","order_id":68}', NULL, '2025-06-26 16:27:04', '2025-06-26 16:27:04');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (86, 1, 'order_status', '{"message":"Order for iPhone 15 Pro Black Titanium 128GB has been canceled.","details":"Customer: Customer One - order is now canceled.","order_id":68}', NULL, '2025-06-26 16:27:05', '2025-06-26 16:27:05');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (87, 3, 'order_status', '{"message":"Your order for iPhone 8 64GB Gold has been canceled.","details":"Please contact support if you have any questions.","order_id":62}', NULL, '2025-06-26 16:28:55', '2025-06-26 16:28:55');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (81, 1, 'order_status', '{"message":"You have a new order for iPhone 15 Pro Black Titanium 128GB","details":"Order ID: 69. Please confirm the order.","order_id":69}', NULL, '2025-06-25 14:00:25', '2025-06-25 14:00:25');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (51, 3, 'order_status', '{"message":"Your order for iPhone 8 64GB Gold has been canceled.","details":"The partner has canceled this order. Please contact them for more information.","order_id":62}', '2025-06-25 14:00:45', '2025-06-22 05:28:19', '2025-06-25 14:00:45');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (88, 1, 'order_status', '{"message":"Order for iPhone 8 64GB Gold has been canceled.","details":"Customer: Customer One - order is now canceled.","order_id":62}', NULL, '2025-06-26 16:28:56', '2025-06-26 16:28:56');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (89, 1, 'order_status', '{"message":"You have a new order for iPhone 12 Pro Max 256GB Blue","details":"Order ID: 70. Please confirm the order.","order_id":70}', NULL, '2025-06-27 10:56:17', '2025-06-27 10:56:17');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (91, 1, 'order_status', '{"message":"You have a new order for iPhone 8 64GB Gold","details":"Order ID: 71. Please confirm the order.","order_id":71}', NULL, '2025-06-27 11:00:09', '2025-06-27 11:00:09');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (93, 2, 'order_status', '{"message":"You have a new order for iPhone 13 Pro Max 128GB Gold","details":"Order ID: 72. Please confirm the order.","order_id":72}', NULL, '2025-06-27 11:03:41', '2025-06-27 11:03:41');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (95, 1, 'order_status', '{"message":"You have a new order for iPhone 11  128GB White","details":"Order ID: 73. Please confirm the order.","order_id":73}', NULL, '2025-06-27 11:06:14', '2025-06-27 11:06:14');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (97, 1, 'order_status', '{"message":"You have a new order for iPhone 11  128GB White","details":"Order ID: 74. Please confirm the order.","order_id":74}', NULL, '2025-06-27 11:06:29', '2025-06-27 11:06:29');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (100, 2, 'order_status', '{"message":"Rental period for iPhone 13 Pro Max 128GB Gold has ended.","details":"Customer: customer demo should return the item soon.","order_id":72}', NULL, '2025-06-27 11:11:06', '2025-06-27 11:11:06');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (102, 1, 'order_status', '{"message":"Order for iPhone 11  128GB White has been completed.","details":"Customer: customer demo - order is now finished.","order_id":73}', NULL, '2025-06-27 11:11:25', '2025-06-27 11:11:25');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (104, 1, 'order_status', '{"message":"Order for iPhone 11  128GB White has been canceled.","details":"Customer: customer demo - order is now canceled.","order_id":74}', NULL, '2025-06-27 11:11:33', '2025-06-27 11:11:33');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (90, 10, 'order_status', '{"message":"Your order for iPhone 12 Pro Max 256GB Blue has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":70}', '2025-06-27 12:22:37', '2025-06-27 10:56:18', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (105, 11, 'order_status', '{"message":"You have a new order for iPhone X","details":"Order ID: 75. Please confirm the order.","order_id":75}', '2025-06-27 11:20:53', '2025-06-27 11:20:27', '2025-06-27 11:20:53');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (108, 11, 'order_status', '{"message":"You confirmed order for iPhone X.","details":"Order is now ready for customer pickup. Customer: customer demo","order_id":75}', NULL, '2025-06-27 11:25:50', '2025-06-27 11:25:50');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (110, 11, 'order_status', '{"message":"You marked iPhone X as picked up.","details":"Rental has started for customer: customer demo. Return due: 30 Jun 2025","order_id":75}', NULL, '2025-06-27 11:26:30', '2025-06-27 11:26:30');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (112, 11, 'order_status', '{"message":"Rental period for iPhone X has ended.","details":"Customer: customer demo should return the item soon.","order_id":75}', NULL, '2025-06-27 11:27:07', '2025-06-27 11:27:07');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (114, 11, 'order_status', '{"message":"You completed order for iPhone X.","details":"Order has been successfully finished. Customer: customer demo","order_id":75}', NULL, '2025-06-27 11:27:52', '2025-06-27 11:27:52');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (115, 1, 'order_status', '{"message":"You have a new order for iPhone 7","details":"Order ID: 76. Please confirm the order.","order_id":76}', NULL, '2025-06-27 12:17:54', '2025-06-27 12:17:54');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (116, 13, 'order_status', '{"message":"Your order for iPhone 7 has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":76}', NULL, '2025-06-27 12:17:55', '2025-06-27 12:17:55');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (92, 10, 'order_status', '{"message":"Your order for iPhone 8 64GB Gold has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":71}', '2025-06-27 12:22:37', '2025-06-27 11:00:10', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (94, 10, 'order_status', '{"message":"Your order for iPhone 13 Pro Max 128GB Gold has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":72}', '2025-06-27 12:22:37', '2025-06-27 11:03:42', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (96, 10, 'order_status', '{"message":"Your order for iPhone 11  128GB White has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":73}', '2025-06-27 12:22:37', '2025-06-27 11:06:14', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (98, 10, 'order_status', '{"message":"Your order for iPhone 11  128GB White has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":74}', '2025-06-27 12:22:37', '2025-06-27 11:06:29', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (99, 10, 'order_status', '{"message":"Rental period for iPhone 13 Pro Max 128GB Gold has ended.","details":"Please return the item to the partner as soon as possible.","order_id":72}', '2025-06-27 12:22:37', '2025-06-27 11:11:05', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (101, 10, 'order_status', '{"message":"Your rental for iPhone 11  128GB White has been completed.","details":"Thank you for using our service!","order_id":73}', '2025-06-27 12:22:37', '2025-06-27 11:11:25', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (103, 10, 'order_status', '{"message":"Your order for iPhone 11  128GB White has been canceled.","details":"Please contact support if you have any questions.","order_id":74}', '2025-06-27 12:22:37', '2025-06-27 11:11:32', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (106, 10, 'order_status', '{"message":"Your order for iPhone X has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":75}', '2025-06-27 12:22:37', '2025-06-27 11:20:27', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (107, 10, 'order_status', '{"message":"Your order for iPhone X has been confirmed.","details":"The item is now ready for pickup. Please contact the partner.","order_id":75}', '2025-06-27 12:22:37', '2025-06-27 11:25:49', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (109, 10, 'order_status', '{"message":"Your rental for iPhone X has started.","details":"The rental period will end on 30 Jun 2025","order_id":75}', '2025-06-27 12:22:37', '2025-06-27 11:26:29', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (111, 10, 'order_status', '{"message":"Rental period for iPhone X has ended.","details":"Please return the item to the partner as soon as possible.","order_id":75}', '2025-06-27 12:22:37', '2025-06-27 11:27:06', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (113, 10, 'order_status', '{"message":"Your rental for iPhone X has finished.","details":"Thank you for your order!","order_id":75}', '2025-06-27 12:22:37', '2025-06-27 11:27:52', '2025-06-27 12:22:37');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (118, 10, 'order_status', '{"message":"Your order for iPhone X has been placed.","details":"Your order is now waiting for confirmation from the partner.","order_id":77}', NULL, '2025-06-27 12:31:25', '2025-06-27 12:31:25');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (117, 14, 'order_status', '{"message":"You have a new order for iPhone X","details":"Order ID: 77. Please confirm the order.","order_id":77}', '2025-06-27 12:31:53', '2025-06-27 12:31:25', '2025-06-27 12:31:53');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (119, 10, 'order_status', '{"message":"Your order for iPhone X has been confirmed.","details":"The item is now ready for pickup. Please contact the partner.","order_id":77}', NULL, '2025-06-27 12:32:53', '2025-06-27 12:32:53');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (120, 14, 'order_status', '{"message":"You confirmed order for iPhone X.","details":"Order is now ready for customer pickup. Customer: customer demo","order_id":77}', NULL, '2025-06-27 12:32:53', '2025-06-27 12:32:53');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (121, 10, 'order_status', '{"message":"Your rental for iPhone X has started.","details":"The rental period will end on 30 Jun 2025","order_id":77}', NULL, '2025-06-27 12:33:18', '2025-06-27 12:33:18');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (122, 14, 'order_status', '{"message":"You marked iPhone X as picked up.","details":"Rental has started for customer: customer demo. Return due: 30 Jun 2025","order_id":77}', NULL, '2025-06-27 12:33:19', '2025-06-27 12:33:19');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (123, 10, 'order_status', '{"message":"Rental period for iPhone X has ended.","details":"Please return the item to the partner as soon as possible.","order_id":77}', NULL, '2025-06-27 12:33:46', '2025-06-27 12:33:46');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (124, 14, 'order_status', '{"message":"Rental period for iPhone X has ended.","details":"Customer: customer demo should return the item soon.","order_id":77}', NULL, '2025-06-27 12:33:46', '2025-06-27 12:33:46');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (125, 10, 'order_status', '{"message":"Your rental for iPhone X has finished.","details":"Thank you for your order!","order_id":77}', NULL, '2025-06-27 12:34:27', '2025-06-27 12:34:27');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (126, 14, 'order_status', '{"message":"You completed order for iPhone X.","details":"Order has been successfully finished. Customer: customer demo","order_id":77}', NULL, '2025-06-27 12:34:27', '2025-06-27 12:34:27');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (127, 10, 'order_status', '{"message":"Your order for iPhone X has been canceled.","details":"Please contact support if you have any questions.","order_id":77}', NULL, '2025-06-27 12:42:39', '2025-06-27 12:42:39');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (128, 14, 'order_status', '{"message":"Order for iPhone X has been canceled.","details":"Customer: customer demo - order is now canceled.","order_id":77}', NULL, '2025-06-27 12:42:40', '2025-06-27 12:42:40');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (133, 10, 'order_status', '{"message":"Your rental for iPhone X has started.","details":"The rental period will end on 02 Jul 2025","order_id":78}', NULL, '2025-06-27 12:53:18', '2025-06-27 12:53:18');
INSERT INTO public.notifications (id, user_id, type, data, read_at, created_at, updated_at) VALUES (134, 14, 'order_status', '{"message":"You marked iPhone X as picked up.","details":"Rental has started for customer: customer demo. Return due: 02 Jul 2025","order_id":78}', NULL, '2025-06-27 12:53:19', '2025-06-27 12:53:19');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (58, 3, 9, 2, '2025-06-21', '2025-06-26', 5, 189000.00, 'waiting', '2025-06-21 13:24:36', '2025-06-21 13:24:36', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (59, 3, 8, 1, '2025-06-21', '2025-06-25', 4, 65000.00, 'canceled', '2025-06-21 13:25:59', '2025-06-21 13:55:13', 'qqqqq', 'qqqq', 'qqqq', 'qqqq', NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (60, 3, 9, 2, '2025-06-21', '2025-06-26', 5, 189000.00, 'waiting', '2025-06-21 14:06:39', '2025-06-21 14:06:39', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (61, 3, 7, 1, '2025-06-21', '2025-06-25', 4, 97500.00, 'rented', '2025-06-21 14:36:24', '2025-06-21 14:40:49', '22222', '22222', '222', '22222222', NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (70, 10, 6, 1, '2025-06-27', '2025-07-01', 4, 156000.00, 'ready', '2025-06-27 10:56:15', '2025-06-27 11:10:51', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (63, 3, 8, 1, '2025-06-21', '2025-06-25', 4, 65000.00, 'rented', '2025-06-21 15:13:38', '2025-06-22 05:18:44', 'asdasdas', 'gjhjhb', 'bbbb', 'bbbbb', NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (57, 3, 4, 1, '2025-06-21', '2025-06-22', 1, 100000.00, 'finished', '2025-06-21 13:23:21', '2025-06-22 05:27:45', 'llll', 'llll', 'lll', 'lll', 'nice');
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (56, 3, 4, 1, '2025-06-21', '2025-06-24', 3, 120000.00, 'return_now', '2025-06-21 12:53:49', '2025-06-22 05:28:40', 'dada', 'aaaa', 'aaaa', 'aaaa', NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (64, 9, 5, 1, '2025-06-22', '2025-06-26', 4, 162500.00, 'finished', '2025-06-22 05:33:47', '2025-06-22 05:35:44', 'aaa', 'bb', 'cc', 'ddd', 'nice');
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (65, 9, 6, 1, '2025-06-22', '2025-06-26', 4, 156000.00, 'finished', '2025-06-22 05:39:13', '2025-06-22 05:48:31', 'dasasd', 'adsasd', 'dasasd', 'dasasdsaasd', 'nice');
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (66, 9, 11, 1, '2025-06-22', '2025-06-25', 3, 48000.00, 'rented', '2025-06-22 05:50:11', '2025-06-22 05:51:56', 'asddsa', 'adasdasd', 'dasasdasdsdddd', 'fdfdgbb', NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (67, 9, 7, 1, '2025-06-22', '2025-06-28', 6, 112500.00, 'finished', '2025-06-22 06:01:28', '2025-06-22 06:07:55', '11111', '11111', '11111', '11111', 'nice');
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (69, 3, 5, 1, '2025-06-26', '2025-07-01', 5, 175000.00, 'waiting', '2025-06-25 14:00:25', '2025-06-25 14:00:25', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (68, 3, 5, 1, '2025-06-22', '2025-06-26', 4, 162500.00, 'canceled', '2025-06-22 15:07:30', '2025-06-26 16:27:03', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (62, 3, 8, 1, '2025-06-21', '2025-06-22', 1, 50000.00, 'canceled', '2025-06-21 14:59:36', '2025-06-26 16:28:53', '66666666666', '666666666', '66666666', '6666666666666', NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (71, 10, 8, 1, '2025-06-30', '2025-07-03', 3, 60000.00, 'rented', '2025-06-27 11:00:07', '2025-06-27 11:10:58', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (72, 10, 9, 2, '2025-06-27', '2025-07-01', 4, 175500.00, 'return_now', '2025-06-27 11:03:40', '2025-06-27 11:11:04', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (73, 10, 7, 1, '2025-06-27', '2025-07-02', 5, 105000.00, 'finished', '2025-06-27 11:06:14', '2025-06-27 11:11:24', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (75, 10, 12, 11, '2025-06-27', '2025-06-30', 3, 60000.00, 'finished', '2025-06-27 11:20:27', '2025-06-27 11:27:50', 'jl sutami 3', '081238123123', 'jam 2 siang sampai 7 malam', 'jangan lupa bawa ktp dan bayar cod ya', 'barang kembali dengan baik');
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (74, 10, 7, 1, '2025-06-27', '2025-07-02', 5, 105000.00, 'waiting', '2025-06-27 11:06:29', '2025-06-27 11:33:02', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (76, 13, 11, 1, '2025-06-27', '2025-07-02', 5, 56000.00, 'waiting', '2025-06-27 12:17:53', '2025-06-27 12:17:53', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (77, 10, 13, 14, '2025-06-27', '2025-06-30', 3, 48000.00, 'canceled', '2025-06-27 12:31:23', '2025-06-27 12:42:38', 'jl sudirman 3', '0847123744', 'jam 12 siang sampai 8 malam', 'jangan lupa bawa ktp dan bayar cod', 'barangnya kembali dengan baik');
INSERT INTO public.orders (id, customer_id, product_id, partner_id, start_date, end_date, duration, total_price, status, created_at, updated_at, pickup_address, contact_number, pickup_time, notes, return_information) VALUES (78, 10, 13, 14, '2025-06-27', '2025-07-02', 5, 56000.00, 'finished', '2025-06-27 12:47:50', '2025-06-27 12:54:30', 'jalan sudirman 4', '082347325', 'jam 12 siang sampai 6 sore', 'jangan lupa bawa ktp', 'barangnya masih bagus');


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (1, 'App\Models\User', 5, 'AdminPostmanTest', 'baa94995b429dda51e70f220933a3d0aad465180cf8e098f59e771cbb9627e5d', '["*"]', '2025-06-11 15:13:38', NULL, '2025-06-11 15:13:14', '2025-06-11 15:13:38');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (2, 'App\Models\User', 5, 'AdminPostmanTest', '0fe93423a20083fa25c3dc448e5a3acab6dfab9f0864b9d02ea1c09ec7fce775', '["*"]', NULL, NULL, '2025-06-11 15:54:47', '2025-06-11 15:54:47');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (3, 'App\Models\User', 5, 'AdminPostmanTest', 'c9a01c26120d2d041b1801faaf9b87325034781762adb076bbbc9bc610bb0dae', '["*"]', '2025-06-12 05:16:59', NULL, '2025-06-12 05:16:28', '2025-06-12 05:16:59');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (4, 'App\Models\User', 5, 'AdminPostmanTest', '4b577953d3e288e361b8b9f79edc1add163f8ea66dfb921f5509137a73cde0f8', '["*"]', NULL, NULL, '2025-06-12 06:04:14', '2025-06-12 06:04:14');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (5, 'App\Models\User', 5, 'AdminPostmanTest', '7b0096a3b78a3bcac43f1f5cd6823d6728f9aeac2217f36f87a723344ac39344', '["*"]', NULL, NULL, '2025-06-12 06:50:09', '2025-06-12 06:50:09');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (22, 'App\Models\User', 5, 'AdminPostmanTest', '2e9269e6821a3aaec114028c91298f5bba9b6060c1a4c52341f6385150059502', '["*"]', '2025-06-22 13:09:10', NULL, '2025-06-15 11:38:20', '2025-06-22 13:09:10');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (7, 'App\Models\User', 5, 'AdminPostmanTest', '33af5a248ccd4f9f5c279ca53eb10aa9bed3d88740c54e05e64d3e42548f3c9b', '["*"]', '2025-06-12 09:59:15', NULL, '2025-06-12 09:54:14', '2025-06-12 09:59:15');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (8, 'App\Models\User', 5, 'AdminPostmanTest', '0c42ad21e0ed042ce9a0201c3392320f1be04ba31c5158b824dfe16c9043de35', '["*"]', NULL, NULL, '2025-06-12 10:08:58', '2025-06-12 10:08:58');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (9, 'App\Models\User', 5, 'flutter_android_app', '0542fafc48f334e731d0c5688de6b51cc0dc0a7b4f75a2693a03cd304162a9f7', '["*"]', NULL, NULL, '2025-06-12 13:59:21', '2025-06-12 13:59:21');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (10, 'App\Models\User', 5, 'flutter_android_app', 'e9f3b5b5c25e843835c128e96e5ab3ddf929a26ad08d10c3fdc511bc1923abe2', '["*"]', NULL, NULL, '2025-06-12 14:00:24', '2025-06-12 14:00:24');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (11, 'App\Models\User', 5, 'flutter_android_app', '3fadb39f8507fbf0bb53a07a4b3f817f35784acf7523b75850485b4ba3d94e69', '["*"]', NULL, NULL, '2025-06-12 14:05:23', '2025-06-12 14:05:23');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (12, 'App\Models\User', 1, 'flutter_android_app', '1466e5ac11017e548c5107d61015bcc2840393fb7e6cd831f0ee0623e4b78e96', '["*"]', NULL, NULL, '2025-06-12 14:29:13', '2025-06-12 14:29:13');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (13, 'App\Models\User', 1, 'flutter_android_app', '41cd18d359f9cf2f5482e11944cfb34d77a58883df77d781da6600235f70426d', '["*"]', NULL, NULL, '2025-06-12 14:48:36', '2025-06-12 14:48:36');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (14, 'App\Models\User', 1, 'flutter_android_app', '8a3bf736da6dc2001ffeefe5881bec47adfb730f09fe6d3241a5929b1c4512b3', '["*"]', NULL, NULL, '2025-06-12 15:30:53', '2025-06-12 15:30:53');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (15, 'App\Models\User', 5, 'flutter_android_app', 'fd0d748d9a54c817ecba3c5d59d0a3682aee21f15f0839e094c23ccd88337336', '["*"]', NULL, NULL, '2025-06-12 15:36:26', '2025-06-12 15:36:26');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (16, 'App\Models\User', 5, 'flutter_android_app', 'f983b8d710f1676f99f835a5821948f72428a8a794d47a2d916f29545bd60896', '["*"]', NULL, NULL, '2025-06-12 15:36:53', '2025-06-12 15:36:53');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (6, 'App\Models\User', 5, 'AdminPostmanTest', '17b5cfb21daaa935db6039dddf9696079eca8e925e7eee225aaa9a2f5b744ea0', '["*"]', '2025-06-13 02:58:01', NULL, '2025-06-12 06:52:19', '2025-06-13 02:58:01');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (17, 'App\Models\User', 5, 'flutter_android_app', '93fe726cea809876dd4ef3ff651893305410227205f6ecd488342c70b8919b6d', '["*"]', NULL, NULL, '2025-06-15 11:31:02', '2025-06-15 11:31:02');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (18, 'App\Models\User', 3, 'flutter_android_app', '1e73e9f89de66cbcca5c388924bfb04557f3c391f44b665ad43407275a02541d', '["*"]', NULL, NULL, '2025-06-15 11:31:28', '2025-06-15 11:31:28');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (19, 'App\Models\User', 5, 'flutter_android_app', '56006de8ae767ca75f01956dbb3922e8f0eb856efca87449b6aa154328c7ea28', '["*"]', NULL, NULL, '2025-06-15 11:34:27', '2025-06-15 11:34:27');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (20, 'App\Models\User', 3, 'flutter_android_app', '7d526fbdef7eb3cdcf5be610fe16a376c15f6b078f145cb2e17f23e70f45a9c4', '["*"]', NULL, NULL, '2025-06-15 11:34:43', '2025-06-15 11:34:43');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (21, 'App\Models\User', 3, 'flutter_android_app', '99ce0942f2fde8f02c816a8bb59e28d8b4fd28f96082506ff3246a3227aa7d06', '["*"]', NULL, NULL, '2025-06-15 11:34:58', '2025-06-15 11:34:58');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (23, 'App\Models\User', 3, 'flutter_android_app', '631d774e1d99be459478634f385e36b24a93314fd9b4b70ef079229f5d8919e2', '["*"]', NULL, NULL, '2025-06-15 12:32:16', '2025-06-15 12:32:16');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (25, 'App\Models\User', 3, 'flutter_android_app', '8d1b226eb3f59e648b4647d502904d8cd252ee701271a3e2dc414f36b507ea41', '["*"]', NULL, NULL, '2025-06-15 14:20:40', '2025-06-15 14:20:40');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (26, 'App\Models\User', 3, 'flutter_android_app', '24573fa7b1f883532b00ece9e032b678ce821a2eb03adb2a562e5a749a5664c3', '["*"]', NULL, NULL, '2025-06-15 14:24:32', '2025-06-15 14:24:32');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (27, 'App\Models\User', 3, 'flutter_android_app', '347c1050f01df7c753c598f6988b779acd63eddcf3695f2a2cb73e27f5ff4dad', '["*"]', NULL, NULL, '2025-06-15 14:33:41', '2025-06-15 14:33:41');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (28, 'App\Models\User', 3, 'flutter_android_app', 'c7126221c614545ebecc84fd7485eb8cff83b463819bcde400fd28f771b54d32', '["*"]', NULL, NULL, '2025-06-15 16:32:19', '2025-06-15 16:32:19');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (29, 'App\Models\User', 3, 'flutter_android_app', '1d24c3be6cc3f512c36d36cf02ca8409e481807741c5a4ebde3b9dded50b171b', '["*"]', NULL, NULL, '2025-06-16 00:52:42', '2025-06-16 00:52:42');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (30, 'App\Models\User', 3, 'flutter_android_app', '14994ed700aed993d296898e5cc58d426b10c0f9865e1b38b62891cf2b5b2b81', '["*"]', NULL, NULL, '2025-06-16 00:58:09', '2025-06-16 00:58:09');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (31, 'App\Models\User', 1, 'flutter_android_app', 'a8538f61585bc28bdf79e135e61398e7a7f8a931bbfea424120fd8f7b5764110', '["*"]', NULL, NULL, '2025-06-16 01:04:13', '2025-06-16 01:04:13');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (32, 'App\Models\User', 3, 'flutter_android_app', 'e0376b8e2e821661553def5ad2205beb23fe755f2f1ea624a26ab7b7f53f4fed', '["*"]', NULL, NULL, '2025-06-16 01:05:02', '2025-06-16 01:05:02');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (33, 'App\Models\User', 5, 'AdminPostmanTest', '094e73a0d6d3b3498c689b03a9b32501280e04b40796a9951c4a5b82dad22b7e', '["*"]', NULL, NULL, '2025-06-16 01:14:57', '2025-06-16 01:14:57');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (34, 'App\Models\User', 5, 'AdminPostmanTest', '0f1e6b23542b7b6195cb00a589c23de9b3bac6045e7b25be4d6ed210ac91d340', '["*"]', NULL, NULL, '2025-06-16 01:25:13', '2025-06-16 01:25:13');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (35, 'App\Models\User', 3, 'flutter_android_app', '8d9f28f9ecb982cefc8e2e021a62c34b646542e0168ae81b6c2efdf7c91baac6', '["*"]', NULL, NULL, '2025-06-16 01:25:41', '2025-06-16 01:25:41');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (36, 'App\Models\User', 5, 'flutter_android_app', '11981a55974463c8d824264f9b8e3aeb8a7f88721286d6720f3ae9b6e3d52db9', '["*"]', NULL, NULL, '2025-06-16 03:31:53', '2025-06-16 03:31:53');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (37, 'App\Models\User', 5, 'flutter_android_app', 'cd162b6e1ce8beda3aa4f5d93cfe7d2510fc10b31d3637a000c536a9dc5ca7fa', '["*"]', NULL, NULL, '2025-06-16 03:33:08', '2025-06-16 03:33:08');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (38, 'App\Models\User', 3, 'flutter_android_app', 'fc79fb10b3b236de1525a4a6beeb3187e5952ca9e06977ef085b8e1c6a1af891', '["*"]', NULL, NULL, '2025-06-16 03:33:25', '2025-06-16 03:33:25');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (39, 'App\Models\User', 3, 'flutter_android_app', '3b52e1d3e4b519595b4ad92ef1ee82cba8a42035540e4325b7bdf0980cc9acc9', '["*"]', NULL, NULL, '2025-06-16 04:00:46', '2025-06-16 04:00:46');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (24, 'App\Models\User', 5, 'AdminPostmanTest', 'a5d880b01e1ae89857eb3b4ee0e305bc143233461cc8db49b783f942c5d6707e', '["*"]', '2025-06-22 13:09:24', NULL, '2025-06-15 12:48:00', '2025-06-22 13:09:24');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (40, 'App\Models\User', 3, 'flutter_android_app', '0d65ff3f9e5fd5113da102af4e4a9b1f6a5a2a3de2e44b760904ddcc3cfbcd34', '["*"]', NULL, NULL, '2025-06-16 04:13:34', '2025-06-16 04:13:34');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (41, 'App\Models\User', 5, 'flutter_android_app', '478f54c70a0a952646f51cd19580aad246f3a7166156604d37b5cd60f1f02088', '["*"]', NULL, NULL, '2025-06-19 16:03:13', '2025-06-19 16:03:13');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (42, 'App\Models\User', 3, 'flutter_android_app', '396cf31534f93f3878f191a039205fe29c4fb7ed4245d9d3443d1aa0dad8c8b4', '["*"]', NULL, NULL, '2025-06-19 16:05:20', '2025-06-19 16:05:20');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (43, 'App\Models\User', 5, 'AdminPostmanTest', 'ffa9bda8803889dc10309b253b626d9150ab2d64bbdf986744aca3b6ca4fa1a1', '["*"]', NULL, NULL, '2025-06-20 02:21:33', '2025-06-20 02:21:33');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (44, 'App\Models\User', 9, 'flutter_android_app', '07468ac9f16e167efc16a93337b0417a844227dfb106fecaf87511ddb1365b1a', '["*"]', NULL, NULL, '2025-06-20 13:48:02', '2025-06-20 13:48:02');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (45, 'App\Models\User', 5, 'AdminPostmanTest', 'aeb4f35fb8ee25041d17ead2c11a76e6d886f9f79a132b5e06c0fa0804dda12f', '["*"]', NULL, NULL, '2025-06-22 06:32:25', '2025-06-22 06:32:25');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (47, 'App\Models\User', 9, 'flutter_android_app', '94f058f2df84fd9dce7801ba374124d899eb8e6059c148f0aff9854466cce74b', '["*"]', NULL, NULL, '2025-06-22 13:28:48', '2025-06-22 13:28:48');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (48, 'App\Models\User', 9, 'flutter_android_app', '49aadb0f735822700d14ddd466f7b362e75c554dc1950296cca6a2f2ccc8201a', '["*"]', NULL, NULL, '2025-06-22 13:33:56', '2025-06-22 13:33:56');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (49, 'App\Models\User', 9, 'flutter_android_app', '173c197067c64df8afbdb10a2db5ebb1ad856106c0c6ce6e2e13e9172e9d46df', '["*"]', NULL, NULL, '2025-06-22 13:39:31', '2025-06-22 13:39:31');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (50, 'App\Models\User', 9, 'flutter_android_app', '5da8ff15758b0e66beebd4b7e856a4a84ac6bef01eb9ab5ddee1c392bdf4d1ef', '["*"]', NULL, NULL, '2025-06-22 13:56:29', '2025-06-22 13:56:29');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (51, 'App\Models\User', 9, 'flutter_android_app', 'e03f8d132b5b1f45563a0620617e775ea36429dce1e0099ca004e8b778f1843a', '["*"]', NULL, NULL, '2025-06-22 13:59:42', '2025-06-22 13:59:42');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (52, 'App\Models\User', 9, 'flutter_android_app', 'c17273ed6ea524c0c6132a6bc8f9787e0a97624cd5ca5dca70eb81d49f54636c', '["*"]', NULL, NULL, '2025-06-22 14:05:40', '2025-06-22 14:05:40');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (53, 'App\Models\User', 9, 'flutter_android_app', '545c3e1ac96c7ce222e366e5fed2f6def49642850e3672b4d8c6b23975f7e70e', '["*"]', NULL, NULL, '2025-06-22 14:19:04', '2025-06-22 14:19:04');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (54, 'App\Models\User', 3, 'flutter_android_app', 'd39c036bdf1bd648cc1eb7dfc84a17fcc081de3317480cf8145289983303ce17', '["*"]', NULL, NULL, '2025-06-22 14:28:39', '2025-06-22 14:28:39');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (46, 'App\Models\User', 9, 'PostmanTest', 'e16c8ead74a0d6d47ec70561577f8a4e0559a7ecb6df697a9a783fbb43eaf092', '["*"]', '2025-06-22 14:32:21', NULL, '2025-06-22 13:10:33', '2025-06-22 14:32:21');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (55, 'App\Models\User', 9, 'flutter_android_app', '79b31d5caaf24ddfdc8cf591b88045cf9cf303c1dd99cc823ddca52e4ca30b54', '["*"]', NULL, NULL, '2025-06-22 15:20:41', '2025-06-22 15:20:41');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (56, 'App\Models\User', 3, 'flutter_android_app', 'aa3bcbf59930b6a113e8a84ae86f314c0d6fa43f125e91d2f5376f4daf6895fb', '["*"]', NULL, NULL, '2025-06-27 09:03:16', '2025-06-27 09:03:16');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (57, 'App\Models\User', 9, 'flutter_android_app', 'a77f885ee721ab4b0c063f84ae86535aaf9cc0576a7d73f0e8b1c0c80b84c51e', '["*"]', NULL, NULL, '2025-06-27 09:09:51', '2025-06-27 09:09:51');
INSERT INTO public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) VALUES (58, 'App\Models\User', 9, 'flutter_android_app', '65fae8a0ce46953cf1cb3867d507ede24a9595fc9186c977f8465878bec32357', '["*"]', NULL, NULL, '2025-06-27 09:32:07', '2025-06-27 09:32:07');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.products (id, partner_id, name, description, storage, color, rent_price, max_rent_day, stock, image, created_at, updated_at) VALUES (7, 1, 'iPhone 11  128GB White', 'Support magsafe charger

Material premium, Tidak perlu melepas case Magthin untuk pengisian daya magsafe, karena di lengkapi 3 lapisan, marking paint, built-in 38pcs magnet, sealants.



Screen lips & camera guard

Bagian tepian atas dan bawah lebih tinggi 0.3mm, berfungsi sebagai pelindung kamera tidak tergores Ketika di letakkan pada permukaan.



Thin and Light

Memiliki bobot hanya 10 gram dengan ketebalan hanya 0.6mm.', '128GB', 'White', 75000.00, 14, 18, 'product_images/nxQqY5qzEYI0ePchNtHXQlIJ3sLgpxFYRA4stUPg.jpg', '2025-06-14 15:30:20', '2025-06-27 11:06:29');
INSERT INTO public.products (id, partner_id, name, description, storage, color, rent_price, max_rent_day, stock, image, created_at, updated_at) VALUES (11, 1, 'iPhone 7', 'Apple Iphone 7 merupakan iPhone generasi ketujuh yang dikeluarkan oleh Apple dengan performa yang terbaik di kelasnya serta disertai dengan desain yang sleek dan smooth untuk memberikan kesan yang premium saat memiliki Iphone 7 ini. Menggunakan Chipset Apple A10 Fusion serta kecepatan membaca data dengan bantuan Quad Core 2.34 Ghz agar performa iPhone 7 ini tetap stabil dan kuat saat menggunakan berbagai aplikasi disaat yang bersamaan. Ditambah dengan kapasitas penyimpanan memori hingga 256GB tidak akan membuat kamu merasa kekurangan dalam menyimpan berbagai foto, video, aplikasi dan file lainnya. Tidak perlu diragukan lagi di sektor kamera, iPhone 7 menggunakan kamera 12 MP ditambah OIS yang dapat menstabilkan pengambilan gambar, juga terdapat fitur HDR yang dapat memberikan gambar yang terang, dan jernih. Kamera iPhone 7 juga dapat merekam video dengan resolusi 720P hingga 4K dengan 30-120FPS untuk hasil yang lebih mulus. Menggunakan layar Retina IPS LCD untuk memberikan tampilan warna yang detail.', '128GB', 'Silver', 40000.00, 14, 1, 'product_images/wZOg1VUgU4wvwB1QFlNfPKNx4LqtLTYXWPKoqK7v.jpg', '2025-06-18 12:26:18', '2025-06-27 12:17:53');
INSERT INTO public.products (id, partner_id, name, description, storage, color, rent_price, max_rent_day, stock, image, created_at, updated_at) VALUES (4, 1, 'iPhone 12 Pro', 'iPhone 12 Pro memiliki layar Super Retina XDR 6.1 inci, chip A14 Bionic, dan sistem kamera Pro dengan tiga lensa. Ponsel ini juga mendukung 5G dan memiliki desain elegan berbahan stainless steel dan kaca keramik. 



Berikut spesifikasi ringkas iPhone 12 Pro: 

Layar: 6.1 inci Super Retina XDR (OLED) dengan resolusi 2532 x 1170 piksel pada 460 ppi.

Chipset: Apple A14 Bionic.

RAM: 6 GB LPDDR4X-4266.

Penyimpanan Internal: 128GB, 256GB, atau 512GB.

Kamera Belakang: Tiga lensa 12MP (wide, ultrawide, telephoto) dengan LiDAR scanner.

Kamera Depan: 12MP.

Baterai: 2815 mAh.

Jaringan: Mendukung 5G.

Fitur Tambahan: Sertifikasi IP68 untuk ketahanan terhadap debu dan air, serta dukungan untuk pengisian daya MagSafe.', '256', 'Gold', 90000.00, 3, 34, 'product_images/TRWfz4CNk7H8AC1zTRMtbks8Gd7jlZuWiFhXyIwv.jpg', '2025-06-13 15:33:09', '2025-06-26 15:54:39');
INSERT INTO public.products (id, partner_id, name, description, storage, color, rent_price, max_rent_day, stock, image, created_at, updated_at) VALUES (6, 1, 'iPhone 12 Pro Max 256GB Blue', 'RAM: 6 GB

Storage: 256 GB

Display: Super Retina XDR OLED, HDR10, Dolby Vision, 800 nits (HBM), 1200 nits (peak)

Camera: 12 MP

OS: iOS 14.1, up to iOS 15.5, planned upgrade to iOS 16', '256GB', 'Blue', 120000.00, 5, 3, 'product_images/SGvu0UGElMtge596MT65XrdAquVD4UO8PVSN4ZVf.jpg', '2025-06-14 15:25:02', '2025-06-27 10:56:16');
INSERT INTO public.products (id, partner_id, name, description, storage, color, rent_price, max_rent_day, stock, image, created_at, updated_at) VALUES (5, 1, 'iPhone 15 Pro Black Titanium 128GB', 'iPhone 15 Pro. Lahir dari titanium dan dilengkapi chip A17 Pro terobosan, tombol Tindakan yang dapat disesuaikan, dan sistem kamera Pro yang lebih serbaguna.', '128GB', 'Black Titanium', 125000.00, 7, 0, 'product_images/SVzGUSRydZc0F5roLXMmpalZiA3q72ZsTvMFLghs.jpg', '2025-06-13 15:43:58', '2025-06-25 14:00:25');
INSERT INTO public.products (id, partner_id, name, description, storage, color, rent_price, max_rent_day, stock, image, created_at, updated_at) VALUES (8, 1, 'iPhone 8 64GB Gold', 'iPhone 8 - Description

Combine a brand-new glass design, one of the most popular cameras in the world and a high-performance smartphone-chip, and you get the refurbed iPhone 8. This iconic Apple product from 2017 is the enormously competent successor to the iPhone 7. It still retains the basic form of the 7, but has been improved in every aspect as far as its technology is concerned.



iPhone 8 Colour: Gold, Red, Silver, Space Grey

Memory: 64 GB, 128 GB, 256 GB

Camera: 12 MP

refurbed Warranty: 12 Months', '64GB', 'Gold', 50000.00, 7, 4, 'product_images/Hy3G7POPS3p3EnSjd4B6A9WnMIxyOgc3zcN2bvDS.jpg', '2025-06-14 15:42:36', '2025-06-27 11:00:08');
INSERT INTO public.products (id, partner_id, name, description, storage, color, rent_price, max_rent_day, stock, image, created_at, updated_at) VALUES (9, 2, 'iPhone 13 Pro Max 128GB Gold', 'iPhone 13 Pro Max, 128GB, Emas:

Pemutaran video hingga 28 jam, masa pakai baterai terbaik di iPhone ┬▓

Layar Super Retina XDR 6,7 inci dengan ProMotion untuk rasa yang lebih cepat dan lebih responsif ┬▓

A15 Bionic chip untuk kinerja secepat kilat

5G untuk unduhan super cepat dan streaming berkualitas tinggi ┬╣

iOS 15 mengemas fitur-fitur baru untuk melakukan lebih banyak dengan iPhone daripada sebelumnya Γü╢

Mode sinematik menambah kedalaman bidang yang dangkal dan menggeser fokus secara otomatis di video Anda

Sistem kamera Pro dengan kamera 12MP Telephoto, Wide, dan Ultra Wide baru; LiDAR Scanner; Rentang zoom optik 6x; fotografi makro; Gaya Fotografi, video ProRes, ┬│ Smart HDR 4, Mode Malam, Apple Pro RAW, rekaman 4K Dolby Vision HDR

Kamera depan True Depth 12MP dengan mode Malam, rekaman 4K Dolby Vision HDR

Desain yang tahan lama dengan Keramik Shield

Tahan air IP68 terkemuka di industri Γü╡

Mendukung aksesori MagSafe untuk pemasangan yang mudah dan pengisian nirkabel yang lebih cepat Γü╖', '128GB', 'Gold', 135000.00, 14, 2, 'product_images/JZ7oevjyiTqalwNIst4UFfECF6U5aPZ8lxKLOQDm.jpg', '2025-06-17 13:03:14', '2025-06-27 11:03:40');
INSERT INTO public.products (id, partner_id, name, description, storage, color, rent_price, max_rent_day, stock, image, created_at, updated_at) VALUES (12, 11, 'iPhone X', 'Produk deskripsi iphone x ada disini', '256GB', 'White', 50000.00, 14, 1, 'product_images/xHEytXycHw0AY1tQ7qKqLKhK4oejayhJnkbcQP2Q.jpg', '2025-06-27 11:19:37', '2025-06-27 11:20:27');
INSERT INTO public.products (id, partner_id, name, description, storage, color, rent_price, max_rent_day, stock, image, created_at, updated_at) VALUES (13, 14, 'iPhone X', 'Deskripsi disini', '256GB', 'White', 40000.00, 14, 2, 'product_images/MdeVlc5LhNlXSJRWQz7z0uzPU8JTokatavhAbK3b.jpg', '2025-06-27 12:27:48', '2025-06-27 12:47:51');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) VALUES ('NMXUi0mYj9YA6bZAbJl6MvX8xmMGjyuJqEOyiKWb', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoienFwTTVxSUdvUlBVVFd1STRzdFdjdkYxRG85Z0pzYWdVRlIxY0lmZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTt9', 1749654012);
INSERT INTO public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) VALUES ('GRkfGXA3U5oLW4BQRorqAFqRaUatwj2ocO0EfmyJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYmVneEdHQ1BMNDB5blQzSmlxY0dSY2RsMGZKZTk4RWhvbnBZZnR0USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1749650853);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (2, 'Partner Two', 'partner2@example.com', '2025-06-11 11:45:28', '$2y$12$KBOkE4woIE2lWt9DGXa3/.imuNqZUW39vCPO8kzgxJi5SsWWxAtIy', 'rKPGlDnCDlrVw27I5KGEddOzS86kD3c0DSWHgfgv4eYORlFB6yYu1dHEDnhB', '2025-06-11 11:45:28', '2025-06-11 11:45:28', 'partner', NULL, NULL, NULL, true, false, 'avatar.png', false, NULL);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (1, 'Partner One', 'partner1@example.com', '2025-06-11 11:45:24', '$2y$12$KBOkE4woIE2lWt9DGXa3/.imuNqZUW39vCPO8kzgxJi5SsWWxAtIy', '8bCwHJOxKfbMXsqTcDOHMPzVJIO2AMiiH0Xxp15VJjC2yi3KgO1NxU5ydcbF', '2025-06-11 11:45:24', '2025-06-20 09:40:17', 'partner', NULL, NULL, NULL, true, false, 'avatar.png', false, NULL);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (5, 'Admin User', 'admin@example.com', '2025-06-11 11:45:34', '$2y$12$KBOkE4woIE2lWt9DGXa3/.imuNqZUW39vCPO8kzgxJi5SsWWxAtIy', '8qrqwevG5VMd24gl8fKzut0IswsgTQsmpCr81S5hiPg9WJxP3odUpHnRcnFr', '2025-06-11 11:45:34', '2025-06-11 11:45:34', 'admin', NULL, NULL, NULL, true, false, 'avatar.png', false, NULL);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (14, 'demo partner', 'demopartner@example.com', NULL, '$2y$12$7ZtVXtaLGijwACOjfsEQDu2d9VPZSTP8t4qDMGIyDNV6ZvRGA3yay', 'QfXNw51P8iWb13udm36bw8Dpb7ZOUblhvbSkKtM05d6DdV2fiB1CmEWM8U6E', '2025-06-27 12:25:53', '2025-06-27 12:26:13', 'partner', '0893579375', 'ktp_photos/MKQh8JAFidl7PyTlwfpdzo6URNvXivxBlvbd2yEf.png', 'jl sudirman 2', true, false, 'avatar.png', false, NULL);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (7, 'udin', 'udin@gmail.com', NULL, '$2y$12$ASkRvjxLuLHtx05/ZZRtIOi5zA0IhoF/OXV94gCUCBfitkdwRiiay', NULL, '2025-06-13 05:06:26', '2025-06-13 05:08:28', 'customer', '081231231', 'ktp_photos/V6SJjTCeRb1WIsLvppRg9AT4fVCMTCbdkfgwZbdI.png', 'jl sudina', true, false, 'avatar.png', false, NULL);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (10, 'customer demo', 'custdemo@example.com', NULL, '$2y$12$m7dm1dgeAuKuIxeXg0YKouTqxcqFXHuQ53z4/lWEMgLyAThGaOmKe', NULL, '2025-06-27 10:52:56', '2025-06-27 12:17:33', 'customer', '081238912839123', 'ktp_photos/KRB6NfMf1wxlPVmZuyRJ6gAvRhHRL5s1QLPZMTeR.png', 'jl. sutami', true, false, 'avatar.png', false, NULL);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (13, 'demo customer', 'democustomer@example.com', NULL, '$2y$12$4xn3m./.gw.2Rqni8PIEr.mM9OP5XpENwgAQCXb/82u.LhhwWwxG6', 'YIMBKike8fsc7aIUsOFTmAGLKOlbCkYf6a5gXEGQrFB935gKS0oMPYL9LtA7', '2025-06-27 12:14:00', '2025-06-27 12:14:44', 'customer', '0812312421', 'ktp_photos/m80wwoElq1kZ4Ejofnt2Vwd7iRdtD70VzCZR6KO2.png', 'jl sudirman', true, false, 'avatar.png', false, NULL);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (4, 'Customer Two', 'customer2@example.com', '2025-06-11 11:45:33', '$2y$12$KBOkE4woIE2lWt9DGXa3/.imuNqZUW39vCPO8kzgxJi5SsWWxAtIy', 'An0oQRqagy', '2025-06-11 11:45:33', '2025-06-18 17:30:03', 'customer', NULL, NULL, NULL, true, false, 'avatar.png', false, NULL);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (3, 'Customer One', 'customer1@example.com', '2025-06-11 11:45:32', '$2y$12$KBOkE4woIE2lWt9DGXa3/.imuNqZUW39vCPO8kzgxJi5SsWWxAtIy', 'aKAgKl1PMIzDuTxQD3zM8YQFJNunRDWV0FVqxr19jD7csgH8l73HjlfdVfHj', '2025-06-11 11:45:32', '2025-06-20 09:31:53', 'customer', NULL, NULL, NULL, true, false, 'avatar.png', false, '#2180f3');
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (9, 'customer alpha', 'custalpha@example.com', NULL, '$2y$12$tZj5ege9/o9b3jEEzJBjfO..JjyEvHJ7vvKXPkwAzAeIfpnoRQxsi', 'yIjDkU13JGcTi8GoCys4JtbLRHX0sKyrrPgeUvQAbqBe8LVLVkKysjdRvc3K', '2025-06-17 11:23:48', '2025-06-17 11:25:33', 'customer', '081234123412', 'ktp_photos/wh9gPZcwI13bou8fjS48sBmnu5XQSAkEy1TPTVTk.jpg', 'tel aviv', true, false, 'avatar.png', false, NULL);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (11, 'partner demo', 'partnerdemo@example.com', NULL, '$2y$12$.m2lj1LuWHTyke6KlT4vP.eGKSp5gGTnXCFUHaxe1gkNJ9zrBdfQO', NULL, '2025-06-27 11:15:34', '2025-06-27 11:16:27', 'partner', '081231233321', 'ktp_photos/ruetFqh5BrT170YMqEjHlfvPvqSWNnKx1ncHi5gT.png', 'jl sutami 2', true, false, 'avatar.png', false, NULL);
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, phone, ktp_photo, address, is_verified, active_status, avatar, dark_mode, messenger_color) VALUES (15, 'tes', 'tes@gmail.com', NULL, '$2y$12$8yD5WBYXddHBWFBZnTgg8O1fnvMBJ4Rn2YzwXqChU0/DLt/fS0V2G', NULL, '2025-06-27 12:40:17', '2025-06-27 12:41:44', 'customer', '1412321', 'ktp_photos/KVgev7jwTqHXVC25eAYNgRNeNCGw2p7i9gRKYur1.png', 'jl sudirman 7', true, false, 'avatar.png', false, NULL);


--
-- Data for Name: wire_actions; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- Data for Name: wire_attachments; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- Data for Name: wire_conversations; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.wire_conversations (id, type, disappearing_started_at, disappearing_duration, created_at, updated_at) VALUES (1, 'private', NULL, NULL, '2025-06-18 16:36:23', '2025-06-18 16:37:41');


--
-- Data for Name: wire_groups; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- Data for Name: wire_messages; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.wire_messages (id, conversation_id, sendable_id, sendable_type, reply_id, body, type, kept_at, deleted_at, created_at, updated_at) VALUES (1, 1, 3, 'App\Models\User', NULL, 'Γ¥ñ∩╕Å', 'text', NULL, NULL, '2025-06-18 16:37:40', '2025-06-18 16:37:40');


--
-- Data for Name: wire_participants; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.wire_participants (id, conversation_id, role, participantable_id, participantable_type, exited_at, last_active_at, conversation_cleared_at, conversation_deleted_at, conversation_read_at, deleted_at, created_at, updated_at) VALUES (2, 1, 'owner', 9, 'App\Models\User', NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-18 16:36:24', '2025-06-18 16:36:24');
INSERT INTO public.wire_participants (id, conversation_id, role, participantable_id, participantable_type, exited_at, last_active_at, conversation_cleared_at, conversation_deleted_at, conversation_read_at, deleted_at, created_at, updated_at) VALUES (1, 1, 'owner', 3, 'App\Models\User', NULL, '2025-06-18 16:38:16', NULL, NULL, '2025-06-18 16:38:15', NULL, '2025-06-18 16:36:24', '2025-06-18 16:38:16');


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 54, true);


--
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.feedback_id_seq', 13, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.jobs_id_seq', 76, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.migrations_id_seq', 26, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.notifications_id_seq', 138, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.orders_id_seq', 78, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 58, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.products_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- Name: wire_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.wire_actions_id_seq', 1, false);


--
-- Name: wire_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.wire_attachments_id_seq', 1, false);


--
-- Name: wire_conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.wire_conversations_id_seq', 1, true);


--
-- Name: wire_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.wire_groups_id_seq', 1, false);


--
-- Name: wire_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.wire_messages_id_seq', 1, true);


--
-- Name: wire_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.wire_participants_id_seq', 2, true);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: ch_favorites ch_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.ch_favorites
    ADD CONSTRAINT ch_favorites_pkey PRIMARY KEY (id);


--
-- Name: ch_messages ch_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.ch_messages
    ADD CONSTRAINT ch_messages_pkey PRIMARY KEY (id);


--
-- Name: wire_participants conv_part_id_type_unique; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_participants
    ADD CONSTRAINT conv_part_id_type_unique UNIQUE (conversation_id, participantable_id, participantable_type);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wire_actions wire_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_actions
    ADD CONSTRAINT wire_actions_pkey PRIMARY KEY (id);


--
-- Name: wire_attachments wire_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_attachments
    ADD CONSTRAINT wire_attachments_pkey PRIMARY KEY (id);


--
-- Name: wire_conversations wire_conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_conversations
    ADD CONSTRAINT wire_conversations_pkey PRIMARY KEY (id);


--
-- Name: wire_groups wire_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_groups
    ADD CONSTRAINT wire_groups_pkey PRIMARY KEY (id);


--
-- Name: wire_messages wire_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_messages
    ADD CONSTRAINT wire_messages_pkey PRIMARY KEY (id);


--
-- Name: wire_participants wire_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_participants
    ADD CONSTRAINT wire_participants_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: orders_created_at_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX orders_created_at_index ON public.orders USING btree (created_at);


--
-- Name: orders_customer_id_created_at_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX orders_customer_id_created_at_index ON public.orders USING btree (customer_id, created_at);


--
-- Name: orders_partner_id_created_at_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX orders_partner_id_created_at_index ON public.orders USING btree (partner_id, created_at);


--
-- Name: orders_status_created_at_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX orders_status_created_at_index ON public.orders USING btree (status, created_at);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: wire_actions_actionable_id_actionable_type_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_actions_actionable_id_actionable_type_index ON public.wire_actions USING btree (actionable_id, actionable_type);


--
-- Name: wire_actions_actor_id_actor_type_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_actions_actor_id_actor_type_index ON public.wire_actions USING btree (actor_id, actor_type);


--
-- Name: wire_actions_type_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_actions_type_index ON public.wire_actions USING btree (type);


--
-- Name: wire_attachments_attachable_id_attachable_type_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_attachments_attachable_id_attachable_type_index ON public.wire_attachments USING btree (attachable_id, attachable_type);


--
-- Name: wire_attachments_attachable_type_attachable_id_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_attachments_attachable_type_attachable_id_index ON public.wire_attachments USING btree (attachable_type, attachable_id);


--
-- Name: wire_conversations_type_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_conversations_type_index ON public.wire_conversations USING btree (type);


--
-- Name: wire_messages_conversation_id_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_messages_conversation_id_index ON public.wire_messages USING btree (conversation_id);


--
-- Name: wire_messages_sendable_id_sendable_type_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_messages_sendable_id_sendable_type_index ON public.wire_messages USING btree (sendable_id, sendable_type);


--
-- Name: wire_participants_conversation_cleared_at_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_participants_conversation_cleared_at_index ON public.wire_participants USING btree (conversation_cleared_at);


--
-- Name: wire_participants_conversation_deleted_at_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_participants_conversation_deleted_at_index ON public.wire_participants USING btree (conversation_deleted_at);


--
-- Name: wire_participants_conversation_read_at_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_participants_conversation_read_at_index ON public.wire_participants USING btree (conversation_read_at);


--
-- Name: wire_participants_exited_at_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_participants_exited_at_index ON public.wire_participants USING btree (exited_at);


--
-- Name: wire_participants_role_index; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE INDEX wire_participants_role_index ON public.wire_participants USING btree (role);


--
-- Name: feedback feedback_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: messages messages_from_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_from_user_id_foreign FOREIGN KEY (from_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: messages messages_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: messages messages_to_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_to_user_id_foreign FOREIGN KEY (to_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: notifications notifications_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: orders orders_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: orders orders_partner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_partner_id_foreign FOREIGN KEY (partner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: products products_partner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_partner_id_foreign FOREIGN KEY (partner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: wire_messages wire_messages_conversation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_messages
    ADD CONSTRAINT wire_messages_conversation_id_foreign FOREIGN KEY (conversation_id) REFERENCES public.wire_conversations(id) ON DELETE CASCADE;


--
-- Name: wire_messages wire_messages_reply_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_messages
    ADD CONSTRAINT wire_messages_reply_id_foreign FOREIGN KEY (reply_id) REFERENCES public.wire_messages(id) ON DELETE SET NULL;


--
-- Name: wire_participants wire_participants_conversation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.wire_participants
    ADD CONSTRAINT wire_participants_conversation_id_foreign FOREIGN KEY (conversation_id) REFERENCES public.wire_conversations(id) ON DELETE CASCADE;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

