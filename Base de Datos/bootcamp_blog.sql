PGDMP     
                    {            bootcamp_BLOG    14.7    14.7                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16492    bootcamp_BLOG    DATABASE     Z   CREATE DATABASE "bootcamp_BLOG" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE "bootcamp_BLOG";
                postgres    false            �            1259    16510    comentarios    TABLE     �   CREATE TABLE public.comentarios (
    id integer NOT NULL,
    id_post integer,
    descripcion text,
    id_user integer NOT NULL
);
    DROP TABLE public.comentarios;
       public         heap    postgres    false            �            1259    16538    comentarios_id_seq    SEQUENCE     {   CREATE SEQUENCE public.comentarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.comentarios_id_seq;
       public          postgres    false            �            1259    16503    posts    TABLE     �   CREATE TABLE public.posts (
    id integer NOT NULL,
    titulo character varying,
    descripcion text,
    id_user integer,
    estado character varying,
    fec_creado timestamp without time zone,
    fec_modif timestamp without time zone
);
    DROP TABLE public.posts;
       public         heap    postgres    false                       0    0    COLUMN posts.descripcion    COMMENT     E   COMMENT ON COLUMN public.posts.descripcion IS 'Content of the post';
          public          postgres    false    210            �            1259    16537    posts_id_seq    SEQUENCE     u   CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          postgres    false            �            1259    16539    usuario_id_seq    SEQUENCE     w   CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          postgres    false            �            1259    16493    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre_user character varying,
    fec_creado timestamp without time zone
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false                      0    16510    comentarios 
   TABLE DATA           H   COPY public.comentarios (id, id_post, descripcion, id_user) FROM stdin;
    public          postgres    false    211   �                 0    16503    posts 
   TABLE DATA           `   COPY public.posts (id, titulo, descripcion, id_user, estado, fec_creado, fec_modif) FROM stdin;
    public          postgres    false    210   �                 0    16493    usuarios 
   TABLE DATA           ?   COPY public.usuarios (id, nombre_user, fec_creado) FROM stdin;
    public          postgres    false    209   �                  0    0    comentarios_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.comentarios_id_seq', 1, false);
          public          postgres    false    213                       0    0    posts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_id_seq', 1, false);
          public          postgres    false    212                       0    0    usuario_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuario_id_seq', 1, false);
          public          postgres    false    214            u           2606    16516    comentarios comentarios_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_pkey;
       public            postgres    false    211            s           2606    16509    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    210            q           2606    16499    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    209            w           2606    16532 $   comentarios comentarios_id_post_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_id_post_fkey FOREIGN KEY (id_post) REFERENCES public.posts(id);
 N   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_id_post_fkey;
       public          postgres    false    211    210    3443            x           2606    16541 $   comentarios comentarios_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.usuarios(id);
 N   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_id_user_fkey;
       public          postgres    false    209    3441    211            v           2606    16517    posts posts_id_user_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.usuarios(id);
 B   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_id_user_fkey;
       public          postgres    false    209    210    3441                  x������ � �            x������ � �            x������ � �     